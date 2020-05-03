module Concerns
  module Findable


      def find_by_name(name)
    # @@all.detect{|a| a.name == name}
        self.all.find do |obj|
          obj.name == name
        end
      end

      def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
      end

    end
end
