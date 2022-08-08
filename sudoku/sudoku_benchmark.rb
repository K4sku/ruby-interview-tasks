require 'benchmark'
require_relative 'sudoku_m'
require_relative 'sudoku_g'
require_relative 'sudoku_c'
require_relative 'sudoku_w'
input = '250030901010004000407000208005200000000098100040003000000360072070000003903000604'
n = 100
Benchmark.bmbm(7) do |x|
  x.report('Czarek:') { SudokuC.new(input).solve }
  x.report('Gludek:') { SudokuG.new(input).solve }
  x.report('Monka:') { SudokuM.new(input).solve }
  x.report('Mateusz:') { SudokuW.new(input).solve }
end

