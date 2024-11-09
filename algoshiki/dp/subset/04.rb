
N, M = gets.chomp.split(' ').map(&:to_i)
nums = gets.chomp.split(' ').map(&:to_i)

MOD = 1000

dp = Array.new(N + 1) { Array.new(M + 1, 0) }
dp[0][0] = 1


for i in 0...N do
  target = nums[i]
  for j in 0..M do
    if j >= target
      dp[i + 1][j] = (dp[i][j - target] + dp[i][j]) % MOD
    else
      dp[i + 1][j] = dp[i][j] % MOD
    end
  end
end

puts dp[-1][-1]
