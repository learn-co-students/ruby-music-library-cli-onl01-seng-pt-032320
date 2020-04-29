require "pry"
class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    @genre = genre
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
  
  def genre=(genre)
    @genre =
      if genre.songs == self
        genre_obj.songs
      else
      genre_obj.songs << self
    end
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
  
  def self.create(song_obj)
    song_obj = Song.new(name)
    @@all << song_obj
    song_obj
  end
  
  
  
end