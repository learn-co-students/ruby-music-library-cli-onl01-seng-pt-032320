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
  
  def self.find_by_name (namex)
    self.all.find { |x| x.name == namex}
  end 
  
  def self.find_or_create_by_name (namex)
    if (self.find_by_name (namex))
      @@all.uniq!
      self.find_by_name (namex)
    else 
      self.create(namex)
    end 
  end 
  
  def self.new_from_filename (filename)
    new_song = filename.chomp(".mp3").split(" - ")
    #binding.pry
    songx = new_song [1]
    artistx = new_song [0]
    genrex = new_song [2]
    song = self.find_or_create_by_name (songx)
    song.artist = Artist.find_or_create_by_name (artistx)
    song.genre = Genre.find_or_create_by_name (genrex)
    song 
  end 
  
  def self.create_from_filename (filename)
    self.new_from_filename(filename)
  end 
  
end 