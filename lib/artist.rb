class Artist

  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize (name)
    @name = name
    save
    @songs = []
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
    artist = self.new(name)
    artist.save
    artist
  end 
  
  def songs
    @songs
  end 
  
  def add_song (song)      
    song.artist = self if song.artist != self
    @songs << song if @songs.include?(song) == false
  end  
  
end 