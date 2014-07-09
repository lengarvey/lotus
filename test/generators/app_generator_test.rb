require 'test_helper'
require 'lotus/generators/app_generator'

module Lotus
  module Generators
    describe AppGenerator do
      describe '#run' do
        let(:fake_generator) do
          Class.new do
            def initialize(raise_error = false)
              @generator_run      = false
              @generator_rollback = false
              @raise_error        = raise_error
            end

            def run
              raise Lotus::Generators::GeneratorError if @raise_error
              @generator_run = true
            end

            def rollback
              @generator_rollback = true
            end

            attr_reader :generator_run, :generator_rollback

            def new(*args)
              self
            end
          end
        end

        let(:fake_generator_one) { fake_generator.new }
        let(:fake_generator_two) { fake_generator.new }

        let(:options) { { generators: [fake_generator_one, fake_generator_two] } }
        let(:app_generator) { AppGenerator.new(options) }

        it 'delegates the app creation to a series of generators' do
          app_generator.run
          fake_generator_one.generator_run.must_equal true
          fake_generator_two.generator_run.must_equal true
        end

        describe 'when there is an error' do
          let(:fake_generator_two) { fake_generator.new(true) }

          it 'rolls back the previous generators' do
            proc { app_generator.run }.must_raise Lotus::Generators::GeneratorError
            fake_generator_one.generator_rollback.must_equal true
            fake_generator_two.generator_rollback.must_equal false
          end
        end
      end
    end
  end
end
