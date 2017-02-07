require 'benchmark'
require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'

collection = (1..1000000).to_a
value = 253405

Benchmark.bm(7) do |x| 
  x.report("Iterative: ") do
    iterative_binary_search(collection, value)
  end
  x.report("Recursive: ") do
    recursive_binary_search(collection, value)
  end
end
