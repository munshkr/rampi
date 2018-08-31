require 'rampi/node'
require 'rampi/functions'
require 'rampi/compiler'
require 'rampi/helpers'
require 'rampi/core_ext'
require 'open3'

module Rampi
  class DSL
    include Rampi::Variables
    include Rampi::Functions
    include Rampi::Helpers

    def initialize(port: 3005, autosync: true)
      @port = port
      @autosync = autosync
      @ramp ||= 1.0
      @code ||= {}
    end

    # Set ramp speed of +value+
    def ramp(value=nil)
      if value
        @ramp = value
        sync
      end
      @ramp
    end

    # Set code line for channel +num+ with +synth+ and parameters
    def code(num, synth, lpf=0, lpq=0, delay_ms=0, delay_feed=0, pan=0)
      @code[num] = [synth, lpf, lpq, delay_ms, delay_feed, pan]
      sync
      @code[num]
    end

    # Silence everything!
    def hush
      @code = {}
      sync
    end

    ##
    # Common aliases for functions and variables
    #

    # Generate code methods
    9.times do |i|
      define_method("c#{i+1}") do |synth, *args|
        code(i+1, synth, *args)
      end
    end

    # Same as #ramp
    alias_method :r, :ramp
    # Same as #code(1, ...)
    alias_method :c, :c1
    # Same as v1
    alias_method :t, :v1
    # Same as v2
    alias_method :x, :v2
    # Same as min(x, y)
    alias_method :m, :min
    # Same as sin(x)
    alias_method :s, :sin
    # Same as pow(x, y)
    alias_method :p, :pow
    # Same as step(x)
    alias_method :q, :step
    # Same as expe(x)
    alias_method :f, :expe
    # Same as invexpe(x)
    alias_method :i, :invexpe

    def sync
      sync! if @autosync
    end

    def sync!
      Open3.popen3("pdsend #{@port}") do |i, o, e, t|
        i.write compile
        i.close
        res = o.read
        puts "pdsend: #{res}" if !res.empty?
      end
    end

    def compile
      @compiler ||= Compiler.new
      @compiler.compile(ramp: @ramp, code: @code)
    end
  end
end
