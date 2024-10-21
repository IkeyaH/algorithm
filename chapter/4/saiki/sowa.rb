
def func(num)
  # puts num
  return 0 if num == 0
  return num + func(num - 1)
end

puts func(5)
