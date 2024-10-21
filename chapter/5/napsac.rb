# N個の荷物, i番目の荷物には価値viと重さwiが与えられている
# 許容量Wのナップサックが一つある。最大の価値を求める
# 入力：
# N W
# vi wi
# ...
# vn, wn

N, W = gets.chomp.split(' ').map(&:to_i)
values = []
weights = []
N.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  values << v
  weights << w
end

def knapsack(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) {Array.new(capacity + 1, 0)}

  # 自分を入れる可能性のある場合、dpの前の列における、自身の重量を引いた箇所の値と自身の値を足した数と、
  # 自身を入れなかった場合（前の列の同じ行）とを比較する
  (1..n).each do |i|
    (0..capacity).each do |w|
      if weights[i - 1] <= w
        dp[i][w] = [dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]].max
      else
        dp[i][w] = dp[i - 1][w]
      end
    end
  end

  dp[n][capacity]
end

puts knapsack(weights, values, W)
