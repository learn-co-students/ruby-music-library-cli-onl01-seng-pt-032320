class Song
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
  
  def self.create(song)
    Song.new(song)
    @@all << self
    self
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
  
  def self.find_by_name(song)
    @@all.detect { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create(song)
    end
  end
  
  
  
end