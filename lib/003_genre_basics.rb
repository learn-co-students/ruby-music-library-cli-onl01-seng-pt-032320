class Genre 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self 
    
  end 
  
  def self.create(genre) 
    new_genre = Genre.new(genre)
    @@all << self 
    self 
  end 
  
  def songs 
    @songs 
  end 
  
def artists 
  songs.collect{|song| song.artist}.uniq
end 
  
end 