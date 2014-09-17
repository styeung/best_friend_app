# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
(0..100).each do |i|
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    age: rand(20..50),
    password: 'password',
    life_goals: Faker::Company.bs,
    job: Faker::Company.name,
    hobbies: Faker::Company.catch_phrase,
    reason_to_meet: Faker::Hacker.say_something_smart,
    relationship_status: 1,
    personality_type: Random.rand(1..5)
  )
end

(1..10).each do |i|
  convo = Conversation.create()

  (1..5).each do |j|
    author = User.find((j % 2) + i)
    m = Message.create(author: author, contents: Faker::Hacker.say_something_smart)
    convo.messages << m
    convo.users << author
  end
end

(1..11).each do |i|
  user1 = User.find(i)
  user2 = User.find(i+1)
  start_time = rand(Time.now..(Time.now+1.year))
  end_time = rand(start_time..(start_time + 5.hour))
  location = Location.create(latitude: 40.730610 + rand(),
                             longitude:-73.935242 - rand())
  m = Meeting.create(creator: user1, purpose: Faker::Company.catch_phrase,
                     start_date_time:start_time, end_date_time:end_time, location:location)
  user1.attended_meetings << m
  user2.attended_meetings << m
end
