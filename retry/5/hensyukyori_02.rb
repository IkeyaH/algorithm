s_len, t_len = gets.chomp.split(' ').map(&:to_i)
s = gets.chomp.split('')
t = gets.chomp.split('')

dp = Array.new(s_len + 1) { Array.new((t_len + 1), Float::INFINITY) }
dp[0][0] = 0

for i in 0..s_len do
  for j in 0..t_len do
    if i > 0 && j > 0
      if s[i - 1] == t[j - 1]
        dp[i][j] = [dp[i][j], dp[i - 1][j - 1]].min
      else
        dp[i][j] = [dp[i][j], dp[i - 1][j - 1] + 1].min
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

puts dp[s_len][t_len]
