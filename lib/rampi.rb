require 'rampi/version'
require 'rampi/node'
require 'rampi/functions'

module Rampi
  include Rampi::Functions

  # Set ramp speed of +value+
  def ramp(value)
    @ramp = value
  end
  alias :r :ramp

  # Set code line for channel +num+ with +synth+ and parameters
  def code(num, synth, lpf=0, lpq=1, delay_ms=None, delay_feed=None, pan=0.5)
    @code ||= {}
    @code[num] = {
      synth: synth,
      lpf: lpf,
      lpq: lpq,
      delay_ms: delay_ms,
      delay_feed: delay_feed,
      pan: pan,
    }
  end
  alias :c :code

  # Ramp variable
  def v1
    Var.new(:v1)
  end

  # Random number variable
  def v2
    Var.new(:v2)
  end

  # Time constant
  def t
    Var.new(:t)
  end

  # Common aliases for functions and variables
  alias :s :sin
  alias :p :pow
  alias :v :v1
  alias :x :v2
end
