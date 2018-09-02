require 'rampi/node'
require 'rampi/variables'

module Rampi
  module Helpers
    # Step counter
    # By default, len is 1000 = semiquaver
    def step(value, len=16)
      (v1 / len2dur(len)) % value
    end

    # Exponential envelope
    def expe(value, len=16)
      dur = len2dur(len)
      1 - pow((v1 % dur) / dur, value)
    end

    # Inverse exponential envelope
    def invexpe(value, len=16)
      dur = len2dur(len)
      pow((v1 % dur) / dur, value)
    end

    # Converts +note_length+ to ramp duration
    #
    # @example len2dur(16) #=> 1000
    # @example len2dur(8)  #=> 2000
    #
    def len2dur(note_length)
      2 * 8000 / note_length
    end
  end
end
