def quicksort(array, first=0, last=nil)
  if last == nil
    last = array.length - 1
  end

  if array.length > 1
    return if first > last

    pivot = array[(first + last) * 0.5]
    left_index = first
    right_index = last

    while left_index <= right_index
      while(array[left_index] < pivot) do
        left_index += 1
      end
      while(array[right_index] > pivot) do
        right_index -= 1
      end

      if left_index <= right_index
        tmp = array[left_index]
        array[left_index] = array[right_index]
        array[right_index] = tmp

        left_index += 1
        right_index -= 1
      end
    end

    quicksort(array, first, right_index)
    quicksort(array, left_index, last)
  end

  return array

end
