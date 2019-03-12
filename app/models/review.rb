class Review
  @@all = []
  attr_accessor :rating, :content
  attr_reader :restaurant, :customer 

  def self.all
    @@all
  end

  def initialize(rating:, content:, restaurant:, customer:)
    @rating = rating
    @content = content
    @restaurant = restaurant
    @customer = customer

    @@all << self
  end
end

