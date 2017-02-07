require_relative "node"

class MinHeap
  attr_accessor :heap

  def initialize
    @heap = Array.new()
  end

  def insert(node)
    @heap << node
    node_index = @heap.size - 1
    unless @heap[0] == @heap[node_index]
      bubble_up(node_index)
    end
    set_left_right
  end

  def delete
    @heap.shift
    set_left_right
  end

  def find
    return @heap[0]
  end

  def print
    queue = [@heap[0]]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift
      temp_root_index = @heap.find_index(temp_root)
      left_node = 2 * temp_root_index + 1
      right_node = 2 * temp_root_index + 2
      unless @heap[left_node] == nil
        queue << @heap[left_node]
      end
      unless @heap[right_node] == nil
        queue << @heap[right_node]
      end
      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end
    puts returned_string
  end


  def bubble_up(index)
    parent_index = get_parent(index)

      if @heap[index].rating > @heap[parent_index].rating
        return
      elsif @heap[index].rating < @heap[parent_index].rating
        temp = @heap[parent_index]
        @heap[parent_index] = @heap[index]
        @heap[index] = temp
        self.bubble_up(parent_index)
      end
  end

  def set_left_right
    @heap.each_with_index do |x, index| 
      left_child = get_left_child(index)
      right_child = get_right_child(index)
      unless @heap[left_child] == nil
        @heap[index].left = @heap[left_child]
      end

      unless @heap[right_child] == nil
        @heap[index].right = @heap[left_child]
      end

    end
  end

  def get_parent(index)
    return (index / 2).floor
  end

  def get_left_child(index)
    return ((index * 2) + 1).floor
  end

  def get_right_child(index)
    return ((index * 2) + 2).floor
  end
end
 
