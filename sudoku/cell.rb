# definition of a Cell
# Cell represents single field of 9x9 sudoku grid
# candidates are possible numbers that do not exist in cell's row, column or square
class Cell
  attr_accessor :candidates, :solved, :number

  def initialize(solved: false, number: nil)
    @solved = solved
    if solved
      @number = number
    else
      @candidates = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end
end
