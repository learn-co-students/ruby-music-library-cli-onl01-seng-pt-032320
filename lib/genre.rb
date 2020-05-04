class Genre
  extend Concerns::Findable
attr_accessor :name, :songs
@@all =[]
  def initialize(name)
    @name = name
    @songs=[]
    save
  end

  def self.create(name)
    Genre.new(name)
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

  def artists
    Song.all.map{|song| song.artist}.uniq
  end
end
