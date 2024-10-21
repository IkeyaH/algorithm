
def flog_with_memo(heights, index, memo={})
  p memo
  return memo[0] = 0 if index == 0
  return memo[1] = (heights[1] - heights[0]).abs if index == 1

  return memo[index] if memo.key?(index)

  jump_before_one = flog_with_memo(heights, index - 1, memo) + (heights[index] - heights[index - 1]).abs
  jump_before_two = Float::INFINITY
  if index <= heights.length - 2
    jump_before_two = flog_with_memo(heights, index - 2, memo) + (heights[index] - heights[index - 2]).abs
  else
    jump_before_two = Float::INFINITY
  end

  return memo[index] = [jump_before_one, jump_before_two].min
end

puts flog_with_memo([1,5,2,8,7,9,32,11,13,20,9,3,7], 12, {})
