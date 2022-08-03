require_relative 'cell'
require 'set'

class Sudoku
  ROW_SEPARATOR = "---+---+---\n".freeze

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

    @cells = []
    @rows = Array.new(9) { [] }
    @columns = Array.new(9) { [] }
    @squres = Array.new(9) { [] }

    fill_cells
    (0..80).each do |cell|
      @rows[row_number(cell)] << cell
      @columns[column_number(cell)] << cell
    end

    return ['can\'t be solved'] unless soduku_valid?

    # puts valid?(@columns[0])
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

  def fill_cells
    @input.each_char do |char|
      cell = if char == '0'
               Cell.new
             else
               Cell.new(solved: true, number: char.to_i)
             end
      @cells << cell
    end
  end

  def soduku_valid?
    result = true
    @rows.each do |row|
      result = valid?(row)
      return false unless result
    end
    @columns.each do |row|
      result = valid?(row)
      return false unless result
    end

    result
  end

  def valid?(chunk)
    values = Set[]
    chunk.each do |index|
      puts "cell id: #{index}, solved: #{@cells[index].solved}"
      next unless @cells[index].solved

      puts values.inspect

      return false if values.add?(@cells[index].number).nil?
    end
    true
  end
end
