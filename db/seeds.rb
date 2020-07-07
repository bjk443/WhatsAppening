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
Venue.destroy_all
User.destroy_all

User.create(name: "john", email: "john@john.com", password: "123456", role: "admin" )
User.create(name: "omar", email: "omar@omar.com", password: "123456", role: "admin" )
User.create(name: "chris", email: "chris@chris.com", password: "123456", role: "admin" )

puts "User created"
puts "creating venues"

Venue.create!(
  name: "The Woods",
  address: "214 South Bridge Rd, Singapore 058763",
  description: "Event place, Meeting Room, Studio, Unique",
  capacity: 20,
  user_id: User.all.ids.sample
)
Venue.create!(
  name: "The Float@Marina Bay",
  address: "20 Raffles Ave. Singapore 039805",
  description: "Great place in marina bay Singapore",
  capacity: 500,
  user_id: User.all.ids.sample
)
Venue.create!(
  name: "Cloud9 Events",
  address: "200 South Bridge Rd, Singapore 058763",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room, Studio, Training Room, Unique Venue, Warehouse",
  capacity: 100,
  user_id: User.all.ids.sample
)
Venue.create!(
  name: "Three Degree Cafe",
  address: "11 Slim Barracks Rise, Singapore 138664",
  description: "Cafe, Event Space, Halal Venue",
  capacity: 100,
  user_id: User.all.ids.sample
)
Venue.create!(
  name: "Cloud9 Events",
  address: "65 Ubi Rd 1, Singapore 408729",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room",
  capacity: 50,
  user_id: User.all.ids.sample
)

puts "Creating events..."

Event.create!(
  name: "The Greatest Show on Earth",
  category: "circus",
  venue_id: Venue.all.ids.sample
)

Event.create!(
  name: "The end of days",
  category: "religious",
  venue_id: Venue.all.ids.sample
)

puts "Creating ratings..."
Rating.create!(
  stars: 3.5,
  comment: "Did you hear that DJ?",
  crowd_level: 6,
  event_id: Event.all.ids.sample
)

Rating.create!(
  stars: 5,
  comment: "A night to remember!",
  crowd_level: 10,
  event_id: Event.all.ids.sample
)

Rating.create!(
  stars: 1,
  comment: "What a waste of my time!",
  crowd_level: 3,
  event_id: Event.all.ids.sample
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



