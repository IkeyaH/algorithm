n = gets.chomp.to_i
poles = gets.chomp.split.map(&:to_i)

dp = Array.new(n, Float::INFINITY)
dp[0] = 0
dp[1] = (poles[0] - poles[1]).abs

for i in 2..(n - 1) do
  before_one = dp[i - 1] + (poles[i] - poles[i - 1]).abs
  before_two = dp[i - 2] + (poles[i] - poles[i - 2]).abs
  dp[i] = [before_one, before_two].min
end

p dp[n - 1]
