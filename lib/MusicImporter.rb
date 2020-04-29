class MusicImporter
    attr_accessor :path, :filename

    def initialize(path)
        @path = path
        @filename = filename

    end

    def path
        @path

    end

    def files
        Dir.glob("#{path}/*").map  do |filename|
            filename.split("/").last
        end
    end

    def import
       files.each do |song|
        Song.create_from_filename(song)
    end
end 

end