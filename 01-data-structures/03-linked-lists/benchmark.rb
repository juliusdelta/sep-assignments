require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

array = Array.new
linked_list = LinkedList.new

n = 10_000

Benchmark.bmbm do |x|
  x.report("Array: ") { for i in (1..n); array << i.to_s; end }
  x.report("Linked List: ") { for i in (1..n); linked_list.add_to_tail(Node.new(i)); end }
  x.report("5000 Array Elements: ") { array[4999] }
  x.report("5000 Linked List Elements ") { linked_list.return_single(5000) }
  x.report("Remove Last Element in Array ") { array.delete_at(4999) }
  # having trouble getting this final benchmark to work
  # x.report("Remove Last Element in Linked List ") { linked_list.delete(4999) }
end
