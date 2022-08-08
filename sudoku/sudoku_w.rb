input = '250030901010004000407000208005200000000098100040003000000360072070000003903000604'

class SudokuW
attr_reader :board

  def initialize(input)
   @board =  input.scan(/(.{9})/).map{|row| row[0].split('').map(&:to_i)}
  end
  
 def to_s
   @board.map{|row| row.join(' ')}.join("\n")
 end

 def solve
    while @board.flatten.include?(0)
        @board.each_with_index do |row, row_index|
            row.each_with_index do |element, column_index|
                if element == 0
                    candidates = (1..9).to_a
                    taken_values = check_row(row_index) | check_column(column_index) | check_square(row_index,column_index)
                    candidates = candidates-taken_values
                    @board[row_index][column_index] = candidates.first if candidates.one?
                end
            end
        end
    end
 end

 def check_row(index)
    #@board[index].each { |number| values.add(number) if number != 0 }
    row=@board[index].dup
    row.delete(0)
    row
 end

 def check_column(index)
    column=@board.map {|row| row[index] }.dup
    column.delete(0)
    column
 end

  def check_square(row_index,column_index)
    row=(row_index/3)*3
    column=(column_index/3)*3
    square=[
            @board[row][column],@board[row][column+1],@board[row][column+2],
            @board[row+1][column],@board[row+1][column+1],@board[row+1][column+2],
            @board[row+2][column],@board[row+2][column+1],@board[row+2][column+2]
    ]
    square.delete(0)
    square
  end
end
