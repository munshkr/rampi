module Rampi::CoreExt
  module Numeric
    def +(o);  o.is_a?(Node) ? BinaryExpr.new(:+, self, o)  : super(o); end
    def -(o);  o.is_a?(Node) ? BinaryExpr.new(:-, self, o)  : super(o); end
    def *(o);  o.is_a?(Node) ? BinaryExpr.new(:*, self, o)  : super(o); end
    def /(o);  o.is_a?(Node) ? BinaryExpr.new(:/, self, o)  : super(o); end
    def %(o);  o.is_a?(Node) ? BinaryExpr.new(:%, self, o)  : super(o); end
    def **(o); o.is_a?(Node) ? BinaryExpr.new(:**, self, o) : super(o); end
    def >>(o); o.is_a?(Node) ? BinaryExpr.new(:>>, self, o) : super(o); end
    def <<(o); o.is_a?(Node) ? BinaryExpr.new(:<<, self, o) : super(o); end
    def <(o);  o.is_a?(Node) ? BinaryExpr.new(:<, self, o)  : super(o); end
    def <=(o); o.is_a?(Node) ? BinaryExpr.new(:<=, self, o) : super(o); end
    def >(o);  o.is_a?(Node) ? BinaryExpr.new(:>, self, o)  : super(o); end
    def >=(o); o.is_a?(Node) ? BinaryExpr.new(:>=, self, o) : super(o); end
    def ==(o); o.is_a?(Node) ? BinaryExpr.new(:==, self, o) : super(o); end
    def !=(o); o.is_a?(Node) ? BinaryExpr.new(:!=, self, o) : super(o); end
    def &(o);  o.is_a?(Node) ? BinaryExpr.new(:&, self, o)  : super(o); end
    def ^(o);  o.is_a?(Node) ? BinaryExpr.new(:^, self, o)  : super(o); end
    def |(o);  o.is_a?(Node) ? BinaryExpr.new(:|, self, o)  : super(o); end
  end
end

class Float
  prepend Rampi::CoreExt::Numeric
end

class Rational
  prepend Rampi::CoreExt::Numeric
end

class Fixnum
  prepend Rampi::CoreExt::Numeric
end
