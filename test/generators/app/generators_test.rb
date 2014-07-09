require 'test_helper'
require 'lotus/generators/app/directory_generator'
require 'lotus/generators/app/structure_generator'
require 'lotus/generators/app/rackup_generator'
require 'lotus/generators/app/bundler_generator'
require 'lotus/generators/app/config_generator'
require 'lotus/generators/app/applications_generator'

describe 'App Generators' do
  let(:utils) { Minitest::Mock.new }
  let(:options) { { app_name: 'hello' } }
  let(:generator) { generator_class.new(options) }

  describe 'DirectoryGenerator' do
    let(:generator_class) { Lotus::Generators::App::DirectoryGenerator }

    describe '#run' do

      it 'creates the directory specified in the options' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :directory, true, ['hello']
          generator.run
          utils.verify
        end
      end
    end
  end

  describe 'StructureGenerator' do
    let(:generator_class) { Lotus::Generators::App::StructureGenerator }

    describe '#run' do
      it 'creates the apps directory' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :directory, true, ['hello/apps']
          generator.run
          utils.verify
        end
      end
    end
  end

  describe 'RackupGenerator' do
    let(:generator_class) { Lotus::Generators::App::RackupGenerator }

    describe '#run' do
      it 'creates the rackup file' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :template, true, ['config.ru', 'hello', app_name: 'hello']
          generator.run
          utils.verify
        end
      end
    end
  end

  describe 'ConfigGenerator' do
    let(:generator_class) { Lotus::Generators::App::ConfigGenerator }

    describe '#run' do
      it 'creates the config directory' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :directory, true, ['hello/config']
          generator.run
          utils.verify
        end
      end
    end
  end

  describe 'ApplicationsGenerator' do
    let(:generator_class) { Lotus::Generators::App::ApplicationsGenerator }

    describe '#run' do
      it 'creates the applications.rb file in the config folder' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :template, true, ['applications.rb', 'hello/config']
          generator.run
          utils.verify
        end
      end
    end
  end

  describe 'BundlerGenerator' do
    let(:generator_class) { Lotus::Generators::App::BundlerGenerator }

    describe '#run' do
      it 'creates the Gemfile and runs bundle install' do
        Lotus::Generators::Utilities.stub :new, utils do
          utils.expect :template, true, ['Gemfile', 'hello']
          utils.expect :execute, true, ['bundle install', 'hello']
          generator.run
          utils.verify
        end
      end
    end
  end

end
