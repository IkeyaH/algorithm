# https://atcoder.jp/contests/dp/tasks/dp_a

n = gets.to_i
poles = gets.chomp.split(' ').map(&:to_i)

# その足場までの最短をdpに記録していく
dp = Array.new(n, Float::INFINITY)
dp[0] = 0
dp[1] = (poles[0] - poles[1]).abs

for i in 2..n - 1 do

  # 一個前から
  before_one = dp[i - 1] + (poles[i - 1] - poles[i]).abs
  # 二個前から
  before_two = dp[i - 2] + (poles[i - 2] - poles[i]).abs

  dp[i] = [before_one, before_two].min
end

p dp[-1]
