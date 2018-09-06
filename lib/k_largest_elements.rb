require_relative 'heap'

def k_largest_elements(array, k)
    prc = Proc.new {|i,j| -1*(i <=> j)}
    heap = BinaryMinHeap.new(&prc)
    array.each do |el|
        heap.push(el)
    end
    result = []
    i = 0
    while i < k
        result << heap.extract
        i += 1
    end
    result
end
