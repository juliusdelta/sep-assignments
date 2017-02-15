require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

array = Array.new(1000000)
array.each_index do |i|
  array[i] = rand(0..1000000)
end

Benchmark.bmbm do |x|
  x.report("Bucket Sort") { bucketsort(array, 5) }
  x.report("Heap Sort") { array.heapsort! }
  x.report("Quick Sort") { quicksort(array) }
end

# Tests with 100,000 item array of integers
# Rehearsal -----------------------------------------------
# Bucket Sort   0.070000   0.000000   0.070000 (  0.072352)
# Heap Sort     0.410000   0.010000   0.420000 (  0.418163)
# Quick Sort    0.100000   0.000000   0.100000 (  0.101574)
# -------------------------------------- total: 0.590000sec

# user     system      total        real
# Bucket Sort   0.070000   0.000000   0.070000 (  0.076788)
# Heap Sort     0.410000   0.000000   0.410000 (  0.408499)
# Quick Sort    0.100000   0.000000   0.100000 (  0.105055)

########

# Tests with 1,000,000 item array of integers
# Rehearsal -----------------------------------------------
#           Bucket Sort   0.790000   0.030000   0.820000 (  0.809364)
# Heap Sort     5.090000   0.000000   5.090000 (  5.095135)
# Quick Sort    1.090000   0.000000   1.090000 (  1.089618)
# -------------------------------------- total: 7.000000sec

# user     system      total        real
# Bucket Sort   0.660000   0.010000   0.670000 (  0.679762)
# Heap Sort     5.020000   0.010000   5.030000 (  5.029771)
# Quick Sort    1.090000   0.000000   1.090000 (  1.085789)
