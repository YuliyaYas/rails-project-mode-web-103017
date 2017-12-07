class EventComment < ApplicationRecord
  belongs_to :event
  belongs_to :comment
end
