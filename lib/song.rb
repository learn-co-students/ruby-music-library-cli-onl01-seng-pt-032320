require "pry"
class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre) if genre != nil
    self.save
   
  end


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
  
  
  def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
  
 def self.find_by_name(name)
    @@all.select do |song_obj|
      song_obj.name == name 
    end
  end
  
  
end