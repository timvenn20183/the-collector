require 'rubygems'
require '../config/environment'
require 'csv'
require 'iconv'
require 'roo'
require 'digest/md5'

# NOTES
# -----
# line 1 contains the column titles so we ignore it
# processing stops when we find and empty field in the ID column

# we use the collection_id as the primary key

items_processed = Array.new
line_counter = 2 # we skip the first line
custom_field_start_column = 'L'
blacklisted_headers = ['id','updated_at','created_at','slug']
required_headers = ['collection_id','name','year','cost','value','reference','collections','categories','conditions','rolodexes','images']
item_fields = Array.new

# connect to google
username = ARGV[0]
password = ARGV[1]
file_key = ARGV[2]
id = ARGV[3]

# connect to google
session = GoogleDrive.login(username,password)
sheet = session.spreadsheet_by_key(file_key).worksheets[0]

# we have the sheet so lets start processing

# get headers and their columns

headers = Hash.new
for col in 1..sheet.num_cols
	headers[sheet[1,col].downcase] = col
end

# validate headers
headers.each do |header,index|
	if blacklisted_headers.include?(header.downcase)
		puts "The following column header is reserved : " + header
		exit
	end
end

# do we have the minimum required headers on the spreadsheet?
required_headers.each do |header|
	if !headers.include?(header.downcase)
			puts "Please note that you are missing a '" + header.to_s + "' column which is required"
            puts headers
		exit
	end
end

# list of headers that are custom
headers.each do |header,index|
	item_fields << header if !required_headers.include?(header)
end

# some statistics
puts "Total items found to import : " + (sheet.num_rows-1).to_s	# less the header row

# we start processing here
start = 2
ending = sheet.num_rows
if id != nil then
    start = id.to_i
    ending = id.to_i
end
for row in start..ending
		# we use a column called collection_id to identify an item
		item = Item.find_or_create_by(collection_id:  sheet[row,headers['collection_id']])

		# set item properties that are not habtm collections
		item.name = sheet[row,headers['name']]
		item.slug = nil
		puts "E : (" + item.collection_id.to_s + ") " + item.name if item.id != nil
		puts "N : (" + item.collection_id.to_s + ") " + item.name if item.id == nil

		item.year = sheet[row,headers['year']]
		item.cost = sheet[row,headers['cost']]
		item.value = sheet[row,headers['value']]
		item.reference = sheet[row,headers['reference']]
		item.save

		# process the habtm collections
		item.set_virtualcollections_by_string(sheet[row,headers['collections']])
		item.set_conditions_by_string(sheet[row,headers['conditions']])
		item.set_categories_by_string(sheet[row,headers['categories']])
		item.set_rolodexes_by_string(sheet[row,headers['rolodexes']])

		# process custom fields
		item.fieldoptions = []
		item_fields.each do |itemfield|
			item.set_itemfield_with_fieldoptions(sheet[1,headers[itemfield]],sheet[row,headers[itemfield]])
		end

        # process images
        item.images = []
        images = sheet[row,headers['images']].split(",")
        images.each do |image|
	    	# get MD5
	   		md5 = Digest::MD5.hexdigest(File.read('../images/' + image))
		    activeimage =  Image.find_or_create_by(md5: md5)
		    # is a new image
		    if activeimage.id == nil then
		        activeimage.name = item.name
		        activeimage.rawimage = File.open(image)
		    end
		    item.images << activeimage
		end
end

# update all the related items at the end
puts "Rebuilding related items. This may take a while so please be patient ..."
Item.update_related_items

# cleanup

puts "Removing unused entries. This may take a while so please be patient ..."
Virtualcollection.destroy_unassociated
Category.destroy_unassociated
Condition.destroy_unassociated
Rolodex.destroy_unassociated
Fieldoption.destroy_unassociated



