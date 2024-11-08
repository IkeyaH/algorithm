s, t = gets.chomp.split(' ')
s_arr = s.split('')
t_arr = t.split('')
s_len = s_arr.length
t_len = t_arr.length

dp = Array.new(s_len + 1) { Array.new(t_len + 1, 0) }

for i in 1..s_len do
  for j in 0..t_len do
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

pp dp

# acbef abcde
# pirikapirirara poporinapeperuto

# 戻し

i, j = s_len, t_len
lcs = []

while i > 0 && j > 0
  if s_arr[i - 1] == t_arr[j - 1]
    lcs << s_arr[i - 1]
    i -= 1
    j -= 1
  elsif dp[i - 1][j] > dp[i][j - 1]
    i -= 1
  else
    j -= 1
  end
end

puts lcs.reverse.join
