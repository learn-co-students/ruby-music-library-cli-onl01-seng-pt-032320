class MusicLibraryController
  attr_reader :MusicImporter
  def initialize(path='./db/mp3s')
    @path = MusicImporter.new(path).import
  end

  def call
    while true do
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    command = gets
    if command == "exit"
      return
    elsif command == "list songs"
      list_songs
    elsif command == "list artists"
      list_artists
    elsif command == "list genres"
      list_genres
    elsif command == "list artist"
      list_songs_by_artist
    elsif command == "list genre"
      list_songs_by_genre
    elsif command == "play song"
      play_song
    end
  end

  end

  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name }.each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index{|artist, i| puts "#{i+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index{|genre, i| puts "#{i+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    if artist == nil
      return
    end
    artist.songs.sort{|a,b| a.name <=> b.name }.each_with_index{|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    if genre == nil
      return
    end
    genre.songs.sort{|a,b| a.name <=> b.name }.each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    #list_songs
    song_num = gets
    songs = Song.all.sort{|a,b| a.name <=> b.name }
    song_num_as_i = song_num.to_i
    if song_num_as_i < 1 || song_num_as_i > songs.length
      return
    end
    song = songs[song_num_as_i - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
  end

end
