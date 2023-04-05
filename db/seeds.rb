# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

15.times do
  interest = Faker::Hobby.activity
  Interest.create(name: interest)
end

15.times do
  skill = Faker::Job.key_skill
  Skill.create(name: skill)
end

5.times do
  name = Faker::Name.first_name
  surname = Faker::Name.last_name
  patronymic = Faker::Name.middle_name
  fullname = "#{surname} #{name} #{patronymic}"
  email = Faker::Internet.free_email(name: name)
  age = rand(20..50)
  nationality = Faker::Nation.nationality
  country = Faker::Address.country
  gender = Faker::Gender.binary_type.downcase

  user = User.create(name:, surname:, patronymic:, fullname:, email:, age:, nationality:, country:, gender:)

  user.interests = Interest.order("RANDOM()").limit(5)
  user.skills = Skill.order("RANDOM()").limit(5)
end
