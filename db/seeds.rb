# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	admin = Usuario.create(
    	:username => "root",
    	:email => "prueba@prueba.com",
    	:password => "12345",
    	:password_confirmation => "12345"
	)
	admin.toggle!(:admin)
	# I assume "admin.update_attribute(:admin, true)" would work as well.