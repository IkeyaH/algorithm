# 入力の読み込み
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

a.sort!
c.sort!

count = 0

b.each do |y|
  a_count = a.bsearch_index { |x| x >= y } || a.length
  c_count = c.length - (c.bsearch_index { |z| z > y } || c.length)
  count += a_count * c_count
end

p count
