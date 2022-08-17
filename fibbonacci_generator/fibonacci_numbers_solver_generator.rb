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
  end
end

FibonacciNumbersSolverGenerator.generate_fibonacci_number_solver(1_000)
