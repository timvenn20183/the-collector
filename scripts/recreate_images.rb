require 'rubygems'
require '../config/environment'

Image.all.each do |i|
    puts i.id
    i.rawimage.cache_stored_file!
    i.rawimage.recreate_versions!
    i.save
end

