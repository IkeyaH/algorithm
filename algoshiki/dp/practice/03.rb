# https://algo-method.com/tasks/7147e09c64ad8783

n, m = gets.chomp.split(' ').map(&:to_i)
weights = gets.chomp.split(' ').map(&:to_i)
values = gets.chomp.split(' ').map(&:to_i)
v_max = values.sum

dp = Array.new(n + 1) { Array.new(v_max + 1, Float::INFINITY) }
dp[0][0] = 0

for i in 1..n do
  for j in 0..v_max do
    if j >= values[i - 1]
      if dp[i - 1][j - values[i - 1]] + weights[i - 1] <= m
        dp[i][j] = [dp[i - 1][j], dp[i - 1][j - values[i - 1]] + weights[i - 1]].min
      else
        dp[i][j] = dp[i - 1][j]
      end
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

arr = dp[n]
result = 0

for i in 0..v_max do
  if arr[i] < 10**9
    result = i
  end
end

puts result
