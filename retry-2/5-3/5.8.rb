# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=2877

n, m = gets.chomp.split(' ').map(&:to_i)
heights = gets.chomp.split(' ').map(&:to_i)

cum_sum = Array.new(n + 1, 0)
for i in 1..n do
  cum_sum[i] = cum_sum[i - 1] + heights[i - 1]
end

dp = Array.new(n + 1) { Array.new(m + 1, -Float::INFINITY) }
dp[0][0] = 0

for i in 1..n do # 何個までの数字を考えるか
  for j in 1..[i, m].min do # m個までの区切り、という制御
    for k in 0...i do # kの位置を最後の分割位置とする
      avg = (cum_sum[i] - cum_sum[k]).to_f / (i - k)
      dp[i][j] = [dp[i][j], dp[k][j - 1] + avg].max
    end
  end
end

pp dp
