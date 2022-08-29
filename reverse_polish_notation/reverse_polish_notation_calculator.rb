class ReversePolishNotationCalculator
  @operators = %w[+ - / *].freeze
  @buffer = ''
  @operands = []
  def self.calculate(input)
    input.each_char do |char|
      if char == ' '
        parse_buffer_to_operands
        next
      end
      if @operators.include?(char)
        parse_buffer_to_operands
        evaluate(char)
        next
      end
      @buffer << char
    end
    @operands.pop
  end

  def self.evaluate(operand)
    second_op = @operands.pop
    first_op = @operands.pop
    @operands.push(first_op.send(operand.to_sym, second_op))
  end

  def self.parse_buffer_to_operands
    return if @buffer.empty?

    @operands.push(@buffer.to_i)
    @buffer.clear
  end
end
