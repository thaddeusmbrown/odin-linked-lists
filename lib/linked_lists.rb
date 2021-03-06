# frozen_string_literal: false

# Description/Node unit within linked list, contains value and next node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Description/LinkedList contains head node that references next node in linked list
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
    @node_head = Node.new(value, @node_head)
  end

  # returns the total number of nodes in the list
  def size
    count = 0
    current_node = @node_head
    loop do
      count += 1
      return count if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  # returns the first node in the list
  def head
    @node_head
  end

  # returns the last node in the list
  def tail
    current_node = @node_head
    loop do
      # if the current node is the tail node, add a new node at the end
      return current_node if current_node.next_node.nil?

      # check if the next node is the tail node
      current_node = current_node.next_node
    end
  end

  # returns the node at the given index
  def at(index)
    current_node = @node_head
    (0..index).each do
      current_node = @node_head.next_node
    end
    current_node
  end

  # removes the last element from the list
  def pop
    # edge case for linked list of size 1
    if @node_head.next_node.nil?
      value = @node_head.value
      @node_head = nil
      return value
    end

    current_node = @node_head
    next_node = @node_head.next_node
    loop do
      if next_node.next_node.nil?
        value = next_node.value
        current_node.next_node = nil
        return value
      else
        current_node = next_node
        next_node = next_node.next_node
      end
    end
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    current_node = @node_head
    loop do
      return true if current_node.value == value

      return false if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  # returns the index of the node conaining value, or nil if not found
  def find(value)
    current_node = @node_head
    index = 0
    loop do
      return index if current_node.value == value

      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
      index += 1
    end
  end

  # represent your LinkedList objects as strings, so you can print them out and preview them in the console.
  # the format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    str = ''
    current_node = @node_head
    loop do
      if current_node.next_node.nil?
        str.concat("( #{current_node.value} ) -> nil")
        return str
      else
        str.concat("( #{current_node.value} ) -> ")
        current_node = current_node.next_node
      end
    end
  end

  # inserts a new node with the provided value at the given index
  def insert_at(value = nil, index)
    current_index = 0
    current_node = @node_head
    return 'Error: index out of range' if index >= size

    prepend(value) if index.zero?
    loop do
      current_index += 1
      previous_node = current_node
      current_node = current_node.next_node
      if current_index == index
        previous_node.next_node = Node.new(value, current_node)
        return
      end
    end
  end

  # removes the node at the given index
  def remove_at(index)
    current_index = 0
    current_node = @node_head
    if index.zero?
      @node_head = @node_head.next_node
    elsif index >= size
      'Error: index out of range'
    else
      loop do
        current_index += 1
        previous_node = current_node
        current_node = current_node.next_node
        next_node = current_node.next_node
        if current_index == index
          previous_node.next_node = next_node
          return
        end
      end
    end
  end
end
