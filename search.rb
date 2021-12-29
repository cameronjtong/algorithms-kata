def linear_search(array, search_value)
  array.each_with_index do |element, index|
    return index if element == search_value
    return if element > search_value
  end
end

def binary_search(array, search_value)
  lower_bound = 0
  upper_bound = array.length - 1
  while upper_bound >= lower_bound
    midpoint = upper_bound + lower_bound / 2
    if array[midpoint] == search_value
      return midpoint
    elsif array[midpoint] > search_value
      upper_bound = midpoint - 1
    else
      lower_bound = midpoint + 1
    end
  end
end
