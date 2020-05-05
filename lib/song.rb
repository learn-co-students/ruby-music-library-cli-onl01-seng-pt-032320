class Song 
    attr_accessor :name, :genre
    attr_reader :artist

    @@all = [] 
    def initialize(name, artist = nil, genre = nil) #default it to nil
        @name = name 
        # self.artist = artist if artist 
        # self.genre = genre if genre 
        #we are evoking a self.artist= if there's an artist and  this satisfies the test bc it wants artist = to be called, not just saved to an instance variable!
        if artist != nil
            self.artist = artist
        end 
        if genre != nil 
            self.genre = genre 
        end
    end



    def artist=(artist)
        @artist = artist 
        artist.add_song(self) #we are adding the instance of song
    end

    def genre=(genre)
        @genre = genre 
        #binding.pry
        if !genre.songs.include?(self)  #do you already include me
            genre.songs.push(self) #one instance of a song 
        end
    end
    # def genre
    #     @genre = genre 
    #    #genre_add_song(self)
    #      genre.songs.push self unless genre.songs.include? self 
    # end


    def self.all 
        @@all
    end

    def self.destroy_all
        all.clear #same as self.all.clear (implicit receiver of self)
    end

    def save 
        @@all << self # or self.class.all < self
        #calling the all method of the class and shoveling in whatever is the receiver of the method
    end

    def self.find_by_name(name)
        self.all.find do |song| 
        song.name == name
        end 
    end

    def self.create(name)
        song = self.new(name) #created song instance 
        song.save 
        song 
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name) #truthy value 

    end

    def self.new_from_filename(name)
       artist, song, genre_name = name.split(' - ')
       fixed_name = genre_name.gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song,artist, genre)
    end

    def self.create_from_filename(name)
        new_from_filename(name).save 
    end

end