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

  # Generate code methods
  9.times do |i|
    define_method("c#{i+1}") do |synth, *args|
      code(i+1, synth, *args)
    end
  end

  # Common aliases for functions and variables
  alias :r :ramp
  alias :c :c1
  alias :t :v1
  alias :x :v2
  alias :m :min
  alias :s :sin
  alias :p :pow

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
