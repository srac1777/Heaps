require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |i, j| i <=> j }
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)

  end

  public
  def self.child_indices(len, parent_index)
    child1_idx = 2*parent_index + 1
    child2_idx = 2*parent_index + 2
    
    if child1_idx >= len && child2_idx >= len
      return []
    elsif child1_idx >= len && child2_idx < len
      return [child2_idx]
    elsif child2_idx >= len && child1_idx < len
      return [child1_idx]
    else 
      return [child1_idx, child2_idx]
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index === 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |i, j| i <=> j }
    parent = array[parent_idx]
    children_indices = BinaryMinHeap.child_indices(len, parent_idx)
    
    if children_indices.length == 1
          child = array[children_indices[0]]
          if prc.call(parent, child) > -1 
            parent, child = child, parent
            return BinaryMinHeap.heapify_down(array, children_indices[0], array.length, &prc)
          else
            return array
          end
    elsif children_indices.length == 0
          return array
    elsif children_indices.length == 2
          child1 = array[children_indices[0]]
          child2 = array[children_indices[1]]
          if prc.call(child1, child2) > -1
            array[parent_idx], array[children_indices[1]] = array[children_indices[1]], array[parent_idx]
            return BinaryMinHeap.heapify_down(array, children_indices[1], array.length, &prc)
          else 
            array[parent_idx], array[children_indices[0]] = array[children_indices[0]], array[parent_idx]
            return BinaryMinHeap.heapify_down(array, children_indices[0], array.length, &prc)

          end
    end
  
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    
  end
end
