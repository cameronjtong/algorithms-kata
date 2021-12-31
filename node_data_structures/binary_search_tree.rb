class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def search(value, node)
  if !node || node.val == value
    node
  elsif value > node.val
    search(value, node.right)
  else
    search(value, node.left)
  end
end

def insert(value, node)
  if value < node.val
    if node.left
      insert(value, node.left)
    else
      node.left = TreeNode.new(value)
    end
  elsif value > node.val
    if node.right
      insert(value, node.right)
    else
      node.right = TreeNode.new(value)
    end
  end
end

def delete(value, node)
  if node.nil?
    nil
  elsif value < node.val
    node.left = delete(value, node.left)
    node
  elsif node.val < value
    node.right = delete(value, node.right)
    node
  elsif value == node.val
    if !node.left
      node.right
    elsif !node.right
      node.left
    else
      node.right = lift(node.right, node)
      node
    end
  end
end

def lift(node, node_to_delete)
  if node.left
    node.left = lift(node.left, node_to_delete)
    node
  else
    node_to_delete.val = node.val
    node.right
  end
end
