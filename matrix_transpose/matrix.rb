class Matrix
  def initialize(input)
    @input = input
  end

  def transpose
    matrix = @input.split("\n").map { |row| row.delete(' ') }
    transposed_matrix = Array.new(matrix[0].length) { [] }

    matrix.each_with_index do |row, row_index|
      row.each_char.with_index do |char, char_index|
        transposed_matrix[char_index][row_index] = char
      end
    end

    transposed_matrix.map { |row| row.join(' ') }.join("\n")
  end
end
