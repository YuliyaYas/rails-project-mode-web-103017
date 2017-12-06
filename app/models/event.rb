class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :date, :location, :price, :name, presence: true
  validate :current_or_future_date


  private

  def current_or_future_date
    if self.date < Time.now
      errors.add(:date, "This aint Back to The Future Son!")
    end
  end
end
