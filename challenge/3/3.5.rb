# https://atcoder.jp/contests/abc081/tasks/abc081_b

n = gets.to_i
a_arr = gets.chomp.split(' ').map(&:to_i)

count = 0
cnt_flag = true

while cnt_flag
  a_arr.each_with_index do |a, i|
    if a_arr[i] % 2 == 0
      a_arr[i] = a_arr[i] / 2
    else
      cnt_flag = false;
    end
  end
  if cnt_flag
    count += 1
  end
end

puts count
