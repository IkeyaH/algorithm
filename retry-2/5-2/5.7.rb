# https://atcoder.jp/contests/dp/tasks/dp_f

s_arr = gets.chomp.split('')
t_arr = gets.chomp.split('')

s_len = s_arr.length
t_len = t_arr.length

# 編集距離と同じ発想
# 変更・削除等をする場合はポイントは加算されない

dp = Array.new(s_len + 1) { Array.new(t_len + 1, 0) }

for i in 1..s_len do
  for j in 1..t_len do
    if i > 0 && j > 0
      if s_arr[i - 1] == t_arr[j - 1]
        dp[i][j] = [dp[i - 1][j - 1] + 1, dp[i][j]].max
      else
        dp[i][j] = [dp[i - 1][j - 1], dp[i][j]].max
      end
    end

    if i > 0
      dp[i][j] = [dp[i - 1][j], dp[i][j]].max
    end

    if j > 0
      dp[i][j] = [dp[i][j - 1], dp[i][j]].max
    end
  end
end

# 復元
i, j = s_len, t_len
cls = []

while i > 0 && j > 0
  if s_arr[i - 1] == t_arr[j - 1]
    cls.unshift(s_arr[i - 1])
    i -= 1
    j -= 1
  elsif dp[i][j - 1] > dp[i - 1][j]
    j -= 1
  else
    i -= 1
  end
end

puts cls.join
