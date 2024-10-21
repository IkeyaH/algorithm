# https://atcoder.jp/contests/pastbook2022/tasks/pastbook2022_b

m, n = gets.chomp.split(' ').map(&:to_i)
s_arr = gets.chomp.split('')
t_arr = gets.chomp.split('')

dp = Array.new(m + 1) { Array.new(n + 1, Float::INFINITY) }
dp[0][0] = 0

for i in 0..m do
  for j in 0..n do
    # 同じ or 変換
    p dp
    # !!! 一度に評価すると、下の判定に進んでしまううので注意！
    # if i > 0 && j > 0 && s_arr[i - 1] == t_arr[j - 1]
    #   p 'ooo'
    #   dp[i][j] = dp[i - 1][j - 1]
    # else
    #   p 'iii'
    #   dp[i][j] = dp[i - 1][j - 1] + 1
    # end

    # 分ける方が安全 or .minをちゃんと撮る
    if i > 0 && j > 0
      if s_arr[i - 1] == t_arr[j - 1]
        p 'ooo'
        dp[i][j] = [dp[i - 1][j - 1], dp[i][j]].min
      else
        p 'iii'
        dp[i][j] = [dp[i - 1][j - 1] + 1, dp[i][j]].min
      end
    end

    # 文字の追加
    if i > 0
      p 'ttt'
      dp[i][j] = [dp[i][j], dp[i - 1][j] + 1].min
    end

    if j > 0
      p 'here'
      dp[i][j] = [dp[i][j], dp[i][j - 1] + 1].min
    end
  end
end

p dp


# # https://atcoder.jp/contests/pastbook2022/tasks/pastbook2022_b

# m, n = gets.chomp.split(' ').map(&:to_i)
# s_arr = gets.chomp.split('')
# t_arr = gets.chomp.split('')

# dp = Array.new(m + 1) { Array.new(n + 1, Float::INFINITY) }
# dp[0][0] = 0


# for i in 0..m do
#   for j in 0..n do
#     # 同じ or 変換
#     if i > 0 && j > 0 && s_arr[i - 1] == t_arr[j - 1]
#       dp[i][j] = [dp[i][j], dp[i - 1][j - 1]].min
#     else
#       dp[i][j] = [dp[i][j], dp[i - 1][j - 1] + 1].min
#     end

#     # 文字の追加
#     if i > 0
#       dp[i][j] = [dp[i][j], dp[i - 1][j] + 1].min
#     end

#     if j > 0
#       dp[i][j] = [dp[i][j], dp[i][j - 1] + 1].min
#     end
#   end
# end

# p dp
