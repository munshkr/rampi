class Compiler
  def compile(ramp:, code:)
    code_body = code.map { |num, code_line|
      code_line.map { |k, v| v && v.accept(self) }.reject(&:nil?).join(' ')
    }.join(',')

    "r #{ramp};\n" \
    "#{ code_body.empty? ? '' : "c #{code_body};\n"}"
  end

  def visit_func(n)
    "#{n.name}(#{n.args.map { |arg| try(arg) }.join('\,')})"
  end

  def visit_var(n)
    case n.name
      when :v1 then "$v1"
      when :v2 then "$v2"
      else n.name.to_s
    end
  end

  def visit_unary_expr(n)
    "#{n.op}#{try(n.value)}"
  end

  def visit_binary_expr(n)
    "#{try(n.left)}#{n.op}#{try(n.right)}"
  end

  def try(node_or_value)
    if node_or_value.respond_to?(:accept)
      node_or_value.accept(self)
    else
      node_or_value
    end
  end
end
