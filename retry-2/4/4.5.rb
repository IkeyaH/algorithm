# https://atcoder.jp/contests/abc114/tasks/abc114_c

def func(n, cur, use)
  return 0 if cur > n
  return 1 if use == 0b111

  counter = 0

  counter += func(n, cur * 10 + 7, use | 0b001)
  counter += func(n, cur * 10 + 5, use | 0b010)
  counter += func(n, cur * 10 + 3, use | 0b100)

  return counter
end


n = gets.to_i
puts func(n, 0, 0)
