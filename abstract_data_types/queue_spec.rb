require_relative "queue"

RSpec.describe Queue do
  let(:queue) { Queue.new }
  it "adds to the end" do
    queue.enqueue(5)
    queue.enqueue(6)

    expect(queue.data).to match_array([5, 6])
  end

  it "removes from the front" do
    queue.enqueue(5)
    queue.enqueue(6)

    actual = queue.dequeue

    expect(actual).to eq(5)
  end

  it "reads from the front" do
    queue.enqueue(5)
    queue.enqueue(6)

    actual = queue.read

    expect(actual).to eq(5)
  end
end
