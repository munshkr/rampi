module Rampi
  class Code
    def self.from_file(path)
      new(File.read(path), path)
    end

    def initialize(rampi_source, filename='(rampi)', lineno=1)
      @block = CleanBinding.get.eval(<<-END_SOURCE, filename, lineno-1)
        Proc.new do
          #{rampi_source}
        end
      END_SOURCE
    end

    def eval
      dsl = DSL.new
      dsl.instance_eval(&@block)
    end

    module CleanBinding
      def self.get
        binding
      end
    end
  end
end
