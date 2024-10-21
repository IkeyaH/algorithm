numbers = [4,5,14,6,8,10,15,21,9,68]
numbers.sort!

def binary_search(arr, target)
  left = 0
  right = (arr.length - 1)
  while right >= left do
    mid = right - (right - left) / 2
    return arr.index(arr[mid]) if arr[mid] == target
    if target < arr[mid]
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return - 1
end

puts binary_search(numbers, 68)
