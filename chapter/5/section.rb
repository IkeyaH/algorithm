n = gets.chomp.to_i
scores = []


(n + 1).times do
  score = gets.chomp.split(' ').map(&:to_i)
  scores << score
end

dp = Array.new((n + 1), Float::INFINITY)
dp[0] = 0

for i in (0..n) do
  for j in (0..(i)) do
    dp[i] = [dp[i], dp[j] + scores[i][j]].min
  end
end

p dp[n]


# scores サンプル
# [[0, 7, 1, 6], [7, 0, 5, 3], [1, 5, 0, 4], [6, 3, 4, 0]]
