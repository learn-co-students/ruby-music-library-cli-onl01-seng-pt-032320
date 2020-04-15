class Song
  attr_accessor :name, :genre 
  attr_reader :artist 
  
  
  @@all = [] 
  
  def initialize(song_name, artist = nil, genre = nil)
    @name = song_name 
    self.artist = artist unless artist == nil 
    self.genre = genre unless genre == nil 
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
    self.all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create (song_name)
    song = Song.new(song_name) 
    song.save 
    song 
  end 
  
  def self.find_by_name(song_name)
    self.all.detect{|song|song.name == song_name} 
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end 
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1] 
    artist =  Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    Song.new(song_name, artist, genre)
  end 
    
  def self.create_from_filename(filename) 
    song = self.new_from_filename(filename) 
    song.save 
  end 
    
end 