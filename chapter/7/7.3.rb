# https://atcoder.jp/contests/agc009/tasks/agc009_a

n = gets.chomp.to_i
a_arr = []
b_arr = []

n.times do
  a, b = gets.chomp.split(' ').map(&:to_i)
  a_arr << a
  b_arr << b
end

count = 0

for i in 1..n do
  a = a_arr[-i] + count
  b = b_arr[-i]

  if a % b != 0
    count += b - (a % b)
  end
end

puts count
