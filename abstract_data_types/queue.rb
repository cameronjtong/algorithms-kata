class Queue
  attr_reader :data

  def initialize
    @data = []
  end

  def enqueue(value)
    data << value
  end

  def dequeue
    data.shift
  end

  def read
    data.first
  end
end
