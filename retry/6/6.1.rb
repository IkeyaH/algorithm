# 二分探索を利用して目的の値が存在するか調べる

def binary_search(arr, target)
  arr.sort!
  left = 0
  right = arr.length - 1

  while right >= left do
    mid = (left + right) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      left = mid + 1
    elsif arr[mid] > target
      right = mid - 1
    end
  end
  return -1
end

arr = [4,8,19,1,3,9,14,13,11,5,4,12]
target = 12
p arr.sort!
p binary_search(arr, target)
