class Comment < ApplicationRecord
  # has_many :event_comments
  belongs_to :event
  belongs_to :user


end
