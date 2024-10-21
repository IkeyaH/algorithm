# n個の足場, 0..n-1番目と割り振られる
# 次の足場 or 一個飛ばした先の足場に行ける
# コストは |n今 - n次|
# n個目に到達する最小値を求める

n = gets.chomp.to_i
ashiba = gets.chomp.split(' ').map(&:to_i)
m = ashiba.length

dp = {}

for i in 0...m do
  dp[0] = i if i == 0
  dp[1] = (ashiba[0] - ashiba[i]).abs if i == 1

  if i > 1
    one_step = ((ashiba[i-1]) - ashiba[i]).abs + dp[i - 1]
    two_steps = ((ashiba[i-2]) - ashiba[i]).abs + dp[i - 2]
    dp[i] = [one_step, two_steps].min
  end
end

p dp
