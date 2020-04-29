class Song 

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
    save
    artist=(artist) unless artist == nil 
    genre=(genre) unless genre == nil 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create (name)
    self.new(name).save
  end 
  
  def artist=(artist)
    @artist = artist 
  end 
  
  def genre=(genre)
    @genre = genre 
  end 
  
end 