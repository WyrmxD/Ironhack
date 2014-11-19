# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..10 do 
	p = Project.create!(name: "P#{i}", description: "este es el proyecto #{i}")	
	for j in 0..(rand(4)) do
		comment = (0...15).map { (65 + rand(26)).chr }.join
		p.entries.create! hours: rand(24) , minutes: rand(80), comment: comment, date: Time.now
	end
end