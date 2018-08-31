require 'rampi/node'
require 'rampi/variables'

module Rampi
  module Helpers
    # Step semiquaver counter
    def step(value)
      (v1 / 1000) % value
    end

    # Exponential envelope
    def expe(value)
      1 - pow((v1 % 1000) / 1000, value)
    end

    # Inverse exponential envelope
    def invexpe(value)
      pow((v1 % 1000) / 1000, value)
    end
  end
end
