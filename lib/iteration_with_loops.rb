def find_min_in_nested_arrays(src)
  # src will be an array of arrays of integers
  # Produce a new Array that contains the smallest number of each of the nested arrays
  merge(src)
end

def merge_sort(array)
  if array.length <= 1
    merge_sort(array)
  else
    middle = (array.length / 2) - 1
    left = array[0...middle]
    right = array[middle..array.length]

    # puts left
    # puts right
    # p left, right
    merge(left, right)
  end
end

def merge(half1, half2)
  if half1.empty?
    half2
  elsif half2.empty?
    half1
  elsif half1.first < half2.first
   [half1.first] + merge(half1[1..half1.length], half2)
  else 
    # The reason I need to use 1..half2.length is because half2 is its own array, so we are adding the first element of half2 to the array we are returning to merge.
    [half2.first] + merge(half1, half2[1..half2.length])
  end
end