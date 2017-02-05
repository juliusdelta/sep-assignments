require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    puts "Creating Array of #{size} size"
  end

  def []=(key, value)
    open_index = index(key, size)
    final_index = next_open_index(open_index)

      while final_index == -1
        self.resize
        final_index = next_open_index(open_index)
        return
      end

      @items[final_index] = Node.new(key, value)
  end

    def [](key)
      @items.each { |x|
        if x != nil && x.key === key
          return x.value
        end
      }
      return nil
  end

  def [](key)
    i = index(key, @items.size)
    counter = 0

    if @items[i] == nil
      return nil
    elsif @items[i].key == key
      return @items[i].value
    else
      if i == @items.size - 1
        counter = 0
      else
        counter = i + 1
      end

      while counter != i
        if @items[counter] == nil
          return nil
        elsif @items[counter].key == key
          return @items[counter].value
        else
          if counter == @items.size - 1
            counter = 0
          else
            counter += 1
          end
        end
      end
    end

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

    key.split("").each do |char|
      if char.ord == 0
        next
      end

      sum = sum + char.ord
    end

    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    for x in index...size
      if @items[x] == nil
        return x
      end
    end

    for y in 0...index
      if @items[y] === nil
        return y
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_array = Array.new(size * 2)
    saved_items = []

    @items.each do |item|
      unless item == nil
        saved_items << item
      end
    end
    # new, doubled, and all-nil array
    @items = new_array

    saved_items.each do |item|
      self[item.key] = item.value
    end
  end
end
