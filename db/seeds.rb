# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    interes = Faker::Hobby.activity
    Interest.create(name: interes)
end

10.times do
    skill = Faker::Job.key_skill
    Skill.create(name: skill)
end
