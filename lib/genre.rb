class Genre

  attr_accessor :name 
  
  @@all = []
  
  def initialize (name)
    @name = name
    save
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
    genre = self.new(name)
    genre.save
    genre
  end 
  
  def new_song (song_name, artist)
    Song.new(song_name, artist, self)
  end
  
end 