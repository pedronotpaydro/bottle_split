class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 5..50 }
  validates :location, presence: true

  belongs_to :user
  belongs_to :beer

  def active?
    if self.date > DateTime.now
      self.active = true
      self.save
    else
      self.active = false
      self.save
    end
  end
end
