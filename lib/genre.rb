require 'pry'
class Genre

    extend Concerns::Findable
    
    attr_accessor :name

    @@all = Array.new

    def initialize(name)
        @name = name
        @songs = Array.new
    
        
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

    def self.create(name)
        temp = self.new(name)
        temp.save
        temp
    end

    def genres
        Artist.all.find |artist|
        artist.genre == self
    end

    def songs
        @songs
    end

    def artists 
        songs.collect {|e| e.artist}.uniq
    end


end