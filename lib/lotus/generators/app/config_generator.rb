require 'lotus/generator'

module Lotus
  module Generators
    module App
      class ConfigGenerator < Lotus::Generator
        def _run
          directory "#{@options[:app_name]}/config"
        end
      end
    end
  end
end
