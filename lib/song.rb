class Song
    extend Concerns::Findable
    attr_reader :name, :artist, :genre

    @@all = []

    def initialize(name, a = nil, g = nil)
        @name = name
        self.artist = a if a != nil
        self.genre = g if g != nil
        save
    end

    def name=(name)
        @name = name
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
        self.new(name)
    end

    def artist=(artist)
        @artist =  artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre

        if genre.songs.include?(self) == false
            genre.add_song(self)
        end
    end

    def self.new_from_filename(filename)
        song_info = filename.split(" - ")
        song = self.new(song_info[1])
        song.artist = Artist.find_or_create_by_name(song_info[0])
        song.genre = Genre.find_or_create_by_name(song_info[2].delete_suffix(".mp3"))
        song
    end

    def self.create_from_filename(filename)
        new_from_filename(filename)
    end
end