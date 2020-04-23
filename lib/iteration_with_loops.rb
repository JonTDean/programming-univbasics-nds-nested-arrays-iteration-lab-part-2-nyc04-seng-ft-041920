def find_min_in_nested_arrays(src)
  array = merge_sort(src)
  smallest_nested_nums = []

  array.each do | x |
    smallest_nested_nums << x[0]
  end

  return smallest_nested_nums
end

def merge_sort(array)
 sorted = []
  
  array.each do | i |
    if i.length <= 1
      merge_sort(i)
    else
      if i.length == 2 # If array length is equal to 2 it removes the second element
        middle = (i.length / 2)
      else 
        middle = (i.length / 2) - 1 # Handles cases bigger than 
      end
      left = i[0...middle]
      right = i[middle..i.length]

      # puts left
      # puts right
      # p left, right
      sorted << merge(left, right)
    end
  end
  return sorted
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