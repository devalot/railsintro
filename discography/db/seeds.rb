# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Artist.create! do |a|
  a.name = "The Knife"
  a.formation_year = 1999
  a.albums.new(name: "The Knife",    released_at: "2001-02-5")
  a.albums.new(name: "Deep Cuts",    released_at: "2003-01-17")
  a.albums.new(name: "Silent Shout", released_at: "2006-02-17")
end

Artist.create! do |a|
  a.name = "Sneaker Pimps"
  a.formation_year = 1994
  a.albums.new(name: "Becoming X", released_at: "1996-08-19")
  a.albums.new(name: "Splinter",   released_at: "1999-01-01")
end
