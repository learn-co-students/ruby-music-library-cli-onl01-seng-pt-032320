module Concerns
  module Findable


      def find_by_name(string_name)
        @@all.find do |klass_obj|
          klass_obj.name == string_name
        end
      end




    end
end
