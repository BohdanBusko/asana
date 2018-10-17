# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#10.times do
  User.create(email: 'supersem@asana.com', password: '123456')
#end

#Project.all.each do |project|
#  Faker::Number.between(5, 10).times do
#    project.sections.create(name: Faker::Name.name)
#  end
#end
