class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 5..50 }
  validates :location, presence: true

  belongs_to :user
  belongs_to :beer

  # def active?
  #   if self.date > DateTime.now
  #     self.active = true
  #     self.save
  #   else
  #     self.active = false
  #     self.save
  #   end
  # end
end

# def time_ago_in_words(from_time, include_seconds_or_options = {})
#   distance_of_time_in_words(from_time, Time.now, include_seconds_or_options)
# end

# beers = Beer.all
# beers.map do |beer|
#   if beer.style.downcase == "ipa"
#     beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
#     beer.save
#   end
# end

# events = Event.all
# events.map do |event|
#   if event.beer.image.nil? && event.beer.style.downcase == "stout"
#     event.beer.image = "https://beerconnoisseur.com/sites/default/files/articles/2020/the_difference_between_porter_and_stout/porter_and_stout.jpg"
#     event.beer.save
#   end
# end
