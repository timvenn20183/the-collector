# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating new site"
site = Site.new
site.title = "oldcomputers"
site.email = "tim@nevyn.co.za"
site.password = "test"
site.code = "oldcomputers"
site.save

site = Site.new
site.title = "marklin"
site.email = "marklin@test.com"
site.password = "test"
site.code = "marklin"
site.save


puts "Creating new rolodex"
rolodex = Rolodex.new
rolodex.name = "Microsoft"
rolodex.site = Site.first
rolodex.save

puts "Creating new virutal collection"
vc = Virtualcollection.new
vc.name = "DOS Games"
vc.site = Site.first
vc.save

puts "Creating new condition"
condition = Condition.new
condition.name = "Fair"
condition.site = Site.first
condition.save

puts "Creating new category"
cat = Category.new
cat.name = "Adventure"
cat.site = Site.first
cat.save

puts "Creating new item"
item = Item.new
item.name = "Microsoft Adventure"
item.site = Site.first
item.virtualcollections << vc
item.conditions << condition
item.categories << cat
item.rolodexes << rolodex
item.save


puts "Creating a Item field"
itemfield = Itemfield.new
itemfield.name = "Media"
itemfield.site = Site.first
itemfield.save

itemfield = Itemfield.new
itemfield.name = "Format"
itemfield.site = Site.last
itemfield.save

puts "Creating a field option"
fieldoption = Fieldoption.new
fieldoption.name = "CD-ROM"
fieldoption.itemfield = Itemfield.first
fieldoption.save

fieldoption = Fieldoption.new
fieldoption.name = "PAL"
fieldoption.itemfield = Itemfield.last
fieldoption.save

