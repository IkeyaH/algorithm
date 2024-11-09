# https://algo-method.com/tasks/341

n, m = gets.chomp.split(' ').map(&:to_i)
a_arr = gets.chomp.split(' ').map(&:to_i)
b_arr = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n) { Array.new(m, -Float::INFINITY) }
dp[0][0] = 0

for i in 1...n do
  for j in 0...m do
    if j >= a_arr[i - 1]
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - a_arr[i - 1]] + b_arr[i - 1]].max
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

if dp[n - 1][m - 1] >= 0
  puts dp[n - 1][m - 1]
else
  puts '-1'
end

# n, m = gets.chomp.split(' ').map(&:to_i)
# a_arr = gets.chomp.split(' ').map(&:to_i)
# b_arr = gets.chomp.split(' ').map(&:to_i)

# dp = Array.new(n) { Array.new(m, -Float::INFINITY) }
# dp[0][0] = 0

# for i in 0...(n - 1) do
#   for j in 0...m do
#     if j >= a_arr[i - 1]
#       dp[i + 1][j] = [dp[i][j], dp[i][j - a_arr[i]] + b_arr[i]].max
#     else
#       dp[i + 1][j] = dp[i][j]
#     end
#   end
# end

# if dp[n - 1][m - 1] >= 0
#   puts dp[n - 1][m - 1]
# else
#   puts '-1'
# end
