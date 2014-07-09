require_relative 'generators/utilities'
require 'forwardable'

module Lotus
  class GeneratorError < StandardError
    attr_reader :original

    def initialize(msg, original=$!)
      super(msg)
      @original = original;
    end
  end

  class Generator
    extend Forwardable

    def initialize(options = {})
      @options = options
      @utilities = Generators::Utilities.new
    end

    def run
      _run
    rescue
      raise GeneratorError, "An error occuring running a lotus generator. Please check the original exception"
    end

    def rollback
    end

    def_delegator :@utilities, :directory
    def_delegator :@utilities, :template
    def_delegator :@utilities, :execute

    protected

    def _run
      raise NotImplementedError
    end
  end
end
