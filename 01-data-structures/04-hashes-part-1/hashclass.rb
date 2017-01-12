require_relative "hash_item"

class HashClass

  def initialize(size)
      @items = Array.new(size)
  end

  def []=(key, value)
      hash_array_index = index(key, @items.size)


      if @items[hash_array_index] == nil # if the spot is empty, create it and inject it
          puts "Creating new stuff..."
          new_item = HashItem.new(key, value)
          @items[hash_array_index] = new_item
      elsif @items[hash_array_index].value == value # if the value exists in the hash, just return it
          puts "Item already exists!"
          return value
      elsif @items[hash_array_index].key == key # if the key exists double the array size
         self.resize
      elsif @items[hash_array_index] != value
          puts "Index exists already! Resizing"
          self.resize
          self[key] = value
      end
      
  end


  def [](key)
      hash_index = index(key, @items.size)
      unless @items[hash_index] == nil
          return @items[hash_index].value
      end
  end

  def resize
      saved_items = []
      second_array = Array.new(@items.size)

      @items.each do |item|
          unless item == nil
              saved_items << item
          end
      end

      @items.map! do |hashed_item|
          unless hashed_item == nil
              hashed_item = nil
          end
      end

      @items.concat(second_array)

      saved_items.each do |item|
          self[item.key] = item.value
      end

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
      ascii_value = 0
      hash_key = 0

      key.split("").each do |letter|
          ascii_value += letter.ord #Method to retrieve ascii
      end

      hash_key = ascii_value % size

      return hash_key
  end

  # Simple method to return the number of items in the hash
  def size
      return @items.size
  end

end
