require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
      if root.right == nil
        root.right = node
      elsif root.right != nil
        root = root.right
        self.insert(root, node)
      end

    elsif root.rating > node.rating
      if root.left == nil
        root.left = node
        return
      elsif root.left != nil
        root = root.left
        self.insert(root, node)
        return
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
