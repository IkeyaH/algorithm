# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_s

goods_num, capa = gets.chomp.split(' ').map(&:to_i)

weights = []
values = []

goods_num.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  weights << w
  values << v
end

dp = Array.new(goods_num + 1) { Array.new(capa + 1, 0) }

for i in 1..goods_num do
  for j in 0..capa do
    if j >= weights[i-1]
      dp[i][j] = [dp[i - 1][j], dp[i-1][j - weights[i-1]] + values[i-1]].max
    else
      dp[i][j] =  dp[i - 1][j]
    end
  end
end

p dp
