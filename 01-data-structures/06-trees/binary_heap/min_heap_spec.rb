include RSpec

require_relative "min_heap"

RSpec.describe MinHeap, type: Class do
  heap = MinHeap.new
  matrix = Node.new("The Matrix", 87)
  odyssey = Node.new("2001: A Space Odyssey", 94)
  inception = Node.new("Inception", 86)
  vendetta = Node.new("V for Vendetta", 73)
  gladiator = Node.new("Gladiator", 76)
  alien = Node.new("Alien", 96)

  describe "#insert data" do
    it "properly inserts a new node" do
      heap.insert(matrix)
      heap.insert(odyssey)
      expect(matrix.left.title).to eq "2001: A Space Odyssey"
    end

    it "properly adjusts heap based on min heap property" do
      heap.insert(vendetta)
      expect(vendetta.left.title).to eq "The Matrix"
    end
  end

  describe "#delete data" do
    it "properly deletes the first node in the heap" do
      heap.delete
      expect(matrix.left.title).to eq "2001: A Space Odyssey"
    end
  end

  describe "#print data" do
      specify {
        expected_output = "V for Vendetta: 73\nThe Matrix: 87\n2001: A Space Odyssey: 94\n"
        heap.insert(vendetta)
        expect { heap.print }.to output(expected_output).to_stdout
      }
  end

  describe "#find data" do
    it "successfully retrieves top element in heap" do
      expect(heap.find.title).to eq "V for Vendetta"
    end

  end

end
