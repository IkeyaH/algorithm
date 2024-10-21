# N を入力から受け取る
# 1 3 5 5 7 のような文字列を受け取り、その組み合わせでNが作れるか試す部分和問題とする

num = gets.chomp.to_i
get_arr = gets.chomp.split(' ').map(&:to_i)

# 部分和を配列として返す関数
def all_subset(arr)
  n = arr.length
  all = []

  (1 << n).times do |bit|
    sum = 0
    n.times do |i|
      if bit[i] == 1
        sum += arr[i]
      end
    end
    all << sum
  end
  return all.uniq
end


all_subsets = all_subset(get_arr)

puts all_subsets.include?(num) ? 'Yes' : 'No'
