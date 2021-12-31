require_relative "binary_search_tree"

RSpec.describe TreeNode do
  context "#initialize" do
    let(:node) { TreeNode.new(1) }
    it "creates the correct attributes" do
      expect(node).to have_attributes(val: 1, left: nil, right: nil)
    end

    it "has mutable attributes" do
      left_node = TreeNode.new(3)
      right_node = TreeNode.new(4)

      node.val = 2
      node.left = left_node
      node.right = right_node

      expect(node).to have_attributes(val: 2, left: left_node, right: right_node)
    end
  end
end

RSpec.describe "binary search" do
  it "returns the desired node " do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node

    actual = search(2, root_node)

    expect(actual).to eq(left_node)
  end

  it "returns nil if value not present" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node

    actual = search(3, root_node)

    expect(actual).to be nil
  end

  it "inserts a new value as a left child" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node
    value = 1

    insert(value, root_node)

    expect(left_node.left.val).to be(1)
  end

  it "inserts a new value as a right child" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node
    value = 20

    insert(value, root_node)

    expect(right_node.right.val).to be(20)
  end

  it "deletes a node with no children" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node

    delete(2, root_node)

    expect(root_node.left).to be nil
  end

  it "deletes a node with one child" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    left_node_child = TreeNode.new(1)
    root_node.right = right_node
    root_node.left = left_node
    left_node.left = left_node_child

    actual = delete(2, root_node)

    expect(root_node.left.val).to eq(1)
  end

  it "deletes a node with two children" do
    root_node = TreeNode.new(10)
    left_node = TreeNode.new(2)
    right_node = TreeNode.new(15)
    root_node.right = right_node
    root_node.left = left_node

    delete(10, root_node)

    expect(root_node.val).to be(15)
  end
end
