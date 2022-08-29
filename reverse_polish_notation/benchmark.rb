require 'benchmark'
require_relative 'reverse_polish_notation_calculator.rb'
require_relative 'gludek_rpn_calculator.rb'

input = '1 2 3*+ 5 5*- 6 3/+'
n = 10_000

Benchmark.bm(10) do |x|
  x.report('Czarek:') do
    n.times { ReversePolishNotationCalculator.calculate(input) }
  end
  x.report('Gludek:') do
    n.times { GludekRPNCalculator.calculate(input) }
  end
end
