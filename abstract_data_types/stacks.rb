class Stack
  attr_reader :data

  def initialize
    @data = []
  end

  def push(value)
    data << value
  end

  def read
    data.last
  end

  def pop
    data.pop
  end
end
