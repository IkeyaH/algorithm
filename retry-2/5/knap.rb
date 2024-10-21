# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_s

n, cap = gets.chomp.split(' ').map(&:to_i)

w_arr = []
v_arr = []

n.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  w_arr << w
  v_arr << v
end

dp = Array.new(n + 1) { Array.new(cap + 1, 0) }

for i in 1..n do
  for j in 1..cap do
    # その荷物を利用しない場合
    if j < w_arr[i - 1]
      dp[i][j] = dp[i - 1][j]
    else
      # その荷物を利用する場合
      dp[i][j] = [
        dp[i - 1][j],
        dp[i - 1][j - w_arr[i - 1]] + v_arr[i - 1]
      ].max
    end
  end
end

p dp[-1][-1]
