require "rspec"
require_relative "search"

RSpec.describe("search algorithms") do
  let(:array) { [1, 2, 3, 4, 5] }
  context "linear search of an ordered array" do
    it "returns the search value index" do
      result = linear_search(array, 3)
      expect(result).to eq(2)
    end

    it "returns nil if search value not present" do
      result = linear_search(array, 0)
      expect(result).to be_nil
    end
  end

  context "binary search" do
    it "returns the search value index" do
      result = binary_search(array, 3)
      expect(result).to eq(2)
    end

    it "returns nil if search value not present" do
      result = binary_search(array, 100)
      expect(result).to be_nil
    end
  end
end
