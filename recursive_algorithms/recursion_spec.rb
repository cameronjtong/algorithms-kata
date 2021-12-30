require_relative "recursion"

RSpec.describe SortableArray do
  context "#partition" do
    it "returns an array with the pivot (rightmost value) correctly positioned" do
      array = [2, 1, 9, 5, 1, 2, 5, 3]

      actual = SortableArray.new(array).partition!(0, array.length - 1)

      expect(actual).to eq(4)
      expect(array).to match_array([2, 1, 2, 1, 3, 9, 5, 5])
    end
  end

  context "#quicksort" do
    it "returns a sorted array" do
      array = (1..100).to_a.shuffle
      temp = array

      SortableArray.new(array).quicksort!(0, array.length - 1)

      expect(array).to match_array(temp.sort)
    end
  end
end
