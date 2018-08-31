module Rampi
  class Node
    def +(rvalue)
      BinaryExpr.new(:+, self, rvalue)
    end

    def -(rvalue)
      BinaryExpr.new(:-, self, rvalue)
    end

    def *(rvalue)
      BinaryExpr.new(:*, self, rvalue)
    end

    def /(rvalue)
      BinaryExpr.new(:/, self, rvalue)
    end

    def %(rvalue)
      BinaryExpr.new(:%, self, rvalue)
    end

    def **(rvalue)
      BinaryExpr.new(:**, self, rvalue)
    end

    def >>(rvalue)
      BinaryExpr.new(:>>, self, rvalue)
    end

    def <<(rvalue)
      BinaryExpr.new(:<<, self, rvalue)
    end

    def <(rvalue)
      BinaryExpr.new(:<, self, rvalue)
    end

    def <=(rvalue)
      BinaryExpr.new(:<=, self, rvalue)
    end

    def >(rvalue)
      BinaryExpr.new(:>, self, rvalue)
    end

    def >=(rvalue)
      BinaryExpr.new(:>=, self, rvalue)
    end

    def ==(rvalue)
      BinaryExpr.new(:==, self, rvalue)
    end

    def !=(rvalue)
      BinaryExpr.new(:!=, self, rvalue)
    end

    def &(rvalue)
      BinaryExpr.new(:&, self, rvalue)
    end

    def ^(rvalue)
      BinaryExpr.new(:^, self, rvalue)
    end

    def |(rvalue)
      BinaryExpr.new(:|, self, rvalue)
    end

    def -@
      UnaryExpr.new(:-, self)
    end

    def ~
      UnaryExpr.new(:~, self)
    end
  end

  class BinaryExpr < Node
    attr_accessor :op, :left, :right

    def initialize(op, left, right)
      @op = op
      @left = left
      @right = right
    end

    def to_s
      "(#{@left} #{@op} #{@right})"
    end
    alias_method :inspect, :to_s

    def accept(visitor)
      visitor.visit_binary_expr(self)
    end
  end

  class UnaryExpr < Node
    attr_accessor :op, :value

    def initialize(op, value)
      @op = op
      @value = value
    end

    def to_s
      "#{@op}#{@value}"
    end
    alias_method :inspect, :to_s

    def accept(visitor)
      visitor.visit_unary_expr(self)
    end
  end

  class Func < Node
    attr_accessor :name, :args, :kwargs

    def initialize(name, *args, **kwargs)
      @name = name
      @args = args
      @kwargs = kwargs
    end

    def to_s
      kwargs_s = @kwargs.map { |k, v| "#{k}: #{v}" }.join(', ')
      args_s = @args.join(', ')
      "#{@name}(#{args_s}#{!kwargs_s.empty? ? ", #{kwargs_s}" : ''})"
    end
    alias_method :inspect, :to_s

    def accept(visitor)
      visitor.visit_func(self)
    end
  end

  class Var < Node
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def to_s
      name.to_s
    end
    alias_method :inspect, :to_s

    def accept(visitor)
      visitor.visit_var(self)
    end
  end
end
