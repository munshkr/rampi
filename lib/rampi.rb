require 'rampi/version'
require 'rampi/node'
require 'rampi/functions'
require 'rampi/compiler'
require 'rampi/helpers'
require 'rampi/core_ext'
require 'open3'

module Rampi
  include Rampi::Variables
  include Rampi::Functions
  include Rampi::Helpers

  # FIXME
  @@ramp ||= 1.0
  @@code ||= {}

  # Set ramp speed of +value+
  def ramp(value=nil)
    if value
      @@ramp = value
      sync!
    end
    @@ramp
  end

  # Set code line for channel +num+ with +synth+ and parameters
  def code(num, synth, lpf=0, lpq=0, delay_ms=0, delay_feed=0, pan=0)
    @@code[num] = [synth, lpf, lpq, delay_ms, delay_feed, pan]
    sync!
    @@code[num]
  end

  # Silence everything!
  def hush
    @@code = {}
    sync!
  end

  # Generate code methods
  9.times do |i|
    define_method("c#{i+1}") do |synth, *args|
      code(i+1, synth, *args)
    end
  end

  ##
  # Common aliases for functions and variables
  #

  # Same as #ramp
  alias :r :ramp
  # Same as #code(1, ...)
  alias :c :c1
  # Same as v1
  alias :t :v1
  # Same as v2
  alias :x :v2
  # Same as min(x, y)
  alias :m :min
  # Same as sin(x)
  alias :s :sin
  # Same as pow(x, y)
  alias :p :pow
  # Same as step(x)
  alias :q :step
  # Same as expe(x)
  alias :f :expe
  # Same as invexpe(x)
  alias :i :invexpe

  private

  def sync!
    Open3.popen3('pdsend 3005') do |i, o, e, t|
      i.write compile
      i.close
      res = o.read
      puts "pdsend: #{res}" if !res.empty?
    end
  end

  def compile
    @compiler ||= Compiler.new
    @compiler.compile(ramp: @@ramp, code: @@code)
  end
end
