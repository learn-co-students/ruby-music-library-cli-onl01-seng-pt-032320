class Artist

  attr_accessor :name, :song
  
  @@all = []
  
  def initialize (name)
    @name = name
    save
    @song = []
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
    Artist.new(name).save
  end 
  
  def new_song (song_name, genre)
    Song.new(song_name, self, genre)
  end 
  
  def songs 
    Song.all.select do |song|
      song.artist == self 
    end
  end 
  
end 