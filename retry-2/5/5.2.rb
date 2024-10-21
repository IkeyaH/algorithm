# https://atcoder.jp/contests/math-and-algorithm/tasks/math_and_algorithm_i

n, target = gets.chomp.split(' ').map(&:to_i)
numbers = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) { Array.new(target + 1, false) }
dp[0][0] = true

for i in 1..n do
  for j in 0..target do
    if j >= numbers[i - 1]
      dp[i][j] = dp[i - 1][j - numbers[i - 1]] || dp[i - 1][j]
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

if dp[-1][-1]
  puts 'Yes'
else
  puts 'No'
end
