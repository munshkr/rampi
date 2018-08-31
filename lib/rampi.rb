require 'rampi/version'
require 'rampi/node'
require 'rampi/functions'
require 'rampi/compiler'
require 'rampi/helpers'

module Rampi
  include Rampi::Variables
  include Rampi::Functions
  include Rampi::Helpers

  # FIXME
  @@ramp ||= 1.0
  @@code ||= {}

  # Set ramp speed of +value+
  def ramp(value=nil)
    if value and @@ramp != value
      @@ramp = value
      sync!
    end
    @@ramp
  end

  # Set code line for channel +num+ with +synth+ and parameters
  def code(num, synth, lpf: nil, lpq: nil, delay_ms: nil, delay_feed: nil, pan: nil)
    new_code = {
      synth: synth,
      lpf: lpf,
      lpq: lpq,
      delay_ms: delay_ms,
      delay_feed: delay_feed,
      pan: pan,
    }
    if @@code[num] != new_code
      @@code[num] = new_code
      sync!
    end
    @@code[num]
  end

  # Generate code methods
  9.times do |i|
    define_method("c#{i+1}") do |synth, **kwargs|
      code(i, synth, **kwargs)
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
    # TODO run pdsend or use some OSC client !
  end

  def compile
    @compiler ||= Compiler.new
    @compiler.compile(ramp: @@ramp, code: @@code)
  end
end
