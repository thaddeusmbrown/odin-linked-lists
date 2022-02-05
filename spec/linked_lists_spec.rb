require 'spec_helper'
require_relative '../lib/linked_lists.rb'

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
    let(:linked_list) { LinkedList.new }
    describe '#append(value)' do

    end

    describe '#prepend(value)' do

    end

    describe '#size' do

    end

    describe '#head' do

    end

    describe '#tail' do

    end

    describe '#at(index)' do

    end

    describe '#pop' do

    end

    describe '#contains?(value)' do

    end

    describe '#find(value)' do

    end

    describe '#to_s' do

    end

    describe '#insert_at(value, index)' do

    end

    describe '#remove_at(index)' do

    end
  end
end