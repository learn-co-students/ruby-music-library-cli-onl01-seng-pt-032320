class Genre
  extend Common::ClassMethods
  include Common::InstanceMethods
  extend Concerns::Findable
  @@all = []

  def self.all
    @@all
  end

  attr_accessor :songs

  def initialize(name)
    super(name)
    @songs = []
  end

  def artists
    @songs.map{|song| song.artist}.uniq
  end
end
