class Restaurant
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|restaurant| restaurant.name.eql?(name)}
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def reviews
    Review.all.select {|review| review.restaurant.eql?(self)}
  end

  def review_content
    self.reviews.map {|review| review.content}
  end

  def customers
    self.reviews.map {|review| review.customer}.uniq
  end

  def review_count
    self.reviews.count
  end

  def average_star_rating
    total = self.reviews.reduce(0.0) {|sum, element| sum += element.rating}
    total / self.review_count
  end

  def longest_review
    self.review_content.max_by(&:length)
  end
end
