require_relative "sort"

RSpec.describe "sorting algorithms" do
  let(:unsorted_array) { (1..100).to_a.shuffle }
  context "bubble sort" do
    it "returns a sorted list" do
      result = bubble_sort(unsorted_array)
      expect(result).to match_array(unsorted_array.sort)
    end
  end
  context "selection sort" do
    it "returns a sorted list" do
      result = selection_sort(unsorted_array)
      expect(result).to match_array(unsorted_array.sort)
    end
  end
  context "insertion sort" do
    it "returns a sorted list" do
      result = insertion_sort(unsorted_array)
      expect(result).to match_array(unsorted_array.sort)
    end
  end
end
