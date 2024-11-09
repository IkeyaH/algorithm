# https://algo-method.com/tasks/352
n, a, b = gets.chomp.split(' ').map(&:to_i)
nums = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) { Array.new(a + 1, false) }
dp[0][0] = true

for i in 0...n do
  for j in 0...a do
    if dp[i][j]
      dp[i + 1][j] = true
      dp[i + 1][(j + nums[i]) % a] = true
    end
  end
end

if dp[n][b] == true
  puts 'Yes'
else
  puts 'No'
end
