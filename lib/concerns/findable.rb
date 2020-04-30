module Concerns::Findable

  @@all = []
    def initialize(name)
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
      name = self.new(name)
      name.save
      name
    end

end
