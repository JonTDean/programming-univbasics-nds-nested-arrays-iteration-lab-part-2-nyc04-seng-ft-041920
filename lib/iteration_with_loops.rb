def find_min_in_nested_arrays(src)
  # src will be an array of arrays of integers
  # Produce a new Array that contains the smallest number of each of the nested arrays
  merge(src)
end

def merge(array_matrix)
  if array_matrix.length <= 1
    merge(array_matrix)
  else
    middle = (array_matrix.length / 2) - 1
    left = array_matrix[0...middle]
    right = array_matrix[middle..array_matrix.length]

    # puts left
    # puts right
    # p left, right
    merge_sort(left, right)
  end
end

def merge_sort(half1, half2)
  if half1.empty?
    half2
  elsif half.empty?
    half1
  elsif half1.first < half2.first
   [half1.first] + merge(half1[1..half1], half2)
  else 
    # The reason I need to use 1..half2.length is because half2 is its own array, so we are adding the first element of half2 to the array we are returning to merge.
    [half.first] + merge(half1, half2[1..half2.length])
end
end