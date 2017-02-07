require 'benchmark'
require_relative 'fibonnaci_iterative'
require_relative 'fibonnaci_recursive'

n = 1000

Benchmark.bm do |x| 
  x.report "Iterative" do
    fibIterative(n)
  end
  x.report "Recursive" do
    fibRecursive(n)
  end
end
