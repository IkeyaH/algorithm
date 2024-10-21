n = gets.to_i
h = []
s = []

n.times do
  height, speed = gets.chomp.split(' ').map(&:to_i)
  h << height
  s << speed
end

m = 0

for i in 0...n do
  m = [m, h[i] + s[i] * n].max
end

left = 0
right = m

while right - left > 1 do
  mid = (right + left) / 2
  ok = true
  t = Array.new(n, 0)
  for i in 0...n do
    if mid < h[i]
      ok = false
    else
      t[i] = (mid - h[i]) / s[i]
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
