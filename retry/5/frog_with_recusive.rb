len = gets.chomp.to_i
pole = gets.chomp.split(' ').map(&:to_i)

def frog_with_recusive(poles, index, memo={})
  return memo[0] = 0 if index == 0
  return memo[1] = (poles[0] - poles[1]).abs if index == 1

  return memo[i] if memo.key?(index)

  # 一個前
  before_one = frog_with_recusive(poles, index - 1) + (poles[index] - poles[index - 1]).abs
  before_two = Float::INFINITY
  if index >= 2
    before_two = frog_with_recusive(poles, index - 2) + (poles[index] - poles[index - 2]).abs
  end

  return memo[index] = [before_one, before_two].min
end

puts frog_with_recusive(pole, len - 1)
