class Category < ApplicationRecord
  has_many :events
  has_many :favorites
  has_many :users, through: :favorites

end
