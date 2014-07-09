require 'lotus/generator'

module Lotus
  module Generators
    module App
      class ApplicationsGenerator < Lotus::Generator
        def _run
          template 'applications.rb', "#{@options[:app_name]}/config"
        end
      end
    end
  end
end
