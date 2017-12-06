class User < ApplicationRecord
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

  def fav_categories

  end

  def upcomming
  end

  def most_popular
  end

private

  def old_enough
    if self.birthday > 15.years.ago.to_date
      errors.add(:birthday, "Sorry, get big")
    end
  end

end
