class Genre
attr_accessor :name, :songs, :artist

extend Concerns::Findable

  @@all = []

    def initialize(name)
      @name = name
      @songs = []
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

    def add_song(song)
      unless song.genre
        song.genre = self
      end
      unless @songs.include?(song)
        @songs << song
      end
    end

    def artists
      self.songs.collect {|song| song.artist}.uniq
    end

end
