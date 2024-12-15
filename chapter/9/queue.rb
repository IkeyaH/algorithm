# キューも簡単に
# 先入れ先出し

queue = []

# 挿入
queue.push(7)
queue.push(9)
queue.push(4)
queue.push(3)
queue.push(1)
queue.push(5)
queue.push(6)

puts 'initial que = ' + queue.join(' ')

# 取り出し
a = queue.shift
b = queue.shift(2)

puts 'a: ' + a.to_s
puts 'b: ' + b.join(' ')

# 最初に挿入もできる
arr = queue
puts 'before = ' + arr.join(' ')

queue.unshift(21)
queue.unshift(99)

puts 'after = ' + arr.join(' ')
