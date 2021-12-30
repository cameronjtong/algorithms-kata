require_relative "stacks"

RSpec.describe Stack do
  let(:stack) { Stack.new }
  it "pushes to the end" do
    stack.push(5)
    stack.push(6)

    expect(stack.data).to match_array([5, 6])
  end

  it "reads from the end" do
    stack.push(5)
    stack.push(6)

    actual = stack.read

    expect(actual).to eq(6)
  end

  it "pops from the end" do
    stack.push(5)
    stack.push(6)

    actual = stack.pop

    expect(actual).to eq(6)
    expect(stack.read).to eq(5)
  end
end
