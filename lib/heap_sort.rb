require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new {|i,j| -1 * (i <=> j)}
    boundary = 0

    while boundary < self.length
      boundary += 1
      BinaryMinHeap.heapify_up(self, boundary-1, boundary, &prc )
    end
    boundary -= 1
    while boundary > -1

      self[0], self[boundary] = self[boundary], self[0]
    
      BinaryMinHeap.heapify_down(self, 0, boundary, &prc)
      boundary -= 1
    end




    # p self
  end
end
