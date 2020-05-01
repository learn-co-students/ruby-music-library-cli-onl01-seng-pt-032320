require 'pry'
class Song 

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
    save
    
    if !(artist == nil)
      self.artist = artist
      artist=(artist)
    end 
    if !(genre == nil)
      self.genre = genre
      genre=(genre)
    end 
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
    self.new(name).tap do |song|
      song.save
    end 
  end 
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    @genre.add_genre(self)
  end 
  
end 