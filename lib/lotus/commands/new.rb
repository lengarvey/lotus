require 'lotus/generators/app_generator'

module Lotus
  module Commands
    class New
      def self.generate_application(name, options = {})
        Lotus::Generators::AppGenerator.new(options.merge(app_name: name)).run
      end
    end
  end
end
