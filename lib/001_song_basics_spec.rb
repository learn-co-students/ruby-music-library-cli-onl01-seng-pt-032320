class Song 
  
  attr_accessor :name
  
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil 
    
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
  
  def self.create(song) 
    created_song = Song.new(song)
    @@all << self 
    self
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def artist 
    @artist 
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
  
  def self.find_by_name(song)
    @@all.detect {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
  end

end 