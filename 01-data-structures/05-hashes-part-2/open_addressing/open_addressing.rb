require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    puts "Creating Array of #{size} size"
  end

  def []=(key, value)
    i = index(key, @items.size)
    node = Node.new(key, value)

    if @items[i] == nil
      puts "Putting #{node} into #{i} index of the array..."
      @items[i] = node
      @item_count += 1
    else
      puts "#{i} was taken... Looking for next spot."
      open_spot = next_open_index(i)
      puts "Found a spot at #{open_spot}"

      if open_spot == -1
        puts "Resizing the Array"
        self.resize
        self[key] = value
        return
      else
        puts "Found an open index at #{open_spot}"
        @items[open_spot] = node
        @item_count += 1
      end
    end
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
    counter = index

    while @items[counter] != nil
      if counter == @items.size - 1
        return -1
      else
        counter += 1
      end
    end
    return counter
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
