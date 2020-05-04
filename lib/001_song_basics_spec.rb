class Song
  'require Pry'
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.genre=(genre) if genre != nil
    self.artist=(artist) if artist != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      genre.songs
    else
      genre.songs << self
    end
  end
  
  def genre
    @genre
  end
  
  def artist
    @artist
  end 
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1]
    genre_name = array[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre) 
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
end