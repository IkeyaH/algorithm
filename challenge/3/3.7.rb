# https://atcoder.jp/contests/abc045/tasks/arc061_a

s = gets.chomp
n = s.length

sum = 0

(1 << (n - 1)).times do |bit|
  s_now = s
  s_arr = []
  (n - 1).times do |i|
    if bit[i] == 1
      tmp = s_now.split()
    end
  end
end
