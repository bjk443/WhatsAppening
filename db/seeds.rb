# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Rating.destroy_all
Event.destroy_all
Chatroom.destroy_all
Venue.destroy_all
User.destroy_all

user_1 = User.create(name: "john", email: "john@john.com", password: "123456", role: "admin" )
user_2 = User.create(name: "omar", email: "omar@omar.com", password: "123456", role: "admin" )
user_3 = User.create(name: "chris", email: "chris@chris.com", password: "123456", role: "admin" )

puts "User created"
puts "creating venues"

venue_1 = Venue.create!(
  name: "The Woods",
  address: "214 South Bridge Rd, Singapore 058763",
  description: "Event place, Meeting Room, Studio, Unique",
  capacity: 20,
  user: user_1,
  category: "bar"
)

venue_2 = Venue.create!(
  name: "The Float@Marina Bay",
  address: "20 Raffles Ave. Singapore 039805",
  description: "Great place in marina bay Singapore",
  capacity: 500,
  user: user_2,
  category: "cafe"
)

venue_3 = Venue.create!(
  name: "Amazing Events",
  address: "200 South Bridge Rd, Singapore 058763",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room, Studio, Training Room, Unique Venue, Warehouse",
  capacity: 100,
  user: user_2,
  category: "bar"
)

venue_4 = Venue.create!(
  name: "Three Degree Cafe",
  address: "11 Slim Barracks Rise, Singapore 138664",
  description: "Cafe, Event Space, Halal Venue",
  capacity: 100,
  user: user_1,
  category: "cafe"
)

venue_5 = Venue.create!(
  name: "Cloud9 Events",
  address: "65 Ubi Rd 1, Singapore 408729",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room",
  capacity: 50,
  user: user_2,
  category: "cafe"
)
puts "Creating events..."
event_1 = Event.create!(
  name: "The Greatest Show on Earth",
  artist: "Daft Punk",
  genre: "House",
  venue: venue_1
)
event_2 = Event.create!(
  name: "The end of days",
  artist: "Beyonce",
  genre: "Pop",
  venue: venue_2
)
event_3 = Event.create!(
  name: "200m run",
  artist: "Jay-Z",
  genre: "Hip Hop",
  venue: venue_2
)
event_3 = Event.create!(
  name: "Halloween bar crawl",
  artist: "Eminem",
  genre: "Rap",
  venue: venue_3
)

event_4 = Event.create!(
  name: "Booze cruise",
  artist: "U2",
  genre: "Rock",
  venue: venue_4
)

event_5 = Event.create!(
  name: "Full Moon Party",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_5
)

puts "Creating ratings..."
Rating.create!(
  stars: 3,
  comment: "Did you hear that DJ?",
  crowd_level: 6,
  waiting_time: "30 min",
  event: event_1
)
Rating.create!(
  stars: 5,
  comment: "Did you hear that DJ?",
  crowd_level: 8,
  waiting_time: "15 min",
  event: event_1
)
Rating.create!(
  stars: 3,
  comment: "A night to remember!",
  crowd_level: 10,
  waiting_time: "45 min",
  event: event_2
)
Rating.create!(
  stars: 1,
  comment: "What a waste of my time!",
  crowd_level: 3,
  waiting_time: "30 min +",
  event: event_2
)
Rating.create!(
  stars: 2,
  comment: "A night to remember!",
  crowd_level: 10,
  waiting_time: "no wait",
  event: event_3
)
Rating.create!(
  stars: 0,
  comment: "What a waste of my time!",
  crowd_level: 3,
  waiting_time: "10 min",
  event: event_3
)

Rating.create!(
  stars: 5,
  comment: "A night to remember!",
  crowd_level: 10,
  waiting_time: "10 min",
  event: event_3
)
Rating.create!(
  stars: 3,
  comment: "What a waste of my time!",
  crowd_level: 7,
  waiting_time: "5 min",
  event: event_3
)

Rating.create!(
  stars: 1,
  comment: "A night to remember!",
  crowd_level: 5,
  waiting_time: "30 min",
  event: event_3
)
Rating.create!(
  stars: 4,
  comment: "What a waste of my time!",
  crowd_level: 2,
  waiting_time: "30 min +",
  event: event_3
)

puts "Attaching pictures for venues..."
Venue.all.each do |venue|
  names = ["amara-", "royal-", "tonito-"]
  house = names.sample
    for i in (1..5) do
      name = "#{house}#{i}.jpg"
      file = File.open(File.join(__dir__,"./seed_picture/#{name}"))
      venue.photos.attach(io: file, filename: name, content_type: 'image/jpg')
    end
end

Chatroom.create(venue_id: venue_1.id)
Chatroom.create(venue_id: venue_2.id)
Chatroom.create(venue_id: venue_3.id)
Chatroom.create(venue_id: venue_4.id)
Chatroom.create(venue_id: venue_5.id)

puts "Attaching pictures for venues..."
Venue.all.each do |venue|
  names = ["amara-", "royal-", "tonito-"]
  house = names.sample
    for i in (1..5) do
      name = "#{house}#{i}.jpg"
      file = File.open(File.join(__dir__,"./seed_picture/#{name}"))
      venue.photos.attach(io: file, filename: name, content_type: 'image/jpg')
    end
end