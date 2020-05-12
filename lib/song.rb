class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist= artist if artist
    self.genre= genre if genre
  end 
  
  def self.all 
   @@all 
  end
  
  def save
   @@all << self
  end
  
 def self.destroy_all
  @@all.clear
 end 
  
 def self.create(name)
  publish = self.new(name)
  publish.save
  publish
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre= (genre)
    @genre = genre
    if !(genre.songs.include?(self))
    genre.songs << self
    end
  end
  
def self.find_by_name(name)
   all.detect {|song| song.name == name} 
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    song = self.create(name)
  end 
end

def self.new_from_filename(filename)
   detail = filename.split(" - ")
    artist, name, genre = detail[0], detail[1], detail[2].gsub( ".mp3" , "")
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    
    self.new(name, artist, genre)
end


def self.create_from_filename(filename)
   new_from_filename(filename).tap{|gen| gen.save}
 end




  
  
end
  
  
  