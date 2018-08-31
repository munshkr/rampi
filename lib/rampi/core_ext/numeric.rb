module Rampi
  module CoreExt
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
end

class Float
  prepend Rampi::CoreExt::Numeric
end

class Rational
  prepend Rampi::CoreExt::Numeric
end

if RUBY_VERSION.to_f >= 2.4
  class Integer
    prepend Rampi::CoreExt::Numeric
  end
else
  class Fixnum
    prepend Rampi::CoreExt::Numeric
  end

  class Bignum
    prepend Rampi::CoreExt::Numeric
  end
end
