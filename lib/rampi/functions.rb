require 'rampi/node'

module Rampi
  module Functions
    ##
    # Main functions
    #

    # Conditional - if (condition, IfTrue-expr, IfFalse-expr)
    def if(cond, true_exp, false_exp)
      Func.new(:if, cond, true_exp, false_exp)
    end

    # Convert to integer
    def int(arg)
      Func.new(:int, arg)
    end

    # Round a float to a nearby integer
    def rint(arg)
      Func.new(:rint, arg)
    end

    # Convert to float
    def float(arg)
      Func.new(:float, arg)
    end

    # Absolute value (added in pd 0.3)
    def abs(arg)
      Func.new(:abs, arg)
    end

    # Minimum value between +arg1+ and +arg2+
    def min(arg1, arg2)
      Func.new(:min, arg1, arg2)
    end

    # Maximum value between +x+ and +y+
    def max(arg1, arg2)
      Func.new(:max, arg1, arg2)
    end

    # Largest integral value not greater than argument (added in pd 0.4)
    def floor(arg)
      Func.new(:floor, arg)
    end

    # Smallest integral value not less than argument (added in pd 0.4)
    def ceil(arg)
      Func.new(:ceil, arg)
    end

    # Floating-point remainder function (added in pd 0.4)
    def fmod(arg)
      Func.new(:fmod, arg)
    end

    # Get signed intergar value from floating point number(added in version 0.4)
    def imodf(arg)
      Func.new(:imodf, arg)
    end

    # Get signed fractional value from floating-point number(added in version 0.4)
    def modf(arg)
      Func.new(:modf, arg)
    end

    # Floating-point remainder function (added in versio n 0.4)
    def drem(arg1, arg2)
      Func.new(:drem, arg1, arg2)
    end

    ##
    # Power functions
    #

    # Raise +arg1+ to the power of +arg2+
    # @example pow(x, y) is x to the power of y
    def pow(arg1, arg2)
      Func.new(:pow, arg1, arg2)
    end

    # Square root of +x+
    def sqrt(arg1)
      Func.new(:sqrt, arg1)
    end

    # e raised to the power of +arg+
    # @example exp(5.2) is e raised to the power of 5.2
    def exp(arg)
      Func.new(:exp, arg)
    end

    # Natural log
    def ln(arg)
      Func.new(:ln, arg)
    end
    alias_method :log, :ln

    # Log base 10
    def log10(arg)
      Func.new(:log10, arg)
    end

    # Factorial of +arg+
    def fact(arg)
      Func.new(:fact, arg)
    end

    # Cube root (added in pd 0.4)
    def cbrt(arg)
      Func.new(:cbrt, arg)
    end

    # Exponential minus 1 (added in pd 0.4)
    def expm1(arg)
      Func.new(:expm1, arg)
    end

    # Logarithm of 1 plus (added in pd 0.4)
    def log1p(arg)
      Func.new(:log1p, arg)
    end

    # Multiply floating-point number by integral power of 2 (added in pd 0.4)
    def ldexp(arg)
      Func.new(:ldexp, arg)
    end

    ##
    # Trigonometric functions
    #

    # Sine
    def sin(arg)
      Func.new(:sin, arg)
    end

    # Cosine
    def cos(arg)
      Func.new(:cos, arg)
    end

    # Tangent
    def tan(arg)
      Func.new(:tan, arg)
    end

    # Arc sine
    def asin(arg)
      Func.new(:asin, arg)
    end

    # Arc cosine
    def acos(arg)
      Func.new(:acos, arg)
    end

    # Arc tangent
    def atan(arg)
      Func.new(:atan, arg)
    end

    # Arc tangent of 2 variables
    def atan2(arg1, arg2)
      Func.new(:atan2, arg1, arg2)
    end

    # Hyperbolic sine
    def sinh()
      Func.new(:sinh, arg)
    end

    # Hyperbolic cosine
    def cosh()
      Func.new(:cosh, arg)
    end

    # Hyperbolic tangent
    def tanh()
      Func.new(:tanh, arg)
    end

    # Inverse hyperbolic sine
    def asinh()
      Func.new(:asinh, arg)
    end

    # Inverse hyperbolic cosine
    def acosh()
      Func.new(:acosh, arg)
    end

    # Inverse hyperbolic tangent
    def atanh()
      Func.new(:atanh, arg)
    end
  end
end
