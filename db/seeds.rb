# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(first_name: "Tashawn", last_name: "Williams", birthdate: )
arr = ["Art", "Film", "Music", "Festival", "Food and Drink", "Party", "Theatre", "Seminar", "Networking"]

def seed_category(arr)
  arr.each do |category_name|
    Category.create(name: category_name)
  end
end

def seed_users
  date1 = "1990-03-31"
  date2 = "1992-09-10"
  date3 = "1991-08-24"
  date4 = "1992-12-18"
  date5 = "1994-01-08"
  date6 = "1996-03-14"
  User.create(first_name: "Tashawn", last_name: "Williams", birthday: date1)
  User.create(first_name: "Yulia", last_name: "Yasenetska", birthday: date2)
  User.create(first_name: "Clarence", last_name: "Williams", birthday: date3)
  User.create(first_name: "Shaquil", last_name: "Williams", birthday: date4)
  User.create(first_name: "Quintell", last_name: "Williams", birthday: date5)
  User.create(first_name: "Tyquan", last_name: "Williams", birthday: date6)
end

def seed_events
  Event.create(name: "Tribeca Film Festival", description: "Lorem ipsum dolor sit amet, consecteturadipiscing...", date: "2017-12-18 15:00:00", age: "21", capacity: "5", user_id: 2, category_id: 1, price: "$50", location: "New York City", media: "https://tribecafilm.com/festival")
  Event.create(name: "Flatiron Movie Night", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2017-12-18 19:00:00", age: "18", capacity: "25", user_id: 1, category_id: 1, price: "Free", location: "11 Broadway st, NY, 10004", media: "https://flatironschool.com/")
  Event.create(name: "House Party", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2018-01-08 21:30:00", age: "21", capacity: "50", user_id: 3, category_id: 4, price: "$10", location: "65 West 57th st, NY, 10019", media: "https://www.youtube.com/watch?v=L7g9IV_qbAk")
  Event.create(name: "Gallery Opening in Chelsea", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", date: "2018-03-31 22:00:00", age: "21", capacity: "15", user_id: 2, category_id: 6, price: "Free", location: "21 West 14th st, NY", media: "http://www.pacegallery.com/")
  Event.create(name: "Google Meetup", description: "Meet people and stuff", date: "2018-09-10 19:00:00", age: "18", capacity: "2500", user_id: 5, category_id: 5, price: "$100", location: "111 8th Ave, New York, NY 10011", media: "https://google.com")
end
seed_category(arr)
seed_users
seed_events
