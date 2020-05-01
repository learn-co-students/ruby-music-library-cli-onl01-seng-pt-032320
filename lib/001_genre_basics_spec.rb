class Genre
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end

  def self.all
    @@all
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre)
    created_genre = Genre.new(genre)
    @@all << self
    self
  end
  
  def artists
    songs.collect{|song| song.artist}.uniq
  end
end