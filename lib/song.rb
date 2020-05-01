require "pry"
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
    self.save

  end


  def artist=(artist_obj)

    if @artist == nil
      @artist = artist_obj
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

  def self.create(song_name)
    song_obj = Song.new(song_name)
    if !(@@all.include?(song_obj))
      @@all << song_obj
    end
    song_obj

  end

 def self.find_by_name(song_name)

    @@all.find do |song_obj|
      song_obj.name == song_name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
      #binding.pry
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(' - ')[2].chomp(".mp3")
    genre_obj = Genre.new(genre_name)
    artist_obj = Artist.new(artist_name)
    song_obj = Song.new(song_name, artist_obj,genre_obj)
  end








end
