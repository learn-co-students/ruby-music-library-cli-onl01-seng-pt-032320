require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = Array.new

    def initialize(name,artist = nil,genre = nil)
        @name = name
        @artist = artist
        @genre = genre
        
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
       temp.save
       temp
    end
end