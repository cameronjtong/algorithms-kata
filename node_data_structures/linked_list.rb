class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def add(value)
    new_node = Node.new(value)
    new_node.next = head
    @head = new_node
  end

  def read(index)
  end
end
