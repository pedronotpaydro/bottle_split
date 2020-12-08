class Beer < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :brewery, presence: true, length: { in: 5..30 }
  validates :style, presence: true, length: { in: 5..30 }
  validates :description, length: { in: 5..300 }
end
