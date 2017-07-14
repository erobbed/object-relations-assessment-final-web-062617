class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find{|movie|title = movie.title}
  end

  def ratings
    Rating.all.select{|rating| rating.movie = self}
  end

  def viewers
    self.ratings.map{|rating| rating.viewer}
  end

  def average_rating
    rating_sum = self.ratings.map{|rating| rating.score}.inject(:+)
    rating_sum/self.ratings.count
  end
end
