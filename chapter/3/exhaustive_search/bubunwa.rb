
# 配列の中の数値を利用し、その中のいくつかを選らんでnが作れるか問題

def subset_sum(arr)
  n = arr.length
  all_subset = []
  sums = []

  (1 << n).times do |bit|
    subset = []
    sum = 0

    n.times do |i|
      if bit[i] == 1
        subset << arr[i]
        sum += arr[i]
      end
    end

    all_subset << [subset, sum]
  end
  all_subset
end

p subset_sum([1,4,6])
