class MusicImporter
  @@all = []
attr_reader :path, :files, :MusicLibraryController
  def initialize(path)
    @path = path
    @files = Dir.children(path).collect{ |file| file.split("/").last }
  end

  def self.new_by_filename(filename)
  filename_split = filename.split(" - ")
  name = filename_split[1]
  artist_name = filename_split[0]
  song = Song.new(name)
  song.artist = Artist.find_or_create_by_name(artist_name)
  song
  end

  def import
    @files.each do |filename|
        Song.create_from_filename(filename)
      end
    end
end
