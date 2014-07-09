module Lotus
  module Generators
    class Utilities
      def directory(name)
        puts "create directory #{name}"
      end

      def template(name, path = './', template_data = {})
        puts "templating #{path}/#{name}"
      end

      def execute(command, path = './')
        puts "executing #{command}"
      end
    end
  end
end
