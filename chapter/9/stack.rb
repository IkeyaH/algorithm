# スタックの動作を軽く復習
# スタック = 後入れ先出し

stack = []

# 挿入
stack.push(7)
stack.push(9)
stack.push(4)
stack.push(3)
stack.push(1)
stack.push(5)
stack.push(6)

p stack

# 取り出し
a = stack.pop
b = stack.pop
c = stack.pop(2)

puts 'a: ' + a.to_s
puts 'b: ' + b.to_s
puts 'c↓'
p c
p stack
