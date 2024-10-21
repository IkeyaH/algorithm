
def fibo_2(i)
  f = []
  f << 0
  f << 1
  for n in 2..i do
    f[n] = f[n-1] + f[n-2]
    if n == i-1
      puts i.to_s + '項目' + f[n-1].to_s
    end
  end
  p f
end

fibo_2(10)
