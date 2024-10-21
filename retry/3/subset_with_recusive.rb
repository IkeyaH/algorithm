
def subset_with_recursive(numbers:, target:, index:, memo:)
  p memo
  key = [target, index]

  # ベースケース
  return memo[key] if memo.key?(key)

  if index == -1
    result = target == 0
    memo[key] = result
    return result
  end


  # 自身の数字を利用して再帰
  result = subset_with_recursive(
    numbers: numbers,
    target: (target - numbers[index]),
    index: (index - 1),
    memo: memo
  )

  # 自身を利用せず再帰
  if !result
    result = subset_with_recursive(
      numbers: numbers,
      target: target,
      index: (index - 1),
      memo: memo
    )
  end

  memo[key] = result
  return result
end


NUMBERS = [3,9,4,5]
target = 12
index = NUMBERS.length - 1

puts subset_with_recursive(
  numbers: NUMBERS,
  target: target,
  index: index,
  memo: {}
)
