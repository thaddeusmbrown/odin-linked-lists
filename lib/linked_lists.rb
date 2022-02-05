require 'pry-byebug'

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :node_head

  def initialize(value = nil)
    @node_head = Node.new(value)
  end

  # adds a new node containing 'value' to the end of the list
  def append(value = nil)
    current_node = @node_head
    loop do
      # if the current node is the tail node, add a new node at the end
      if current_node.next_node.nil?
        current_node.next_node = Node.new(value)
        return
      else # check if the next node is the tail node
        current_node = current_node.next_node
      end
    end
  end

  # adds a new node containing 'value' to the start of the list
  def prepend(value = nil)

  end

  # returns the total number of nodes in the list
  def size

  end

  # returns the first node in the list
  def head

  end

  # returns the last node in the list
  def tail

  end

  # returns the node at the given index
  def at(index)

  end

  # removes the last element from the list
  def pop

  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)

  end

  # returns the index of the node conaining value, or nil if not found
  def find(value)

  end

  # represent your LinkedList objects as strings, so you can print them out and preview them in the console.
  # the format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s

  end

  # inserts a new node with the provided value at the given index
  def insert_at(value = nil, index)

  end

  # removes the node at the given index
  def remove_at(index)

  end
end
