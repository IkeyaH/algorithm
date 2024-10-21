# https://atcoder.jp/contests/dp/tasks/dp_c
n = gets.chomp.to_i
activity_scores = n.times.map { gets.split(' ').map(&:to_i) }

dp = Array.new(n) { Array.new(3, 0) }

dp[0][0] = activity_scores[0][0]
dp[0][1] = activity_scores[0][1]
dp[0][2] = activity_scores[0][2]

# j 前日
# k 今日（求めたいdpの日）
for i in 1..(n - 1)
  for j in 0..2 do
    for k in 0..2 do
      if j != k
        dp[i][k] = [dp[i][k], dp[i - 1][j] + activity_scores[i][k]].max
      end
    end
  end
end

p dp[n - 1].max
