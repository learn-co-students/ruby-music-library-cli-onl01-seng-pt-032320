class Artist
  attr_accessor :name 
  
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
  
  def self.create(artisit)
    created_artisit = Artist.new(artisit)
    @@all << self
    self
  end
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end
end