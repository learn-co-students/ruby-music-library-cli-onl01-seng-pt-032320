class Artist < Song 
  extend Concerns::Findable
    
  attr_reader :songs 
  
  def initialize(name)
    super
    @songs = []
  end 
  
  def songs
    @songs
  end 
  
  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end 
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end
  
  
  

end