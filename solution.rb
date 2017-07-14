# Please copy/paste all three classes into this file to submit your solution!
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


class Viewer
  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|viewer| viewer.full_name == name}
  end

  def create_rating(movie, score)
    rating = Rating.new(self, movie, score)
  end
end


class Rating
  attr_accessor :score, :movie, :viewer
  @@all = []

  def initialize(viewer, movie, score)
    @viewer = viewer
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end
end
