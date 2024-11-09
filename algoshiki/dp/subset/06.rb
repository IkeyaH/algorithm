# https://algo-method.com/tasks/353
n = gets.to_i
nums = gets.chomp.split(' ').map(&:to_i)

max_sum = nums.sum

dp = Array.new(n + 1) { Array.new(max_sum + 1, false) }
dp[0][0] = true

for i in 0...n do
  for j in 0...max_sum do
    if dp[i][j]
      dp[i + 1][j] = true
      if j + nums[i] <= max_sum
        dp[i + 1][j + nums[i]] = true
      end
    end
  end
end

min_diff = Float::INFINITY

for i in 0...max_sum do
  if dp[n][i]
    box_1 = i
    box_2 = max_sum - i
    diff = (box_1 - box_2).abs
    if diff < min_diff
      min_diff = diff
    end
  end
end

puts min_diff
