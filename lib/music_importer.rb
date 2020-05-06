class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |g| g.gsub("#{path}/", "") }
  end

  def import
    files.each{ |g| Song.create_from_filename(g) }
  end
end
