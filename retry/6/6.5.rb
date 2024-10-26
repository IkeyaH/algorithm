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
  max = [max, heights[i] + speed[i] * n].max
end

left = 0
right = max

# 値が交差するまでではなく、隣り合うまで、という条件が良い。
# right > leftとすると、差が1の場合でも続いてしまい、解を逃してしまう。
# right - left > 1 とすることにより、rightは解を含む・leftは含まないという状況を保持できる。
while right - left > 1 do
  mid = (left + right) / 2
  t = Array.new(n, 0)
  ok = true
  for i in 0...n do
    if mid < heights[i]
      ok = false
    else
      t[i] = (mid - heights[i]) / speed[i]
    end
  end
  t.sort!

  for i in 0...n do
    ok = false if t[i] < i
  end

  if ok == true
    right = mid
  else
    left = mid
  end
end

p right
