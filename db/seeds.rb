# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

site = Site.new
site.title = "oldcomputers"
site.email = "tim@nevyn.co.za"
site.password = "test"
site.code = "oldcomputers"
site.save

rolodex = Rolodex.new
rolodex.name = "Microsoft"
rolodex.site = Site.first
rolodex.save

item = Item.new
item.name = "Microsoft Adventure"
item.site = Site.first
item.save

condition = Condition.new
condition.name = "Fair"
condition.site = Site.first
condition.save
