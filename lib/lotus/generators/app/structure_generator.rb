require 'lotus/generator'

module Lotus
  module Generators
    module App
      class StructureGenerator < Lotus::Generator
        def _run
          directory "#{@options[:app_name]}/apps"
        end
      end
    end
  end
end
