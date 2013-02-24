# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.destroy_all
Entry.destroy_all

%w(Tyna Jakub Simonka Pavel Martina Arnie Joc Tomas).each do |user|
  a = Person.new(:username => user)
  a.password = "heslo"
  a.save
end

v = Person.first
v.ijacek = true
v.save




