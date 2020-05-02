require 'pry'
class Song
attr_accessor :name
attr_reader :artist, :genre

@@all = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    name = self.new(name)
    name
  end

  def self.find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    song = self.find_or_create_by_name(song_array[1])
    song.artist = Artist.find_or_create_by_name(song_array[0])
    song.genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3",""))
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
