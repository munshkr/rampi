require 'rampi/node'

module Rampi
  module Functions
    # Sine
    def sin(value)
      Func.new(:sin, value)
    end

    # Raise to the power of +value+
    # @example pow(x,y) is x to the power of y
    def pow(x, y)
      Func.new(:pow, x, y)
    end

    # Square root of +x+
    def sqrt(x)
      Func.new(:sqrt, x)
    end

    # Conditional - if (condition, IfTrue-expr, IfFalse-expr)
    def if(cond, true_exp, false_exp)
      Func.new(:if, cond, true_exp, false_exp)
    end

    def min(x, y)
      Func.new(:min, x, y)
    end

    def max(x, y)
      Func.new(:max, x, y)
    end
  end
end
