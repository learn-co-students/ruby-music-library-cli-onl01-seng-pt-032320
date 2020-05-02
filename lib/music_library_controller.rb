require 'pry'
class MusicLibraryController
  def initialize (path = './db/mp3s')
    file = MusicImporter.new(path)
    file.import
  end 
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets 
    if input == "list songs"
      list_songs
    elsif input == "list artists" 
      list_artists
    elsif input == "list genres" 
      list_genres
    elsif input == "list artist" 
      list_songs_by_artist
    elsif input == "list genre" 
      list_songs_by_genre
    elsif input == "play song" 
      play_song
    elsif input == "exit"
    else 
      call 
    end 
  end 
  
  def list_songs
    list = Song.all.uniq
    list = list.sort! { |a,b| a.name <=> b.name }
    list.each_with_index do |song, index|
      number = index + 1
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    list = Artist.all.uniq 
    list = list.sort! { |a,b| a.name <=> b.name }
    list.each_with_index do |song, index|
      #binding.pry
      number = index + 1
      puts "#{number}. #{song.name}"
    end
  end 
  
  def list_genres
    list = Genre.all.uniq 
    list = list.sort! { |a,b| a.name <=> b.name }
    list.each_with_index do |song, index|
      #binding.pry
      number = index + 1
      puts "#{number}. #{song.name}"
    end
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if artist = Artist.find_by_name(input)
      list = artist.songs.uniq
      list = list.sort! { |a,b| a.name <=> b.name }
      list.each_with_index do |song, index|
        number = index + 1
        puts "#{number}. #{song.name} - #{song.genre.name}"
      end
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if genre = Genre.find_by_name(input)
      list = genre.songs.uniq
      list = list.sort! { |a,b| a.name <=> b.name }
      list.each_with_index do |song, index|
        number = index + 1
        puts "#{number}. #{song.artist.name} - #{song.name}"
      end
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    total_number = Song.all.uniq.size
    number = gets 
    input = number.to_i
    if (input > 0) && (input < total_number)
      new = Song.all.uniq
      list = new.sort! { |a,b| a.name <=> b.name }
      song = list [input - 1 ]
      puts "Playing #{song.name} by #{song.artist.name}"
    else 
      return input
    end 
  end 
  
end 