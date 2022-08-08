class SudokuM
  def initialize(input)
    @input = input
    @string_arr = input.split('').map { |num| num.to_i == 0 ? ' ' : num.to_i }
    @board = @string_arr.each_slice(9).to_a
  end

  def convert(arr)
    rows = []
    (0..8).each do |i|
      rows.push('-' * 3 + '+' + '-' * 3 + '+' + '-' * 3) if i % 3 == 0 && i != 0
      row = arr[9 * i..9 * i + 2] + ['|'] + arr[9 * i + 3..9 * i + 5] + ['|'] + arr[9 * i + 6..9 * i + 8]
      rows.push(row.join(''))
    end
    rows.join("\n") + "\n"
  end

  def find_empty_coords(board)
    coords = []
    board.each_with_index do |row, row_i|
      row.each_with_index do |num, col_i|
        [' ', 0].include?(num) ? coords.push([row_i, col_i]) : ''
      end
    end
    coords
  end

  def check_in_row(board, row_idx, num)
    board[row_idx].include?(num) ? false : true
  end

  def check_in_col(board, col_idx, num)
    board.each do |row|
      return false if row[col_idx] == num
    end
  end

  def build_squares
    squares0 = []
    squares1 = []
    squares2 = []

    (0..80).step(27) do |i|
      square0 =  [@string_arr[i..i + 2], @string_arr[i + 9..i + 11], @string_arr[i + 18..i + 20]].flatten
      square1 =  [@string_arr[i + 3..i + 5], @string_arr[i + 12..i + 14],  @string_arr[i + 21..i + 23]].flatten
      square2 =  [@string_arr[i + 6..i + 8], @string_arr[i + 15..i + 17],  @string_arr[i + 24..i + 26]].flatten
      squares0.push(square0)
      squares1.push(square1)
      squares2.push(square2)
    end
    [squares0, squares1, squares2]
  end

  def check_which_square(idx)
    index = 0
    if idx.between?(0, 2)
      0
    elsif idx.between?(3, 5)
      1
    else
      2
    end
  end

  def check_in_squre(row_idx, col_idx, num)
    squares = build_squares
    array = squares[check_which_square(col_idx)][check_which_square(row_idx)]
    array.include?(num) ? false : true
  end

  def is_valid(row_idx, col_idx, num, board)
    check_in_row(board, row_idx, num) &&
      check_in_col(board, col_idx, num) &&
      check_in_squre(row_idx, col_idx, num)
  end

  def input_valid?(input)
    input.length == 81 && input.scan(/\D/).empty? ? true : false
  end

  def input_with_errors?(board)
    board.each do |row|
      without_empty = row.reject { |pos| pos == ' ' }
      return true if without_empty.uniq.length != without_empty.length
    end
    false
  end

  def solvable?(board)
    coords_pairs = find_empty_coords(board)

    return true if coords_pairs.length.zero?

    row = coords_pairs[0][0]
    col = coords_pairs[0][1]
    (1..9).each do |num|
      next unless is_valid(row, col, num, board)

      board[row][col] = num
      if solvable?(board)
        return true
      else
        board[row][col] = 0
      end
    end

    false
  end

  def to_s
    return ['incorrect input format'] unless input_valid?(@input)

    convert(@string_arr)
  end

  def solve
    return ["can\'t be solved"] unless input_valid?(@input)
    return ["can\'t be solved"] if input_with_errors?(@board)

    convert(@board.flatten) if solvable?(@board)
  end
end
