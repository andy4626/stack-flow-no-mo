# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do |i|
  User.create(username: Faker::Internet.user_name, password: "a")
end

30.times do |i|
  Question.create(title: Faker::Hacker.noun, content: Faker::Hacker.say_something_smart + "?", user_id: rand(1..5))
end

300.times do |i|
  Answer.create(content: Faker::Hacker.say_something_smart, user_id: rand(1..5), question_id: rand(1..20))
end

20.times do |i|
  Tag.create(name: Faker::Hacker.adjective)
end

20.times do |i|
  TagQuestion.create(tag_id: i, question_id: rand(1..20))
end

str = ["Question", "Answer"]
num = [1, -1]
30.times do |i|
  Vote.create(value: num.sample, user_id: rand(1..5), votable_type: str.sample, votable_id: rand(1..30))
end

300.times do |i|
  Comment.create(content: Faker::Hacker.say_something_smart, user_id: rand(1..5), commentable_type: str.sample, commentable_id: rand(1..30))
end


