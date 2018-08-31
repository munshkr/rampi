module Rampi
  class Code
    def self.from_file(path, port: nil)
      new(File.read(path), filename: path, port: port)
    end

    def initialize(rampi_source, filename: '(rampi)', lineno: 1, port: nil)
      @port = port
      @block = CleanBinding.get.eval(<<-END_SOURCE, filename, lineno-1)
        Proc.new do
          #{rampi_source}
        end
      END_SOURCE
    end

    def eval
      dsl = DSL.new(port: @port, autosync: false)
      dsl.instance_eval(&@block)
      dsl.sync!
    end

    module CleanBinding
      def self.get
        binding
      end
    end
  end
end
