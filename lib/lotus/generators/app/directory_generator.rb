require 'lotus/generator'

module Lotus
  module Generators
    module App
      class DirectoryGenerator < Lotus::Generator
        def _run
          directory @options[:app_name]
        end
      end
    end
  end
end
