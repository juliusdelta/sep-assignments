def poorly_written_ruby(*arrays)
  arrays = arrays.flatten

  # HeapSort, worst case O(n log n)

  (1..arrays.length - 1).each do |i|
    child = i
    while child > 0
      parent = (child - 1) / 2
      if arrays[parent] < arrays[child]
        arrays[parent], arrays[child] = arrays[child], arrays[parent]
        child = parent
      else
        break
      end
    end
  end

  i = arrays.length - 1

  while i > 0
    arrays[0], arrays[i] = arrays[i], arrays[0]
    i -= 1
    parent = 0
    while parent * 2 + 1 <= i
      child = parent * 2 + 1
      if child < i && arrays[child] < arrays[child + 1]
        child += 1
      end
      if arrays[parent] < arrays[child]
        arrays[parent], arrays[child] = arrays[child], arrays[parent]
        parent = child
      else
        break
      end
    end
  end
  return arrays
end
