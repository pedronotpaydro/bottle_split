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

beers = Beer.all
beers.map do |beer|
  if beer.style.downcase == "ipa"
    beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
    beer.save
  end
end
