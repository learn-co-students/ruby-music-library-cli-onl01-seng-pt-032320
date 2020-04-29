require "pry"
class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre_type = nil)
    @name = name
    self.artist=(artist)
    @genre = genre_type
    #self.genre=(genre)
    self.save
   
  end
  ###
  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  ###
  
  def genre=(genre_type)
    @genre = genre_type
    
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
  
  def self.create(song_obj)
    song_obj = Song.new(name)
    @@all << song_obj
    song_obj
  end
  
  
  
end