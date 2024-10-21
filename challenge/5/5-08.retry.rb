n, m = gets.chomp.split(' ').map(&:to_i)
heights = gets.chomp.split(' ').map(&:to_f)

dp = Array.new(n + 1) { Array.new(m + 1, -Float::INFINITY) }
dp[0][0] = 0.0

cum_sum = Array.new(n + 1, 0.0)

for i in 0...n do
  cum_sum[i + 1] = cum_sum[i] + heights[i]
end

for i in 1..n do
  for j in 1..[i, m].min
    for k in 0...i do
      avg = (cum_sum[i] - cum_sum[k]).to_f / (i - k).to_f
      dp[i][j] = [
        dp[i][j],
        dp[k][j - 1] + avg
      ].max
    end
  end
end

p dp
