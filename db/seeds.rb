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

puts "Creating new rolodex"
rolodex = Rolodex.new
rolodex.name = "Microsoft"
rolodex.site = Site.first
rolodex.save

puts "Creating new item"
item = Item.new
item.name = "Microsoft Adventure"
item.site = Site.first
item.save

puts "Creating new condition"
condition = Condition.new
condition.name = "Fair"
condition.site = Site.first
condition.save

puts "Creating new virutal collection"
vc = Virtualcollection.new
vc.name = "DOS Games"
vc.site = Site.first
vc.save

puts "Creating new category"
cat = Category.new
cat.name = "Adventure"
cat.site = Site.first
cat.save
