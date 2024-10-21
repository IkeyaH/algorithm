
def subset_with_recursive(num_of_numbers:, expected_number:, numbers:, memo:)
  key = [num_of_numbers, expected_number]
  result = false
  p memo

  # ベースケース
  return memo[key] if memo.key?(key)

  if num_of_numbers == 0
    result = expected_number == 0
    memo[key] = result
    return result
  end


  # numbers[num_of_numbers - 1]（自身の数）を含まない場合、そのまま以降の処理に移る
  result = subset_with_recursive(
    num_of_numbers:  (num_of_numbers - 1),
    expected_number: expected_number,
    numbers:         numbers,
    memo: memo
  )

  # numbers[num_of_numbers - 1]（自身の数）を含む場合、自身を引いて以降の処理に移る
  if !result
    result = subset_with_recursive(
      num_of_numbers:  num_of_numbers - 1,
      expected_number: expected_number - numbers[num_of_numbers - 1],
      numbers:         numbers,
      memo: memo
    )
  end

  memo[key] = result
  return result
end

NUMBERS = [1,3,5,9]

puts subset_with_recursive(
  num_of_numbers: 4,
  expected_number: 11,
  numbers: NUMBERS,
  memo: {}
)
