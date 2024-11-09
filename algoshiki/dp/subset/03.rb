# https://algo-method.com/tasks/350

N, M = gets.chomp.split(' ').map(&:to_i)
weights = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(N + 1) { Array.new(M + 1, Float::INFINITY) }
dp[0][0] = 0

for i in 1..N do
  target = weights[i - 1]
  for j in 0..M do
    if j >= target
      dp[i][j] = [
        dp[i - 1][j],
        dp[i - 1][j - target] + 1
      ].min
    else
      dp[i][j] = [
        dp[i - 1][j],
        dp[i][j]
      ].min
    end
  end
end

if dp[N][M] != Float::INFINITY
  puts dp[N][M]
else
  puts -1
end
