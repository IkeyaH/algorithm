# 動的計画法基礎
# frog は 一つ次 or 一つ飛ばして移動可能

len = gets.chomp.to_i
pole = gets.chomp.split(' ').map(&:to_i)
dp = {}

pole.each_with_index do |p, i|
  dp[i] = 0 if i == 0
  next if i == 0

  dp[i] = (pole[0] - p).abs if i == 1
  next if i == 1


  # 一つ前から来た場合
  before_one = (dp[i - 1] + (pole[i - 1] - pole[i]).abs)

  # 二つ前から来た場合
  before_two = (dp[i - 2] + (pole[i - 2] - pole[i]).abs)

  dp[i] = [before_one, before_two].min
  p dp
end

puts dp[len - 1]
