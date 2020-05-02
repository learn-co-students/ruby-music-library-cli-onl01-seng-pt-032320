class MusicImporter
    attr_accessor :path

    def initialize(url)
        self.path = url
    end

    def files
        Dir.glob("#{@path}/*.mp3").map {|mp3| mp3.gsub("#{path}/", "")}
    end

    def import
        files.each{|file| Song.create_from_filename(file)}
    end
end