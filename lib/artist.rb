class Artist 
  extend Concerns::Findable 
  
  attr_accessor :name, :songs, :genres 
  
  @@all = [] 
  
  def initialize(artist_name)
    @name = artist_name 
    @songs = [] 
    
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
  
  def self.create (artist_name)
    artist = Artist.new(artist_name) 
    artist.save 
    artist
  end 
  
  def add_song(song)
    song.artist = self if song.artist == nil 
    @songs << song unless @songs.include?(song) 
  end 
  
  def genres 
    songs.collect{|song|song.genre}.uniq 
  end 
  
  
end 