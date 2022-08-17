require 'benchmark'
require_relative 'fibonacci_number_solver'
require_relative 'fibonacci_numbers_generator'
require_relative 'fibonacci_numbers_solver_TDD_optimized'

inputs = [1, 3, 5, 10, 100, 1_000]
n = 1000

Benchmark.bmbm(10) do |x|
  x.report('fibonacci_number_solver:') do
    n.times { inputs.each { |input| FibonacciNumbersGenerator.find_nth(input) } }
  end
  x.report('fibonacci_numbers_generator:') do
    n.times { inputs.each { |input| FibonacciNumbersSolver.find_nth(input) } }
  end
  x.report('fibonacci_numbers_generator_TDD_optimized:') do
    n.times { inputs.each { |input| FibonacciNumbersSolverTDDOptimized.find_nth(input) } }
  end
end

# $ ruby fibonacci_benchmark.rb
# Rehearsal ------------------------------------------------------------------------------
# fibonacci_number_solver:                     0.192607   0.000000   0.192607 (  0.192608)
# fibonacci_numbers_generator:                 0.000525   0.000000   0.000525 (  0.000525)
# fibonacci_numbers_generator_TDD_optimized:   0.000522   0.000000   0.000522 (  0.000522)
# --------------------------------------------------------------------- total: 0.193654sec

#                                                  user     system      total        real
# fibonacci_number_solver:                     0.192691   0.003764   0.196455 (  0.196459)
# fibonacci_numbers_generator:                 0.000519   0.000000   0.000519 (  0.000518)
# fibonacci_numbers_generator_TDD_optimized:   0.000509   0.000000   0.000509 (  0.000508)
