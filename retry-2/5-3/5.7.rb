# https://atcoder.jp/contests/dp/tasks/dp_f

s_arr = gets.chomp.split('')
t_arr = gets.chomp.split('')

s_len = s_arr.length
t_len = t_arr.length

dp = Array.new(s_len + 1) { Array.new(t_len + 1, 0) }
dp[0][0] = 0

for i in 1..s_len do
  for j in 1..t_len do
    if s_arr[i - 1] == t_arr[j - 1]
      dp[i][j] = [
        dp[i][j],
        dp[i - 1][j - 1] + 1
      ].max
    else
      dp[i][j] = [
        dp[i][j],
        dp[i - 1][j - 1]
      ].max
    end

    if i > 0
      dp[i][j] = [dp[i][j], dp[i - 1][j]].max
    end

    if j > 0
      dp[i][j] = [dp[i][j],dp[i][j - 1]].max
    end
  end
end

i = s_len
j = t_len
result = []

while i > 0  && j > 0
  if s_arr[i - 1] == t_arr[j - 1]
    result.unshift(s_arr[i - 1])
    i -= 1
    j -= 1
  elsif dp[i - 1][j] > dp[i][j - 1]
    i -= 1
  else
    j -= 1
  end
end

puts result.join
