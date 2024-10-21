# https://atcoder.jp/contests/abc051/tasks/abc051_b

k, target = gets.chomp.split(' ').map(&:to_i)

count = 0

for i in 0..k do
  for j in 0..k do
    x = i
    y = j
    z = target - x - y
    if z <= k && z >= 0
      count +=1
    end
  end
end

puts count
