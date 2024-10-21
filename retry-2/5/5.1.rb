# https://atcoder.jp/contests/dp/tasks/dp_c

n = gets.to_i
scores = []

n.times do
  scores << gets.chomp.split(' ').map(&:to_i)
end

dp = Array.new(n) { Array.new(3, 0) }

dp[0][0] = scores[0][0]
dp[0][1] = scores[0][1]
dp[0][2] = scores[0][2]

for i in 1...n do
  for j in 0..2 do
    for k in 0..2 do
      if j != k
        dp[i][j] = [
          dp[i][j],
          dp[i - 1][k] + scores[i][j]
        ].max
      end
    end
  end
end

p dp[-1].max
