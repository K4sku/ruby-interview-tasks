class GludekRPNCalculator
  def self.calculate(equation)
    sub_equation_regex = %r{-?\d+ -?\d+[+*-/]}

    while equation.match?(sub_equation_regex)
      sub_equation = equation[sub_equation_regex].split(%r{\s|(?=[+*-/])})
      solved_sub = sub_equation[0].to_i.method(sub_equation[2].to_sym).call sub_equation[1].to_i
      equation.sub!(sub_equation_regex, solved_sub.to_s)
    end
    equation.to_i
  end
end