
def fibo(n)
  puts 'fibo' + n.to_s + 'を呼び出しました'
  return 0 if n == 0
  return 1 if n == 1

  return fibo(n - 1) + fibo(n - 2)
end

puts fibo(6)
