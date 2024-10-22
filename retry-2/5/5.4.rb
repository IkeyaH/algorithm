# https://algo-method.com/tasks/312

# n, target, lte = gets.chomp.split(' ').map(&:to_i)
# scores = gets.chomp.split(' ').map(&:to_i)
# max = scores.sum

# dp = Array.new(n + 1) { Array.new(max + 1, Array.new(2)) }
# dp[0][0] = [0, true]

# for i in 1..n do
#   for j in 0..max do
#     if j >= scores[i - 1]
#       if dp[i - 1][j - scores[i - 1]][1] == true
#         if dp[i - 1][j][1] == true
#           min_count = [
#             dp[i - 1][j - scores[i - 1]][0] + 1,
#             dp[i - 1][j][0]
#           ].min
#           dp[i][j] = [min_count, true]
#         else
#           dp[i][j] = [
#             dp[i - 1][j - scores[i - 1]][0] + 1,
#             true
#           ]
#         end
#       else
#         dp[i][j] = dp[i - 1][j]
#       end
#     else
#       dp[i][j] = dp[i - 1][j]
#     end
#   end
# end

# if target <= max && dp[n][target][0] != nil && dp[n][target][1] == true && dp[n][target][0] <= lte
#   puts 'Yes'
# else
#   puts 'No'
# end

# リファクタ
n, target, lte = gets.chomp.split(' ').map(&:to_i)
scores = gets.chomp.split(' ').map(&:to_i)
max = scores.sum

dp = Array.new(n + 1) { Array.new(max + 1, Array.new([Float::INFINITY, false])) }
dp[0][0] = [0, true]

for i in 1..n do
  score = scores[i - 1]
  for j in 0..max do
    if j >= score && dp[i - 1][j - score][1] == true
      if dp[i - 1][j][1] == true
        min_count = [
          dp[i - 1][j - score][0] + 1,
          dp[i - 1][j][0]
        ].min
        dp[i][j] = [min_count, true]
      else
        dp[i][j] = [
          dp[i - 1][j - score][0] + 1,
          true
        ]
      end
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

if target <= max && dp[n][target][1] == true && dp[n][target][0] <= lte
  puts 'Yes'
else
  puts 'No'
end
