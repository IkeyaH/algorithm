
n = gets.chomp.to_i
ashiba = gets.chomp.split(' ').map(&:to_i)
m = ashiba.length

dp = Array.new(n, Float::INFINITY)
dp[0] = 0

for i in 0...(n - 1) do
  if i + 1 < n
    cost = dp[i] + (ashiba[i] - ashiba[i + 1]).abs
    dp[i + 1] = cost if dp[i + 1] > cost
  end

  if i + 2 < n
    cost = dp[i] + (ashiba[i] - ashiba[i + 2]).abs
    dp[i + 2] = cost if dp[i + 2] > cost
  end
end

p dp[n - 1]
