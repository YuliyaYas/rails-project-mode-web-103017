class User < ApplicationRecord
  has_many :attendants
  has_many :events, through: :attendants
  has_many :events
  has_many :favorites
  has_many :categories, through: :favorites
  has_many :user_comments
  has_many :comments, through: :user_comments
  has_many :posts, :class_name => "Comment"
  validates :birthday, presence: true
  validate :old_enough

  def to_s
    self.first_name + ' ' + self.last_name
  end

  def birthday_events
    date = self.birthday.strftime("#{Date.current.year} %B %d").to_date
    Event.birthday_events(date)
  end

  def add_favorite(category)
    Favorite.create(category_id: category.id, user_id: self.id)
  end

  def fav_categories
    Favorite.all.map do |f|
     f.user_id == self.id
    end
  end

  def host(event)
    self.events_attending.find {|e| e.id == event.id}.user
  end

  def events_attending
    self.attendants.all.map do |a|
      a.event
    end
  end

  def attend_event(event)
    Attendant.create(user_id: self.id, event_id: event.id)
  end


  def upcomming
    arr = self.events_attending.sort_by {|event| event.date}[0..2]
  end

  def find_highest
    hash = {}
    self.events.each do |e|
      if !hash.include?(e.name)
        hash["#{e.id}"] = e.total_attendees
      end
    end
    hash
  end

  def most_popular
    highest_value = self.find_highest.max_by{|k, v| v}.last
    self.events.find_highest.select{|k, v| v == highest_value}.keys.map do |id|
      Event.find(id)
    end
  end

private

  def old_enough
    if self.birthday > 15.years.ago.to_date
      errors.add(:birthday, "Sorry, get big")
    end
  end



end
