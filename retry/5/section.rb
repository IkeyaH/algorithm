n = gets.chomp.to_i
scores = []


(n + 1).times do
  score = gets.chomp.split(' ').map(&:to_i)
  scores << score
end

dp = Array.new(n + 1, Float::INFINITY)
dp[0] = 0

for i in 0..n do
  for j in 0..(i-1) do
    dp[i] = [dp[j] + scores[i][j], dp[i]].min
  end
end

puts dp[n]
