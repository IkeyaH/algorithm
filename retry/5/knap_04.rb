goods_num, capacity = gets.chomp.split(' ').map(&:to_i)
weights = []
values = []

goods_num.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  weights << w
  values << v
end

dp = Array.new(goods_num + 1) { Array.new(capacity + 1, 0) }

for i in 1..goods_num do
  for j in 0..capacity do
    if j >= weights[i - 1]
      dp[i][j] = [dp[i-1][j], dp[i - 1][j - weights[i - 1]] + values[i - 1]].max
    else
      dp[i][j] = dp[i-1][j]
    end
  end
end

p dp
