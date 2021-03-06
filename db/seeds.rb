# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


20.times do 
   Gossip.create(
      title: Faker::Book.unique.title,
      user: User.all.sample,
      content: Faker::Movies::HarryPotter.quote
   )
end


10.times do 
   City.create(
      name: Faker::Address.city
   )
end

10.times do 
   User.create(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     description: Faker::Lorem.sentence(word_count: 10),
     email: Faker::Internet.email,
     age: rand(1..90),
     city: City.all.sample,
     password: Faker::Lorem.characters(number: rand(7..12) 
     ))
end


10.times do |n|
   Tag.create(
      title: "tag #{n+1}"
   )
end

rand(1..3).times do
   Gossip.all.each do |gos|
      Join.create(
         tag: Tag.all.sample,
         gossip: gos
      )
   end
end

# 50.times do
#    user_sender = User.all.sample
#    user_receiver = user_sender
#    while user_receiver == user_sender
#       user_receiver = User.all.sample
#    end
#       PrivateMessage.create( 
#          content: Faker::Lorem.sentence(word_count: 5),
#          recipient: user_receiver,
#          sender: user_sender
#       )
# end