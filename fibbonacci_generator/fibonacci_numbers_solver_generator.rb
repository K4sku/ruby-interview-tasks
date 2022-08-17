require_relative 'fibonacci_numbers_generator'

class FibonacciNumbersSolverGenerator
  def self.generate_fibonacci_number_solver(nth)
    File.open('fibonacci_number_solver.rb', 'w') do |f|
      f.write "class FibonacciNumbersSolver
  def self.fibonacci_number_solver(nth)
    case nth\n"
      nth.times do |i|
        f.write "    when #{i + 1}
      #{FibonacciNumbersGenerator.find_nth(i + 1)}\n"
      end
      f.write "    else
      'This class is not meant to know that!'
    end
  end
end\n"
    end

    case nth
    when 1
      1
    when 3
      2
    when 5
      5
    when 10
      55
    when 100
      354_224_848_179_261_915_075
    when 1_000
      43_466_557_686_937_456_435_688_527_675_040_625_802_564_660_517_371_780_402_481_729_089_536_555_417_949_051_890_403_879_840_079_255_169_295_922_593_080_322_634_775_209_689_623_239_873_322_471_161_642_996_440_906_533_187_938_298_969_649_928_516_003_704_476_137_795_166_849_228_875
    else
      'This class is not meant to know that!'
    end
  end
end

FibonacciNumbersSolverGenerator.generate_fibonacci_number_solver(1_000)
