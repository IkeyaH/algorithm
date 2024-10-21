
def subset_with_recursive(num_of_numbers:, expected_number:, numbers:)
  # ベースケース
  if num_of_numbers == 0
    return true if expected_number == 0
    return false
  end

  # numbers[num_of_numbers - 1]（自身の数）を含まない場合、そのまま以降の処理に移る
  return true if subset_with_recursive(
    num_of_numbers:  (num_of_numbers - 1),
    expected_number: expected_number,
    numbers:         numbers
  )

  # numbers[num_of_numbers - 1]（自身の数）を含む場合、自身を引いて以降の処理に移る
  return true if subset_with_recursive(
    num_of_numbers:  (num_of_numbers - 1),
    expected_number: (expected_number - numbers[num_of_numbers - 1]),
    numbers:         numbers
  )

  return false
end

NUMBERS = [3,9,4,5]

puts subset_with_recursive(
  num_of_numbers: 4,
  expected_number: 18,
  numbers: NUMBERS
)
