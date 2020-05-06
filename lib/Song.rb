class Song
  extend Common::ClassMethods
  include Common::InstanceMethods
  extend Concerns::Findable
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist=nil, genre=nil)
    super(name)
    if artist != nil
      self.artist = artist
    end
    if genre !=nil
      self.genre = genre
    end
    #@@all << self
  end

  attr_accessor :artist, :genre, :files

  def setArtist(artist)
    @artist = artist
  end

  def artist=(artist)
    artist.add_song(self)
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    return self.create(name) if song == nil
    song
  end

  def genre=(genre)
    @genre = genre
    return if genre.songs.include?(self)
    genre.songs << self
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    name = filename_split[1]
    artist_name = filename_split[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_split = filename_split[2].split(".")
    genre_type = genre_split[0]
    genre = Genre.find_or_create_by_name(genre_type)
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
