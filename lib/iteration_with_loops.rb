def find_min_in_nested_arrays(src)
  smallest_nested_nums = []

  src.each do | x |
    puts merge_sort(x)
    smallest_nested_nums << merge_sort(x)[0]
  end

  return smallest_nested_nums
end

def merge_sort(array)
  if array.length <= 1
    array
  else
    middle = (array.length / 2).floor
    left = merge_sort(array[0...middle])
    right = merge_sort(array[middle..array.length])

    merge(left, right)
  end
end

def merge(half1, half2)
  # p half1[0][0]
  if half1.empty?
    half2
  elsif half2.empty?
    half1
  elsif half1[0] < half2[0]
   [half1[0]] + merge(half1[1..half1.length], half2)
  else 
    # The reason I need to use 1..half2.length is because half2 is its own array, so we are adding the first element of half2 to the array we are returning to merge.
    [half2[0]] + merge(half1, half2[1..half2.length])
  end
end