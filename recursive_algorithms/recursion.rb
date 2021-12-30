class SortableArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def quicksort!(left_index, right_index)
    return if right_index - left_index <= 0

    pivot_index = partition!(left_index, right_index)

    quicksort!(left_index, pivot_index - 1)
    quicksort!(pivot_index + 1, right_index)
  end

  def partition!(left_pointer, right_pointer)
    pivot_index = right_pointer

    pivot = array[pivot_index]

    right_pointer -= 1

    while true

      left_pointer += 1 while array[left_pointer] < pivot

      right_pointer -= 1 while array[right_pointer] > pivot

      if left_pointer >= right_pointer
        break
      else
        array[left_pointer], array[right_pointer] = array[right_pointer], array[left_pointer]
        left_pointer += 1
      end
    end
    array[left_pointer], array[pivot_index] = array[pivot_index], array[left_pointer]
    left_pointer
  end
end
