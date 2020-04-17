require 'pry'

class Artist
    attr_accessor :name
    attr_reader :songs

@@all = Array.new

def initialize(name)
    @name = name
    @songs = Array.new
    
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
    temp = self.new(name)
end

def songs
    Song.all.select {|song| song.artist == self}
end

def add_song(song)
    song.artist = self
end

def genres 
    Genres.all.detect do |genre|
        genre.artist == self
    end
end


end