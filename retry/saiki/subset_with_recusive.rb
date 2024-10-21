
# 部分和問題（配列の数字からいくつか選んだ和で希望の数字を作れるか？）
# 思い出してきた。もしその数字を利用するならその数をtargetから引いて渡す
# でなければその数字をそのまま渡す

def subset_with_recursive(index_of_numbers, target, num_arr)
  # 配列の最後からアクセスしていき、indexが0（最初まで到達）したときにreturnされる
  if index_of_numbers == 0
    return true if target == 0 || target == num_arr[0]
    return false
  end

  # 自身を含む場合
  return true if subset_with_recursive(
    index_of_numbers - 1,
    target - num_arr[index_of_numbers],
    num_arr
  )

  # 自身を含まない場合
  return true if subset_with_recursive(
    index_of_numbers - 1,
    target,
    num_arr
  )

  return false
end

numbers = [3, 4, 9, 10, 2, 15, 17]
first_index = numbers.length - 1

puts subset_with_recursive(
  first_index,
  t,
  numbers
)
