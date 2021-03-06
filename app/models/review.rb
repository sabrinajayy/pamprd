class Review < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  belongs_to :consumer_request
  validates :content, length: { minimum: 10 }
  after_save :auto_update_artist_rating

  private
  def auto_update_artist_rating
    counter = Review.where(artist_id: self.artist.id).count
    artist_reviews = Review.where(artist_id: self.artist.id).map {|review| review.rating.to_f}
    rating = (self.rating + artist_reviews.reduce { |memo, i| memo + i } )/((counter +1).to_f)
    self.artist.update(rating: rating)
  end
end
