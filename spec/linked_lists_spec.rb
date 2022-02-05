# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/linked_lists'

RSpec.describe 'LinkedLists' do
  describe Node do
    before do
      @node = Node.new
    end
    describe '#value' do
      context 'when no value defined' do
        it 'has nil value' do
          expect(@node.value).to eq nil
        end
      end
    end
    describe '#next_value' do
      context 'when no next_node defined' do
        it 'has nil next_value' do
          expect(@node.next_node).to eq nil
        end
      end
    end
  end

  describe LinkedList do
    before do
      @linked_list = LinkedList.new
      @linked_list.append(1)
      @linked_list.append(2)
    end
    describe '#append(value)' do
      it "adds a node with value 'append test' to end of linked list" do
        @linked_list.append('append test')
        expect(@linked_list.node_head.next_node.next_node.next_node.value).to eq 'append test'
      end
    end

    describe '#prepend(value)' do
      it "adds a node with value 'prepend test' to the beginning of linked list" do
        @linked_list.prepend('prepend test')
        expect(@linked_list.node_head.value).to eq 'prepend test'
      end
    end

    describe '#size' do
      it 'returns size of linked list (number of nodes)' do
        expect(@linked_list.size).to eq 3
      end
    end

    describe '#head' do
      it 'returns the first node in the list' do
        expect(@linked_list.head).to eq @linked_list.node_head
      end
    end

    describe '#tail' do
      it 'returns the last node in the list' do
        @linked_list.append('tail test')
        expect(@linked_list.tail.value).to eq 'tail test'
      end
    end

    describe '#at(index)' do
      it 'returns the node at the given index' do
        expect(@linked_list.at(1).value).to eq 1
      end
    end

    describe '#pop' do
      context 'removes the last node from the list and returns value of that node' do
        before do
          @result = @linked_list.pop
        end
        it 'method returns value of popped node' do
          expect(@result).to eq 2
        end
        it 'popped node is removed from linked list' do
          expect(@linked_list.tail.value).to eq 1
        end
      end
    end

    describe '#contains?(value)' do
      it 'returns true when value is in linked list' do
        expect(@linked_list.contains?(1)).to eq true
      end
      it 'returns false when value is not in linked list' do
        expect(@linked_list.contains?('foo')).to eq false
      end
    end

    describe '#find(value)' do
      it 'returns the index of the node with the searched value' do
        expect(@linked_list.find(1)).to eq 1
      end
      it 'returns nil when value not in linked_list' do
        expect(@linked_list.find('foo')).to eq nil
      end
    end

    describe '#to_s' do
      it 'returns a string representation of linked list' do
        result = '(  ) -> ( 1 ) -> ( 2 ) -> nil'
        expect(@linked_list.to_s).to eq result
      end
    end

    describe '#insert_at(value, index)' do
      context 'inserts a new node at the given index' do
        before do
          @linked_list.insert_at('insert test', 1)
        end
        # @linked_list.insert_at('insert test', 1)
        it 'node is inserted at correct position' do
          expect(@linked_list.find('insert test')).to eq 1
        end
        it 'linked list is correct size after insertion' do
          expect(@linked_list.size).to eq 4
        end
      end
      it 'returns an error when index is outside of range' do
        expect(@linked_list.insert_at('insert test', @linked_list.size)).to eq 'Error: index out of range'
      end
    end

    describe '#remove_at(index)' do
      context 'removes a node at the given index' do
        before do
          @linked_list.remove_at(1)
        end
        it 'correct node is removed' do
          expect(@linked_list.find(2)).to eq 1
        end
        it 'linked list is correct size after removal' do
          expect(@linked_list.size).to eq 2
        end
      end
    end
  end
end
