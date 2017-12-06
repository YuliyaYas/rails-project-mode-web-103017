class Event < ApplicationRecord
  has_many :attendants
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :date, :location, :price, :name, presence: true
  validate :current_or_future_date

  def event_day
    event_day = self.date.strftime("#{Date.current.year} %B %d").to_date
  end

  def self.birthday_events(date)
    self.all.select do |e|
      (e.event_day.day == date.day) && (e.event_day.month == date.month) && (e.event_day.year == date.year)

      # byebug
    end
  end

    def total_attendees
      self.attendants.count
    end

  private

  def current_or_future_date
    if self.date < Time.now
      errors.add(:date, "This aint Back to The Future Son!")
    end
  end
end
