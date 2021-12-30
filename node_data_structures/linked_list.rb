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

  def unshift(value)
    new_node = Node.new(value)
    new_node.next = head
    @head = new_node
  end

  def insert_at_index(index, value)
    new_node = Node.new(value)
    current_node = head
    current_index = 0

    return unshift(value) if index == 0

    until current_index == index - 1
      current_index += 1
      current_node = current_node.next
    end

    temp = current_node.next
    current_node.next = new_node
    new_node.next = temp
    new_node
  end

  def read(index)
    current_index = 0
    current_node = head

    until current_index == index
      current_index += 1
      current_node = current_node.next
      return nil unless current_node
    end

    current_node.data
  end

  def index_of(value)
    current_index = 0
    current_node = head

    while current_node.data != value
      current_node = current_node.next
      current_index += 1
      return nil unless current_node
    end

    current_index
  end

  def delete_at_index(index)
    current_node = head
    current_index = 0

    if index == 0
      @head = @head.next
      return
    end

    until current_index == index - 1
      current_node = current_node.next
      current_index += 1
      return nil unless current_node
    end
    current_node.next = current_node.next.next
  end
end
