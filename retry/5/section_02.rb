n = gets.chomp.to_i
scores = []

(n + 1).times do
  scores << gets.chomp.split(' ').map(&:to_i)
end

dp = Array.new(n + 1, Float::INFINITY)
dp[0] = 0

for i in 0..n do
  for j in 0..(i - 1)
    dp[i] = [dp[i], dp[j] + scores[i][j]].min
  end
end

p dp[n]
