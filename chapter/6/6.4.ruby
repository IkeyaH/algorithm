arr_a = [1,4,6,8,9,10,13,14,15,18,20,22,23,37]
arr_b = [2,4,5,7,9,13,15,17,19,22,24,26,28,31,35]

k = 20

result = Float::INFINITY

for i in 0..(arr_a.length - 1) do
  a = k - arr_a[i]
  b = arr_b.bsearch_index { |x| x >= a }

  val = arr_a[i] + arr_b[b]

  result = val if result >= val
end

puts result
