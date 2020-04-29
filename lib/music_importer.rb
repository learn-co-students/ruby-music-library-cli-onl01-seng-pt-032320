class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir.entries(@path).grep(/.*.mp3/)
  end
  
  def import
    self.files.map do |filename|
    Song.create_from_filename(filename)
    end
  end
end