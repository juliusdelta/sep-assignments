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
      elsif root.left != nil
        root = root.left
        self.insert(root, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root == nil
      return nil
    end

    branch = root

    if branch.title == data
      return branch
    else
      root = find_next_leaf(root, branch)
      self.find(root, data)
    end

  end

  def delete(root, data)
    if root == nil || data == nil
      return nil
    end

    leaf = find(root, data)
    leaf.title = nil
    leaf.rating = nil

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    result = ""

    until queue.empty?
      temp_root = queue.shift

      unless temp_root.left == nil
        queue << temp_root.left
      end
      unless temp_root.right == nil
        queue << temp_root.right
      end

      result << "#{temp_root.title}: #{temp_root.rating}\n"
    end

    puts result
  end
    

  def find_next_leaf(root, branch)
    if branch.right != nil
      return branch.right
    elsif branch.right == nil
      return root.left
    elsif root.left == nil
      return nil
    end
  end

end
