require 'rspec'
require_relative 'my_queue'

describe MyQueue do
  describe '#empty?' do
    it 'returns true when the queue if empty' do
      queue = MyQueue.new

      expect(queue.empty?).to be true
    end

    it 'returns false when the queue is not empty' do
      queue = MyQueue.new
      queue.push 1

      expect(queue.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns 0 when the queue is empty' do
      queue = MyQueue.new

      expect(queue.size).to be 0
    end

    it 'returns number of elements in the non-empty queue' do
      queue = MyQueue.new
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.size).to be 2
    end
  end

  describe '#capacity' do
    it 'returns 10 when the queue is initialized without capacity attribute' do
      queue = MyQueue.new

      expect(queue.capacity).to be 10
    end

    it 'returns value of capacity passed during creation' do
      queue = MyQueue.new(capacity: 2)

      expect(queue.capacity).to be 2
    end
  end

  describe '#full?' do
    it 'returns true when number of elements is equal to capacity' do
      queue = MyQueue.new(capacity: 2)
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.full?).to be true
    end

    it 'returns false when number of elements is less than capacity' do
      queue = MyQueue.new(capacity: 2)
      queue.push 1

      expect(queue.full?).to be false
    end
  end

  describe '#peek' do
    it 'returns first element from the FIFO queue' do
      queue = MyQueue.new
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.peek).to eq('foo')
    end

    it 'returns last element from the FILO queue' do
      queue = MyQueue.new(type: 'filo')
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.peek).to eq('bar')
    end

    it 'does not remove returned element from the queue' do
      queue = MyQueue.new
      queue.push 'foo'

      expect { queue.peek }.not_to change { queue.size }
    end

    it 'returns nil if the queue is empty' do
      queue = MyQueue.new

      expect(queue.peek).to be nil
    end
  end

  describe 'push' do
    it 'adds element to the queue if the queue is not full' do
      queue = MyQueue.new

      expect { queue.push('foo') }.to change { queue.size }.by(1)
    end

    it 'returns true when element is added to the queue' do
      queue = MyQueue.new

      expect(queue.push('foo')).to be true
    end

    it 'does not add element to the queue if the queue is full' do
      queue = MyQueue.new(capacity: 2)
      queue.push 'foo'
      queue.push 'bar'

      expect { queue.push('baz') }.not_to change { queue.size }
    end

    it 'returns false if the queue is full' do
      queue = MyQueue.new(capacity: 2)
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.push('baz')).to be false
    end
  end

  describe '#pop' do
    it 'returns first element from the FIFO queue' do
      queue = MyQueue.new
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.peek).to eq('foo')
    end

    it 'returns last element from the FILO queue' do
      queue = MyQueue.new(type: 'filo')
      queue.push 'foo'
      queue.push 'bar'

      expect(queue.peek).to eq('bar')
    end

    it 'returns nil if the queue is empty' do
      queue = MyQueue.new

      expect(queue.pop).to be nil
    end

    it 'removes returned element from the queue' do
      queue = MyQueue.new
      queue.push 'foo'

      expect { queue.pop }.to change { queue.size }.by(-1)
    end
  end
end
