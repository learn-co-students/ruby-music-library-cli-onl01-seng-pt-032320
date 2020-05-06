require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all =[]

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    ##save
  end

  def self.create(name)
    song=Song.new(name)
    song.save
    song 
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

  def genre=(genre)
    @genre =genre
    genre.songs << self unless genre.songs.include? self
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end


  def self.new_from_filename(name)
      artist,song,genre = name.split(" - ")
      genre_=[]
      genre_=genre.chomp(".mp3")
      art = Artist.find_or_create_by_name(artist)

      gen = Genre.find_or_create_by_name(genre_)
      new(song,art,gen)
end
end
