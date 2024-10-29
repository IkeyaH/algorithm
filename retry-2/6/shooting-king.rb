# https://atcoder.jp/contests/abc023/tasks/abc023_d

n = gets.to_i
heights = []
speed = []

n.times do
  h, s = gets.chomp.split(' ').map(&:to_i)
  heights << h
  speed << s
end

max = 0

for i in 0...n do
  m = heights[i] + (speed[i] * n)
  max = m if m > max
end

left, right = 0, max
# やっぱり.eachとかよりfor iの方がわかりやすいな。。
# 再掲
# 値が交差するまでではなく、隣り合うまで、という条件が良い。
# right > leftとすると、差が1の場合でも続いてしまい、解を逃してしまう。
# right - left > 1 とすることにより、rightは解を含む・leftは含まないという状況を保持できる。
while right - left > 1
  mid = (right + left) / 2
  t = Array.new(n, 0)
  ok = true
  n.times do |i|
    ok = false if mid < heights[i]
    t[i] = (mid - heights[i]) / speed[i]
  end
  t.sort!

  t.each_with_index do |u, i|
    if u < i
      ok = false
    end
  end

  if ok == false
    left = mid
  else
    right = mid
  end
end

puts right
