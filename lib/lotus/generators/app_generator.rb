require 'lotus/generator'
require_relative 'app/directory_generator'
require_relative 'app/structure_generator'
require_relative 'app/rackup_generator'
require_relative 'app/bundler_generator'
require_relative 'app/config_generator'
require_relative 'app/applications_generator'

module Lotus
  module Generators
    class AppGenerator
      DEFAULT_GENERATORS = [
        App::DirectoryGenerator,
        App::StructureGenerator,
        App::RackupGenerator,
        App::ConfigGenerator,
        App::ApplicationsGenerator,
        App::BundlerGenerator
      ].freeze

      def initialize(options = {})
        @options = options
        extract_options!
        @run_generators = []
      end

      def run
        @generators.each do |generator|
          @run_generators << generator.new(@options).tap { |g|
            g.run
          }
        end
      rescue GeneratorError => e
        rollback!
        raise e
      end

      private

      def rollback!
        @run_generators.each do |generator|
          generator.rollback
        end
      end

      def extract_options!
        @generators = @options.fetch(:generators, DEFAULT_GENERATORS)
      end
    end
  end
end
