class Genre

  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize (name)
    @name = name
    save
    @songs = []
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
  
  def add_genre (song)      
    song.genre = self if song.genre != self
    @songs << song if @songs.include?(song) == false
  end 
  
  def songs
    @songs 
  end 
  
  def artists 
    unique = []
    songs.each do |song|
      if (unique.include?(song.artist) == false)
        unique << song.artist
      end 
    end
    unique
  end
  
end 