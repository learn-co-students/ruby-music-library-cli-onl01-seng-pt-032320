class Genre

 extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    var = Genre.new(name)
    var.save
    var

  end

  def artists
    songs.map(&:artist).uniq
  end

end
