# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=2877
# n, m = gets.chomp.split(' ').map(&:to_i)
# heights = gets.chomp.split(' ').map(&:to_i)

# cum_sum = Array.new(n + 1, 0)
# (1..n).each do |i|
#   cum_sum[i] = cum_sum[i - 1] + heights[i - 1]
# end


# dp = Array.new(n + 1) { Array.new(m + 1, -Float::INFINITY) }
# dp[0][0] = 0

# for i in 1..n do
#   for j in 1..[i, m].min do
#     for k in 0...i
#       avg = (cum_sum[i] - cum_sum[k]).to_f / (i - k)
#       dp[i][j] = [
#         dp[i][j],
#         dp[k][j - 1] + avg
#       ].max
#     end
#   end
# end

# puts dp[-1].max
# 以下はai生成
n, m = gets.chomp.split(' ').map(&:to_i)
heights = gets.chomp.split(' ').map(&:to_i)

# 累積和の計算
cum_sum = Array.new(n + 1, 0)
(1..n).each do |i|
  cum_sum[i] = cum_sum[i - 1] + heights[i - 1]
end

# 区間の平均値を計算する関数
def get_average(cum_sum, l, r)
  (cum_sum[r] - cum_sum[l]).to_f / (r - l)
end

# DPテーブル
dp = Array.new(n + 1) { Array.new(m + 1, -Float::INFINITY) }
dp[0][0] = 0

# 最適化されたDP遷移
for j in 1..m do
  # 前回のjに関する計算結果を保持
  prev_max = -Float::INFINITY

  for i in j..n do
    # i番目の要素を含むグループを作る場合の最適値を計算
    curr_max = -Float::INFINITY

    # 最適な分割点を探索
    # j-1個のグループが既に作られている状態から、
    # 新しいグループを追加する
    (j-1...i).each do |k|
      avg = get_average(cum_sum, k, i)
      value = dp[k][j-1] + avg
      curr_max = value if value > curr_max
    end

    dp[i][j] = curr_max
  end
end

puts dp[n].max
