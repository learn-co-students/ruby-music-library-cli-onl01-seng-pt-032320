require 'pry'

class Song
    attr_accessor :name, :artist, :genre
   
    @@all = Array.new

    def initialize(name,artist = nil, genre = nil)       
        @name = name
        self.artist = artist unless artist.nil?
        self.genre = genre unless genre.nil?
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

    def genre=(genre)
        @genre = genre
        self.genre
        genre.songs.push(self) unless genre.songs.include?(self)
    end
    
    def self.find_by_name(name)
        self.all.find do |song|
            song.name == name
        end
    
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end


    
    
end