# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_s

N, W = gets.chomp.split(' ').map(&:to_i)
weights = []
values = []

N.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  weights << w
  values << v
end

def knap(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) {Array.new(capacity + 1, 0)}

  # 0はすでに初期化済みなので、1 ~ n までで表を作る
  (1..n).each do |i|
    # 一行目は0なので、0 ~ capacityまで続ける
    (0..capacity).each do |cap|
      if weights[i - 1] <= cap
        dp[i][cap] = [dp[i - 1][cap], dp[i - 1][cap - weights[i - 1]] + values[i - 1]].max
      else
        dp[i][cap] = dp[i - 1][cap]
      end
    end
  end

  return dp[n][capacity]
end

puts knap(weights, values, W)
