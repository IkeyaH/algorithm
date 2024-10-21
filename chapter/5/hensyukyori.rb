S = 'logistic'
T = 'algorithm'

s = S.split('')
t = T.split('')

dp = Array.new(s.length + 1) {Array.new(t.length + 1, Float::INFINITY)}
dp[0][0] = 0

(0..(s.length)).each do |i|
  (0..(t.length)).each do |j|
    # 変更操作, 同じ場合は変更なし
    if i > 0 && j > 0
      if s[i - 1] == t[j - 1]
        dp[i][j] = [dp[i][j], dp[i - 1][j - 1]].min
      else
        dp[i][j] = [dp[i][j], dp[i - 1][j - 1] + 1].min
      end
    end

    # 削除
    # sから削除するので、今いるsの一個前(i - 1)の箇所にプラス1する
    if i > 0
      dp[i][j] = [dp[i][j], dp[i - 1][j] + 1].min
    end

    # 追加（tから削除、という考え方）
    # tから削除するので、今いるjの一個前(j - 1)の箇所にプラス1する
    if j > 0
      dp[i][j] = [dp[i][j], dp[i][j - 1] + 1].min
    end
  end
end

p dp[s.length][t.length]
