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
