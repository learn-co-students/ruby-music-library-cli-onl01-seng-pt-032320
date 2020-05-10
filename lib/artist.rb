class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
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
  
  def self.create(name)
    newartist = Artist.new(name)
    newartist.save
    newartist
  end
  
  def genres
    genres = []
    self.songs.map do |song|
      genres << song.genre
    end
    genres.uniq
  end
    

  
end