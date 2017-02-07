def recursive_binary_search(collection, value, low=0, high=nil)

  if high == nil
    high = collection.length - 1
  end

  mid = (low + high) / 2

  if collection[mid] == value
    return mid
  elsif collection[mid] < value
    recursive_binary_search(collection, value, (mid + 1), high)
  else
    recursive_binary_search(collection, value, low, (mid - 1))
  end

end
