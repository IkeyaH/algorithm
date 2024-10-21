n = gets.to_i
c_arr = []
(n + 1).times do
  c = gets.chomp.split(' ').map(&:to_i)
  c_arr << c
end

dp = Array.new(n + 1, Float::INFINITY)
dp[0] = 0

for i in 1..n do
  for j in 0...i do
    dp[i] = [
      dp[i],
      dp[j] + c_arr[i][j]
    ].min
    p dp
  end
end
