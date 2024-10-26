# ペア和の最小値

# n個の整数 a0,a1...,an-1 と n個の整数b0..,bn-1
# 両方から一つ選び和を取る
# K以上の範囲内での最小値

# 正誤がわかりにくいのでソート済みを用意
arr_a = [1, 3, 4, 4, 5, 8, 9, 11, 12, 13, 14, 19]
arr_b = [2, 3, 4, 5, 6, 7, 9, 10, 12, 14, 18, 19]
k = 34

arr_b.sort!
result = Float::INFINITY

arr_a.each do |a|
  l = k - a
  b = arr_b.bsearch { |x| x >= l }
  if b != nil
    result = a + b if a + b < result
  end
end

p result
