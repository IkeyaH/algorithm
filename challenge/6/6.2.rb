def count_combinations(a, b, c)
  a.sort!
  c.sort!

  count = 0

  b.each do |y|
    a_count = a.bsearch_index { |x| x >= y } || a.length
    c_count = c.length - (c.bsearch_index { |z| z > y } || c.length)
    count += a_count * c_count
  end

  count
end

# 入力の読み込み
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

# 結果の出力
puts count_combinations(a, b, c)

# n = gets.to_i
# a = gets.chomp.split(' ').map(&:to_i)
# b = gets.chomp.split(' ').map(&:to_i)
# c = gets.chomp.split(' ').map(&:to_i)

# a.sort!
# c.sort!

# count = 0

# b.each do |_b|
#   a_index = a.bsearch_index { |x| x > _b }
#   c_index = c.bsearch_index { |x| x > _b }
#   p a_index
#   p c_index
#   if a_index != nil && c_index != nil
#     count += ((a_index) * (n - c_index))
#   end
# end

# p count
