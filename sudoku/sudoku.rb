class Sudoku
  ROW_SEPARATOR = "---+---+---\n".freeze
  INITIAL_CANDIDATES = %w[1 2 3 4 5 6 7 8 9].freeze
  @sudoku_array = []
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

    @sudoku_array = parse_to_array
    @sudoku_array.each
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

  def column(col_no)
    column = ''
    (0..8).each do |i|
      column << @input[i * 9 + col_no]
    end
    column
  end

  # def square(square_no)
  #   square = ''
  #   (0.8).each do |i|

  #   end
  #   square
  # end

  def parse_to_array
    # sudoku_array = []
    # 9.times do |i|
    #   sudoku_array << @input.slice((i * 9), 9).chars
    # end
    # sudoku_array

    @input.chars.each_with_index do |char, index|
      9.times do |
    end
  end

  def fill_candidates
    @input.chars.each_with_index do |char, index|
      @candidates[index] = if char == '0'
                             Array.new(INITIAL_CANDIDATES)
                           else
                             char
                           end
    end
  end
end
