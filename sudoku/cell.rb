class Cell
  attr_accessor :candidates, :solved, :number

  def initialize(solved:, number:)
    if solved.nil?
      @candidates = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    else
      @solved = solved
      @number = number
    end
  end
end
