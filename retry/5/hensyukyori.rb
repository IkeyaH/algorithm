S = 'logistic'
T = 'algorithm'

s = S.split('')
t = T.split('')

s_len = s.length
t_len = t.length

dp = Array.new(s_len + 1) { Array.new((t_len + 1), Float::INFINITY) }
dp[0][0] = 0

for i in 0..s_len do
  for j in 0..t_len do
    if i > 0 && j > 0
      if s[i - 1] == t[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = dp[i - 1][j - 1] + 1
      end
    end

    if i > 0
      dp[i][j] = [dp[i][j], dp[i - 1][j] + 1].min
    end

    if j > 0
      dp[i][j] = [dp[i][j], dp[i][j - 1] + 1].min
    end
  end
end

p dp
