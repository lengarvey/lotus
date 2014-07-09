require 'lotus/generator'

module Lotus
  module Generators
    module App
      class BundlerGenerator < Lotus::Generator
        def _run
          template 'Gemfile', @options[:app_name]
          execute 'bundle install', @options[:app_name]
        end
      end
    end
  end
end
