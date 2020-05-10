require 'pry'
class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def songs
    @songs
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    newgenre = Genre.new(name)
    newgenre.save
    newgenre
  end
  
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
  
end