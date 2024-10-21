# TODO: もう一度

def frog_with_recusive(heights, index)
  return 0 if index == 0
  return (heights[0] - heights[1]).abs if index == 1

  jump_before_one = frog_with_recusive(heights ,index - 1) + (heights[index] - heights[index - 1]).abs

  jump_before_two = Float::INFINITY
  if index <= heights.length - 2
    jump_before_two = frog_with_recusive(heights, index - 2) + (heights[index] - heights[index - 2]).abs
  else
    jump_before_two = Float::INFINITY
  end
  return [jump_before_one, jump_before_two].min
end

puts frog_with_recusive([1,5,2,8,7,9,32,11,13,20,9,3,7], 12)
