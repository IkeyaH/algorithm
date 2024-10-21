
def subset(arr, target)
  results = []
  n = arr.length
  (1 << n).times do |bit|
    sum = 0
    n.times do |i|
      if bit[i] == 1
        sum += arr[i]
      end
    end
    results << sum
  end

  results.include?(target) ? 'Yes' : 'No'
end

puts subset([2,5,6,8], 13)
