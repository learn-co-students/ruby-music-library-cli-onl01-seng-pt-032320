module Common
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end
  end

  module InstanceMethods
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def save
      self.class.all << self
    end
  end
end
