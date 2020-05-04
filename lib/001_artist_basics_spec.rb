class Artist
  attr_accessor :name 
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if @songs.include?(song)
      @songs
    else @songs << song
    end
  end
  
  
  
  def songs
    @songs
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
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end
end