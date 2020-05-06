class Artist
  extend Common::ClassMethods
  include Common::InstanceMethods
  extend Concerns::Findable
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    super(name)
    @songs = []
  end

  attr_reader :songs, :genre, :name

  def add_song(song)
    return if song.artist != nil || @songs.include?(song)
    @songs << song
    song.setArtist(self)
  end

  def genres
      @songs.map{ |song|  song.genre}.uniq
    end
end
