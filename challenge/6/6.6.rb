a,b,c = gets.chomp.split(' ').map(&:to_f)

def ball_position(a, b, c, t)
  (a * t) + b.to_f * Math.sin(c * t * Math::PI)
end

left = 0.0
right = 200.0


100.times do
  mid = (left + right) / 2.0
  position = ball_position(a,b,c,mid)

  if position >= 100
    right = mid
  else
    left = mid
  end
end

puts left
# puts right
