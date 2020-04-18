require 'pry'

class Song
    attr_accessor :name, :artist, :genre
   
    @@all = Array.new

    def initialize(name,artist = nil, genre = nil)       
        @name = name
        @artist = artist unless artist.nil?
        @genre = genre unless genre.nil?
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.create(name)
       temp = self.new(name)
       temp.save
       temp
    end

    
end