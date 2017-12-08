# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # User.create(first_name: "Tashawn", last_name: "Williams", birthdate: )
# arr = ["Art", "Film", "Music", "Festival", "Food and Drink", "Party", "Theatre", "Seminar", "Networking"]
#
# def seed_category(arr)
#   arr.each do |category_name|
#     Category.create(name: category_name)
#   end
# end
#
# def seed_users
#   date1 = "1990-03-31"
#   date2 = "1992-09-10"
#   date3 = "1991-08-24"
#   date4 = "1992-12-18"
#   date5 = "1994-01-08"
#   date6 = "1996-03-14"
#   User.create(first_name: "Tashawn", last_name: "Williams", birthday: date1)
#   User.create(first_name: "Yulia", last_name: "Yasenetska", birthday: date2)
#   User.create(first_name: "Clarence", last_name: "Williams", birthday: date3)
#   User.create(first_name: "Shaquil", last_name: "Williams", birthday: date4)
#   User.create(first_name: "Quintell", last_name: "Williams", birthday: date5)
#   User.create(first_name: "Tyquan", last_name: "Williams", birthday: date6)
# end
#
# def seed_events
#   Event.create(name: "Tribeca Film Festival", description: "Lorem ipsum dolor sit amet, consecteturadipiscing...", date: "2017-12-18 15:00:00", age: "21", capacity: "5", user_id: 2, category_id: 1, price: "$50", location: "New York City", media: "https://tribecafilm.com/festival")
#   Event.create(name: "Flatiron Movie Night", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2017-12-18 19:00:00", age: "18", capacity: "25", user_id: 1, category_id: 1, price: "Free", location: "11 Broadway st, NY, 10004", media: "https://flatironschool.com/")
#   Event.create(name: "House Party", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2018-01-08 21:30:00", age: "21", capacity: "50", user_id: 3, category_id: 4, price: "$10", location: "65 West 57th st, NY, 10019", media: "https://www.youtube.com/watch?v=L7g9IV_qbAk")
#   Event.create(name: "Gallery Opening in Chelsea", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2018-03-31 22:00:00", age: "21", capacity: "15", user_id: 2, category_id: 6, price: "Free", location: "21 West 14th st, NY", media: "http://www.pacegallery.com/")
#   Event.create(name: "Google Meetup", description: "Meet people and stuff", date: "2018-09-10 19:00:00", age: "18", capacity: "2500", user_id: 5, category_id: 5, price: "$100", location: "111 8th Ave, New York, NY 10011", media: "https://google.com")
# end
# seed_category(arr)
# seed_users
# seed_events

#####

def seed_categories
  arr = ["Art", "Film", "Music", "Festival", "Food and Drink", "Party", "Theatre", "Seminar", "Networking"]
  arr.each do |category_name|
    Category.create(name: category_name)
  end
end
def seed_users
  date1 = "1990-03-31"
  date2 = "1992-09-10"
  date3 = "1991-08-24"
  date4 = "1992-12-18"
  date5 = "1996-01-09"
  date6 = "1998-03-14"
  date7 = "1986-10-18"
  date8 = "1990-12-12"
  User.create(first_name: "Tashawn", last_name: "Williams", email: "tashawn@williams.com", birthday: date1, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Yuliya", last_name: "Yasenetska", email: "yuliya@yasenetska.com", birthday: date2, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Clarence", last_name: "Williams", email: "clarence@williams.com", birthday: date3, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Shaquil", last_name: "Williams", email: "shaquil@williams.com", birthday: date4, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Quintell", last_name: "Williams", email: "quintell@williams.com", birthday: date5, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Tyquan", last_name: "Williams", email: "tyquan@williams.com", birthday: date6, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Seth", last_name: "Barden", email: "seth@barden.com", birthday: date7, password: "1234", password_confirmation: "1234")
  User.create(first_name: "Elli", last_name: "Shim", email: "elli@shim.com", birthday: date8, password: "1234", password_confirmation: "1234")
end
def seed_events
  Event.create(name: "Tribeca Film Festival", description: "Watch fancy movies and stuff", date: "2018-10-18 15:00:00", age: "21", capacity: "5", user_id: 2, category_id: 2, price: "$50", location: "New York City", media: "https://tribecafilm.com/festival")
  Event.create(name: "Flatiron Movie Night", description: "Life and times of Flatiron Students (soju shots not included)", date: "2018-09-10 19:00:00", age: "18", capacity: "25", user_id: 1, category_id: 2, price: "Free", location: "11 Broadway st, NY, 10004", media: "https://flatironschool.com/")
  Event.create(name: "K&K House Party", description: "Karaoke and K-Pop", date: "2017-12-12 21:30:00", age: "21", capacity: "50", user_id: 1, category_id: 6, price: "$10", location: "111 8th Ave, New York, NY 10011", media: "https://www.youtube.com/watch?v=OwJPPaEyqhI")
  Event.create(name: "Gallery Opening in Chelsea", description: "Admire fancy art and stuff", date: "2018-03-31 22:00:00", age: "21", capacity: "15", user_id: 2, category_id: 1, price: "Free", location: "111 8th Ave, New York, NY 10011", media: "http://www.pacegallery.com/")
  Event.create(name: "Google Meetup", description: "Talk to smart people and stuff", date: "2018-09-10 19:00:00", age: "18", capacity: "2500", user_id: 7, category_id: 9, price: "$100", location: "111 8th Ave, New York, NY 10011", media: "https://google.com")
  Event.create(name: "Open Mic", description: "Perform and stuff", date: "2018-09-10 19:00:00", age: "18", capacity: "250", user_id: 7, category_id: 7, price: "$25", location: "111 8th Ave, New York, NY 10011", media: "https://google.com")
  Event.create(name: "Harry Potter and the Cursed Child", description: "Fight Voldemort and make things levitate", date: "2018-03-31 19:00:00", age: "17", capacity: "20", user_id: 8, category_id: 2, price: "$100", location: "111 8th Ave, New York, NY 10011", media: "https://www.harrypottertheplay.com/us/")
  Event.create(name: "Star Wars the Last Jedi", description: "Spoiler Alert: This Jedi is the last one", date: "2017-12-14 19:00:00", age: "16", capacity: "15", user_id: 8, category_id: 2, price: "$20", location: "111 8th Ave, New York, NY 10011", media: "http://www.starwars.com/")
  Event.create(name: "Mardi Gras", description: "Get drunk, go crazy", date: "2018-02-13 19:00:00", age: "21", capacity: "15", user_id: 8, category_id: 6, price: "Free", location: "111 8th Ave, New York, NY 10011", media: "https://google.com")
end
def seed_favorites
Favorite.create(user_id: 1, category_id: 2)
Favorite.create(user_id: 1, category_id: 9)
Favorite.create(user_id: 1, category_id: 7)
Favorite.create(user_id: 2, category_id: 1)
Favorite.create(user_id: 2, category_id: 4)
Favorite.create(user_id: 2, category_id: 5)
Favorite.create(user_id: 7, category_id: 7)
Favorite.create(user_id: 7, category_id: 3)
Favorite.create(user_id: 8, category_id: 2)
Favorite.create(user_id: 8, category_id: 5)
end
def seed_comments
  Comment.create(content: "This looks gnarly!", user_id: 7, event_id: 3)
  Comment.create(content: "This looks gnarly!", user_id: 7, event_id: 8)
  Comment.create(content: "Can't wait!", user_id: 8, event_id: 8)
  Comment.create(content: "I'll take care of the soju problem", user_id: 8, event_id: 2)
  Comment.create(content: "GET THEM GREENS!", user_id: 1, event_id: 2)
  Comment.create(content: "Let's Tesellate!", user_id: 2, event_id: 3)
end
def seed_attendants
  Attendant.create(event_id: 3, user_id: 1)
  Attendant.create(event_id: 3, user_id: 2)
  Attendant.create(event_id: 3, user_id: 7)
  Attendant.create(event_id: 3, user_id: 8)
  Attendant.create(event_id: 8, user_id: 1)
  Attendant.create(event_id: 8, user_id: 2)
  Attendant.create(event_id: 8, user_id: 7)
  Attendant.create(event_id: 8, user_id: 8)
  Attendant.create(event_id: 2, user_id: 1)
  Attendant.create(event_id: 2, user_id: 2)
  Attendant.create(event_id: 2, user_id: 7)
  Attendant.create(event_id: 2, user_id: 8)
end
seed_categories
seed_users
seed_events
seed_favorites
seed_comments
seed_attendants
