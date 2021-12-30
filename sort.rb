def bubble_sort(array)
  last_unsorted_index = array.length - 1
  sorted = false

  until sorted
    sorted = true
    (0...last_unsorted_index).each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
    last_unsorted_index -= 1
  end
  array
end

def selection_sort(array)
  (0...array.length).each do |i|
    lowest_number_index = i
    (1...array.length).each do |j|
      lowest_number_index = j if array[j] < array[i]
    end
    array[i], array[lowest_number_index] = array[lowest_number_index], array[i] if lowest_number_index != i
  end
  array
end

def insertion_sort(array)
  (1...array.length).each do |i|
    temp_value = array[i]
    position = i - 1

    while position >= 0
      if array[position] > temp_value
        array[position + 1] = array[position]
        position -= 1
      else
        break
      end
    end
    array[position + 1] = temp_value
  end
  array
end
