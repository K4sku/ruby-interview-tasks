require_relative 'cell'

class Sudoku
  ROW_SEPARATOR = "---+---+---\n".freeze
  ROW0 = [0, 1, 2, 3, 4, 5, 6, 7, 8].freeze
  ROW1 = [9, 10, 11, 12, 13, 14, 15, 16, 17].freeze
  ROW2 = [18, 19, 20, 21, 22, 23, 24, 25, 26].freeze
  ROW3 = [27, 28, 29, 30, 31, 32, 33, 34, 35].freeze
  ROW4 = [36, 37, 38, 39, 40, 41, 42, 43, 44].freeze
  ROW5 = [45, 46, 47, 48, 49, 50, 51, 52, 53].freeze
  ROW6 = [54, 55, 56, 57, 58, 59, 60, 61, 62].freeze
  ROW7 = [63, 64, 65, 66, 67, 68, 69, 70, 71].freeze
  ROW8 = [72, 73, 74, 75, 76, 77, 78, 79, 80].freeze
  ROWS = [ROW0, ROW1, ROW3, ROW4, ROW5, ROW6, ROW7, ROW8].freeze

  @sudoku_cells = []
  @candidates = {}

  def initialize(input)
    @input = input
  end

  def to_s
    return ['incorrect input format'] unless correct_length? && correct_characters?

    input_copy = String.new(@input)
    formated_sudoku = ''
    row_no = 1
    9.times do
      row = input_copy.slice!(0, 9)
      decorate_number_row!(row)
      formated_sudoku << row
      if [3, 7].include?(row_no)
        formated_sudoku << ROW_SEPARATOR
        row_no += 1
      end
      row_no += 1
    end
    formated_sudoku.gsub(/0/, ' ')
  end

  def solve
    return ['can\'t be solved'] unless correct_length? && correct_characters?

    fill_sudoku_cells
    @sudoku_cells.each do |cell|

    end
  end

  private

  def correct_length?
    @input.length == 81
  end

  def correct_characters?
    @input.gsub(/[^0-9]/).none?
  end

  def decorate_number_row!(row)
    row.insert(9, "\n")
    row.insert(6, '|')
    row.insert(3, '|')
  end

  def valid_block?(values)
    values.delete(0)
    values.uniq.length == values.length
  end

  def row(row_no)
    @input.slice((row_no * 9), 9)
  end

  def row_number(cell_id)
    cell_id / 9
  end

  def column(col_no)
    column = ''
    (0..8).each do |i|
      column << @input[i * 9 + col_no]
    end
    column
  end

  def column_number(cell_id)
    cell_id % 9
  end

  # def square(square_no)
  #   square = ''
  #   (0.8).each do |i|

  #   end
  #   square
  # end

  def square_number(cell_id)
    row_number(cell_id) / 3 * 3 + column_number(cell_id) / 3
  end

  def fill_sudoku_cells
    @input.each_char do |char|
      cell = if char == '0'
               Cell.new
             else
               Cell.new(solved: true, number: char.to_i)
             end
      @sudoku_cells << cell
    end
  end

  
end
