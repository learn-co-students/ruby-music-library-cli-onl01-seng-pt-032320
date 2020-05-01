class Artist
attr_accessor :name, :songs, :genres

  @@all = []

    def initialize(name)
      @name = name
      @songs = []
      @genres = []
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
      unless song.artist
        song.artist = self
      end
      unless @songs.include?(song)
        @songs << song
      end
    end

    def genres
      Genre.all.each do |genre|
        if genre.artist == self
          @genres << genre
        end
      end
      @genres
    end
end
