class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 5..50 }
  validates :location, presence: true

  belongs_to :user
  belongs_to :beer
end
