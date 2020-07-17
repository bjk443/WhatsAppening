# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

User.destroy_all
Rating.destroy_all
Event.destroy_all
Venue.destroy_all
Chatroom.destroy_all
Message.destroy_all

puts "Creating users..."
user_1 = User.create(name: "john", email: "john@john.com", password: "123456", role: "admin")
user_2 = User.create(name: "omar", email: "omar@omar.com", password: "123456", role: "admin")
user_3 = User.create(name: "chris", email: "chris@chris.com", password: "123456", role: "admin")
user_4 = User.create(name: "alex", email: "alex@alex.com", password: "123456", role: "normal_user")
user_6 = User.create(name: "claire", email: "claire@claire.com", password: "123456", role: "normal_user")
user_7 = User.create(name: "harold", email: "harold@harold.com", password: "123456", role: "normal_user")
user_8 = User.create(name: "julien", email: "julien@julien.com", password: "123456", role: "normal_user")

puts "Creating venues..."
venue_1 = Venue.create!(
  name: "The Writing Club",
  address: "390, Orchard Road, Singapore 238871",
  description: "Great selection of whiskey",
  capacity: 30,
  user: user_1,
  category: "bar"
)

venue_2 = Venue.create!(
  name: "The Drunken Poet",
  address: "400, Orchard Road, Singapore 238875",
  description: "The best Irish Pub in Singapore",
  capacity: 45,
  user: user_2,
  category: "bar"
)

venue_3 = Venue.create!(
  name: "The Other Room",
  address: "320, Orchard Road, Singapore 238865",
  description: "Amazing cocktail bar",
  capacity: 40,
  user: user_3,
  category: "bar"
)

venue_4 = Venue.create!(
  name: "Esplanade Club",
  address: "442, Orchard Road, Singapore 238884",
  description: "Premium concert venue",
  capacity: 150,
  user: user_1,
  category: "bar"
)

venue_5 = Venue.create!(
  name: "TCC Cafe",
  address: "360, Orchard Road, Singapore 238869",
  description: "Leading chain of caffes",
  capacity: 30,
  user: user_2,
  category: "cafe"
)

venue_6 = Venue.create!(
  name: "Cafe de Muse",
  address: "350, Orchard Road, Singapore 238868",
  description: "Great coffe shop",
  capacity: 25,
  user: user_3,
  category: "cafe"
)

venue_7 = Venue.create!(
  name: "Starbucks",
  address: "541, Orchard Road, Singapore 238881",
  description: "Premium coffee",
  capacity: 20,
  user: user_3,
  category: "cafe"
)

venue_8 = Venue.create!(
  name: "Cafe Paris",
  address: "320, Orchard Road, Singapore 238865",
  description: "Delicious coffee",
  capacity: 20,
  user: user_3,
  category: "cafe"
)

venue_9 = Venue.create!(
  name: "Cafe del Mar",
  address: "400, Orchard Road, Singapore 238875",
  description: "Time to relax",
  capacity: 20,
  user: user_3,
  category: "cafe"
)

venue_10 = Venue.create!(
  name: "Heroes",
  address: "190 Orchard Blvd, Singapore 248646",
  description: "Temporarily closed",
  capacity: 150,
  user: user_1,
  category: "bar"
)

venue_11 = Venue.create!(
  name: "Bar Bar",
  address: "10 Scotts Rd, Singapore 228211",
  description: "Temporarily closed",
  capacity: 30,
  user: user_2,
  category: "bar"
)

puts "Creating events..."

event_1 = Event.create!(
  name: "No special event",
  artist: "Jay-Z",
  genre: "Hip Hop",
  venue: venue_1,
  playlist_id: "1677006641"
)

event_2 = Event.create!(
  name: "No special event",
  artist: "Beyonce",
  genre: "Pop",
  venue: venue_2,
  playlist_id: "5126399844"
)

event_3 = Event.create!(
  name: "No special event",
  artist: "Eminem",
  genre: "Rap",
  venue: venue_3,
  playlist_id: "607646115"
)

event_4 = Event.create!(
  name: "LIVE NOW IN CONCERT",
  artist: "Black Eyed Peas",
  genre: "House",
  venue: venue_4,
  playlist_id: "2098157264"
)

event_5 = Event.create!(
  name: "Booze cruise",
  artist: "U2",
  genre: "Rock",
  venue: venue_5,
  playlist_id: "7393760844"
)

event_6 = Event.create!(
  name: "No event tonight",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_6,
  playlist_id: "1221168973"
)

event_7 = Event.create!(
  name: "No event now",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_7,
  playlist_id: "1884669742"
)

event_8 = Event.create!(
  name: "Enjoy and relax",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_8,
  playlist_id: "1884669742"
)

event_9 = Event.create!(
  name: "Enjoy and relax",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_9,
  playlist_id: "1884669742"
)

event_10 = Event.create!(
  name: "No event Today",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_10,
  playlist_id: "7393760844"
)

event_11 = Event.create!(
  name: "No event tonight",
  artist: "Vivaldi",
  genre: "Classic",
  venue: venue_11,
  playlist_id: "7393760844"
)

puts "Creating ratings..."

Rating.create!(
  stars: 3,
  comment: "Did you hear that DJ?",
  crowd_level: 6,
  waiting_time: "30 min",
  event: event_1,
  user: user_1
)

Rating.create!(
  stars: 5,
  comment: "Did you hear that DJ?",
  crowd_level: 8,
  waiting_time: "15 min",
  event: event_1,
  user: user_2
)

Rating.create!(
  stars: 3,
  comment: "A night to remember!",
  crowd_level: 10,
  waiting_time: "45 min",
  event: event_2,
  user: user_3
)

Rating.create!(
  stars: 1,
  comment: "What a waste of my time!",
  crowd_level: 3,
  waiting_time: "30 min +",
  event: event_2,
  user: user_1
)

Rating.create!(
  stars: 2,
  comment: "A night to remember!",
  crowd_level: 10,
  waiting_time: "no wait",
  event: event_3,
  user: user_2
)

Rating.create!(
  stars: 0,
  comment: "What a waste of my time!",
  crowd_level: 3,
  waiting_time: "10 min",
  event: event_3,
  user: user_3
)

puts "Attaching pictures to venues..."

Venue.all.each do |venue|
  venue_picture = venue.name
  file = File.open(File.join(__dir__,"./seed_picture/#{venue.name}.jpg"))
  venue.photos.attach(io: file, filename: venue_picture, content_type: 'image/jpg')
end

puts "Creating user profile pics"

User.all.each do |user|
  picture = user.name
  file = File.open(File.join(__dir__,"./seed_picture/profile_picture/#{user.name.capitalize}.jpg"))
  user.profile_photo.attach(io: file, filename: picture, content_type: 'image/jpg')
end

puts "Creating chatrooms..."
Chatroom.create(venue_id: venue_1.id)
Chatroom.create(venue_id: venue_2.id)
Chatroom.create(venue_id: venue_3.id)
Chatroom.create(venue_id: venue_4.id)
Chatroom.create(venue_id: venue_5.id)
Chatroom.create(venue_id: venue_6.id)
Chatroom.create(venue_id: venue_7.id)
Chatroom.create(venue_id: venue_8.id)
Chatroom.create(venue_id: venue_9.id)
Chatroom.create(venue_id: venue_10.id)
Chatroom.create(venue_id: venue_11.id)
