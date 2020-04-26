require 'pry'
class Song

#extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    var = Song.new(name)
    var.save
    var
    #self
  end

  def self.find_by_name(name)
    #binding.pry
    all.find{|names| names.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(name)
    artist, song, genre = name.split(' - ')

    fixed =  genre.gsub(".mp3",'')

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end

end
