class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    self.save
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
  
  def self.create(artist_obj)
    artist_obj = Artist.new(name)
    @@all << artist_obj
    artist_obj
  end
  
  
end