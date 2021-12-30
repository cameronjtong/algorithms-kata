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
  it "takes a node element as the head" do
    head_node = Node.new(nil)
    actual = LinkedList.new(head_node)

    expect(actual.head).to eq(head_node)
  end

  it "can add to list by reassigning head" do
    head_node = Node.new(1)
    list = LinkedList.new(head_node)

    list.add(3)

    expect(list.head.data).to be(3)
    expect(list.head.next.data).to be(1)
  end

  xit "reads to a given index" do
    list = LinkedList.new(node)
    list.add(4)
    list.add(5)

    actual = list.read(2)

    expect(actual).to eq(5)
  end
end
