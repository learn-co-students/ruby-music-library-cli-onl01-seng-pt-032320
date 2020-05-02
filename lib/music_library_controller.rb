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
      #binding.pry
      number = index + 1
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    list = Song.all.uniq 
    list = list.sort! { |a,b| a.artist.name <=> b.artist.name }
    array = []
    list.each do |song|
      array << "#{song.artist.name}"
    end 
    array.uniq!
    array.each_with_index do |song, index|
      #binding.pry
      number = index + 1
      puts "#{number}. #{song}"
    end
  end 
  
  def list_genres
    list = Song.all.uniq 
    list = list.sort! { |a,b| a.genre.name <=> b.genre.name }
    array = []
    list.each do |song|
      array << "#{song.genre.name}"
    end 
    array.uniq!
    array.each_with_index do |song, index|
      #binding.pry
      number = index + 1
      puts "#{number}. #{song}"
    end
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if (Artist.find_by_name(input) == true)
    else 
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
     if (Genre.find_by_name(input) == true)
    else 
    end 
  end 
  
  def play_song
  end 
  
end 