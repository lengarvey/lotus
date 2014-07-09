require 'lotus/generator'

module Lotus
  module Generators
    module App
      class RackupGenerator < Lotus::Generator
        def _run
          template 'config.ru', @options[:app_name], app_name: @options[:app_name]
        end
      end
    end
  end
end
