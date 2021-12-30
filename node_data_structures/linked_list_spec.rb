require_relative "linked_list"

RSpec.describe Node do
  context "#initialize" do
    let(:node) { Node.new(nil) }
    it "creates the correct attributes" do
      expect(node).to have_attributes(data: nil, next: nil)
    end

    it "has mutable attributes" do
      node.data = 2
      next_node = Node.new(3)
      node.next = next_node

      expect(node).to have_attributes(data: 2, next: next_node)
    end
  end
end

RSpec.describe LinkedList do
  context "#initialize" do
    it "takes a node element as the head" do
      head_node = Node.new(nil)
      actual = LinkedList.new(head_node)

      expect(actual.head).to eq(head_node)
    end

    it "can unshift to list by reassigning head" do
      head_node = Node.new(1)
      list = LinkedList.new(head_node)

      list.unshift(3)

      expect(list.head.data).to be(3)
      expect(list.head.next.data).to be(1)
    end
  end
  context "#read" do
    it "reads to a given index" do
      node = Node.new(1)
      list = LinkedList.new(node)
      list.unshift(4)
      list.unshift(5)

      actual = list.read(2)

      expect(actual).to eq(1)
    end

    it "returns nil if index does not exist" do
      node = Node.new(1)
      list = LinkedList.new(node)
      list.unshift(2)
      list.unshift(3)

      actual = list.read(4)

      expect(actual).to be nil
    end
  end

  context "#index_of" do
    it "returns the index if the search value" do
      node = Node.new(7)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      actual = list.index_of(8)

      expect(actual).to eq(1)
    end

    it "returns nil if the value is not found" do
      node = Node.new(7)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      actual = list.index_of(10)

      expect(actual).to be nil
    end
  end

  context "#insert_at_index" do
    it "inserts at any given index" do
      node = Node.new(6)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      list.insert_at_index(2, 7)

      expect(list.read(2)).to eq(7)
    end

    it "can reassign the head" do
      node = Node.new(6)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      list.insert_at_index(0, 7)

      expect(list.head.data).to eq(7)
    end
  end

  context "#delte_at_index" do
    it "deletes in the middle of the list" do
      node = Node.new(6)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      list.delete_at_index(1)

      expect(list.read(1)).to eq(6)
    end
    it "deletes the head" do
      node = Node.new(6)
      list = LinkedList.new(node)
      list.unshift(8)
      list.unshift(9)

      list.delete_at_index(0)

      expect(list.head.data).to eq(8)
    end
  end
end
