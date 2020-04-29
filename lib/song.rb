class Song 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    self.save
  end
  
  def self.all
    @@all
  end
  
  def save 
     @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song_obj)
    song_obj = Song.new(name)
    @@all << song_obj
    song_obj
  end
  
  
  
end