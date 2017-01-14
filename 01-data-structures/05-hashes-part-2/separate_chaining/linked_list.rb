require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
      if @head.nil?
          @head = node
          @tail = node
          return @tail
      end

      find_specific_node(@tail)

      @current_node.next = node
      @tail = node

      return @tail

  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @tail = nil
      @head = nil
      return nil
    end

    @tail.next = nil
    return
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    until current_node.next.nil?
      puts current_node.data
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front
      return
    end

    if node == @tail
      remove_tail
      return
    end

    find_specific_node(node)
    @current_node.next = node.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = node
      return @tail
    end

    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    removed_head = @head

    if @head.next == nil
      @head = nil
      @tail = nil
      removed_head
    else
      new_head = @head.next
      @head.next = nil
      @head = new_head
      removed_head
    end
  end

  def find_specific_node(target)
    @current_node = @head
    until @current_node == target
      @current_node = @current_node.next
    end
  end
end
