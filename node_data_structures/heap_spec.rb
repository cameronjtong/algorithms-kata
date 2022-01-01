require_relative "heap"

RSpec.describe Heap do
  let(:heap) { Heap.new }
  it "inserts into the heap maintaining heap condition" do
    heap_values = (1..10).to_a.shuffle.each { |n| heap.insert(n) }

    actual = heap.root_node

    expect(actual).to eq(10)
  end

  it "deletes the root node maintaining heap condition" do
    heap_values = (1..10).to_a.shuffle.each { |n| heap.insert(n) }

    heap.delete

    expect(heap.root_node).to eq(9)
  end
end
