require 'benchmark'
require_relative 'fibonacci_number_solver'
require_relative 'fibonacci_numbers_generator'
require_relative 'fibonacci_numbers_solver_TDD_optimized'

inputs = [1, 3, 5, 10, 100, 1_000]
n = 1000

# task resolution by Gludek
class GludeksFibonacci
  def self.find_nth(number, fibonacci = {})
    return number if [1, 0].include?(number)

    fibonacci[number] ||= find_nth(number - 1, fibonacci) + find_nth(number - 2, fibonacci)
  end
end

Benchmark.bmbm(10) do |x|
  x.report('fibonacci_number_solver:') do
    n.times { inputs.each { |input| FibonacciNumbersGenerator.find_nth(input) } }
  end
  x.report('fibonacci_numbers_generator:') do
    n.times { inputs.each { |input| FibonacciNumbersSolver.find_nth(input) } }
  end
  x.report('fibonacci_numbers_solver_TDD_optimized:') do
    n.times { inputs.each { |input| FibonacciNumbersSolverTDDOptimized.find_nth(input) } }
  end
  x.report('Gludeks_fibonacci:') do
    n.times { inputs.each { |input| GludeksFibonacci.find_nth(input) } }
  end
end

# $ ruby fibonacci_benchmark.rb
# Rehearsal ------------------------------------------------------------------------------
# fibonacci_number_solver:                     0.189502   0.000216   0.189718 (  0.189737)
# fibonacci_numbers_generator:                 0.000565   0.000018   0.000583 (  0.000584)
# fibonacci_numbers_solver_TDD_optimized:      0.000518   0.000017   0.000535 (  0.000535)
# Gludeks_fibonacci:                           0.485256   0.003939   0.489195 (  0.489198)
# --------------------------------------------------------------------- total: 0.680031sec

#                                                  user     system      total        real
# fibonacci_number_solver:                     0.186599   0.000000   0.186599 (  0.186608)
# fibonacci_numbers_generator:                 0.000575   0.000000   0.000575 (  0.000574)
# fibonacci_numbers_solver_TDD_optimized:      0.000535   0.000000   0.000535 (  0.000534)
# Gludeks_fibonacci:                           0.487862   0.000000   0.487862 (  0.487880)
