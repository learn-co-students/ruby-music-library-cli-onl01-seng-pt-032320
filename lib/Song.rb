class Song
attr_accessor :name
attr_reader :artist, :genre

@@all = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
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

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end



end
