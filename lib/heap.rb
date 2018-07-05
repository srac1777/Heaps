require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |i, j| i <=> j }
  end

  def count
    store.length
  end

  def extract

  end

  def peek
    store[0]
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    child1 = 2 * parent_index + 1
    child2 = 2 * parent_index + 2

    return [child1] if child2 >= len
    [child1, child2]
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
