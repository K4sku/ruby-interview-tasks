class FibonacciNumbersGenerator
  def self.find_nth(nth)
    last_number = 0
    next_number = 0
    current_number = 1
    (nth - 1).times do
      next_number = count_next(last_number, current_number)
      last_number = current_number
      current_number = next_number
    end
    current_number
  end

  class << self
    def count_next(last, current)
      last + current
    end
  end
end
