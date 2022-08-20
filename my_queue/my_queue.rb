class MyQueue
  attr_reader :capacity

  def initialize(capacity: 10, type: 'fifo')
    @capacity = capacity
    @type = type.downcase.to_sym if %w[fifo filo].include?(type.downcase)
    @queue = []
  end

  def empty?
    @queue.empty?
  end

  def size
    @queue.size
  end

  def full?
    @queue.size == @capacity
  end

  def push(element)
    return false if full?

    @queue.push(element)
    true
  end

  def pop
    puts @type == :filo
    return @queue.shift if @type == :filo

    @queue.pop
  end

  def peek
    return @queue.last if @type == :filo

    @queue.first
  end
end
