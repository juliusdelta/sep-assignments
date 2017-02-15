def bucketsort(array, bucket_size)
  if array.empty?
    return
  end

  max_value = array.max
  min_value = array.min

  bucket_amount = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_amount)
  buckets.each_index do |i|
    buckets[i] = []
  end

  array.each_index do |i|
    buckets[((array[i] - min_value) / bucket_size).floor] << array[i]
  end

  array.clear
  buckets.each_index do |i| 
    if !buckets[i].empty?
      buckets[i] = insertion_sort(buckets[i])
      buckets[i].each do |value|
        array << value
      end
    end
  end
  array
end

def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end

