require 'rampi/node'

module Rampi
  module Variables
    # Time variable, actual value of the ramp
    # +8000 per cycle
    def v1
      Var.new(:v1)
    end

    # Random variable between 0 and 1
    # Updated at every step
    def v2
      Var.new(:v2)
    end
  end
end
