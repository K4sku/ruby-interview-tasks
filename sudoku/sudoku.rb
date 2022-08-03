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

    load_input_into_cells
    assign_cells_to_rows_columns_sqares

    return ['can\'t be solved'] unless soduku_valid?

    solved = false
    until solved
      @rows.each { |row| solve_part(row) }
      @columns.each { |column| solve_part(column) }
      @squres.each { |square| solve_part(square) }
      solved = solved?
    end
    @input = cells_to_string
    to_s
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

  def row_number(cell_id)
    cell_id / 9
  end

  def column_number(cell_id)
    cell_id % 9
  end

  def square_number(cell_id)
    row_number(cell_id) / 3 * 3 + column_number(cell_id) / 3
  end

  def load_input_into_cells
    @input.each_char do |char|
      cell = if char == '0'
               Cell.new
             else
               Cell.new(solved: true, number: char.to_i)
             end
      @cells << cell
    end
  end

  def assign_cells_to_rows_columns_sqares
    (0..80).each do |index|
      @rows[row_number(index)] << @cells[index]
      @columns[column_number(index)] << @cells[index]
      @squres[square_number(index)] << @cells[index]
    end
  end

  def soduku_valid?
    result = true
    @rows.each do |row|
      result = valid?(row)
      return false unless result
    end
    @columns.each do |column|
      result = valid?(column)
      return false unless result
    end
    @squres.each do |square|
      result = valid?(square)
      return false unless result
    end

    result
  end

  def valid?(part)
    values = Set[]
    part.each do |cell|
      next unless cell.solved

      return false if values.add?(cell.number).nil?
    end
    true
  end

  def solve_part(part)
    values = []
    part.each do |cell|
      values << cell.number if cell.solved
    end
    part.each do |cell|
      next if cell.solved

      cell.candidates = cell.candidates.difference(values)
      if cell.candidates.one?
        cell.solved = true
        cell.number = cell.candidates.pop
      end
    end
  end

  def solved?
    @cells.none? { |cell| cell.solved == false }
  end

  def cells_to_string
    output = ''
    @cells.each do |cell|
      output << cell.number.to_s
    end
    output
  end
end
