require 'pry'

class Artist
    attr_accessor :name, :songs
    extend Concerns::Findable
    
    @@all = []

    def initialize(name)
    @name = name
    @songs = []
    save
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
        self.new(name)
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end