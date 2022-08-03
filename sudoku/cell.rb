class Cell
  attr_accessor :candidates, :solved, :number

  def initialize(solved: false, number: nil)
    if solved
      @solved = solved
      @number = number
    else
      @candidates = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end
end
