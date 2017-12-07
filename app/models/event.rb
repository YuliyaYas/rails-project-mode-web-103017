class Event < ApplicationRecord
  # has_many :event_comments
  # has_many :comments, through: :event_comments
  has_many :attendants
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :date, :location, :age, :capacity, :price, :name, presence: true
  validate :current_or_future_date

  def event_day
    event_day = self.date.strftime("#{Date.current.year} %B %d").to_date
  end

  def self.birthday_events(date)
    self.all.select do |e|
      (e.event_day.day == date.day) && (e.event_day.month == date.month) && (e.event_day.year == date.year)
    end
  end

  def all_attending
    self.attendants.map {|a| a.user}
  end

  def total_attendees
    self.attendants.count
  end

  def self.most_popular
    highest_value = Event.find_highest.max_by{|k, v| v}.last
    Event.find_highest.select{|k, v| v == highest_value}.keys.map do |id|
      Event.find(id)
    end
  end


  # def comments
  #   self.event_comments.map {|c| c}
  # end

  private

  def current_or_future_date
    if self.date < Time.now
      errors.add(:date, "This aint Back to The Future Son!")
    end
  end

  def self.find_highest
    hash = {}
    self.all.each do |e|
      if !hash.include?(e.name)
        hash["#{e.id}"] = e.total_attendees
      end
    end
    hash
  end

end
