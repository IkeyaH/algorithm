# https://atcoder.jp/contests/abc075/tasks/abc075_c

# Union-Find
class UnionFind
  attr_reader :par, :siz

  # 初期化
  def initialize(n)
    # 各要素の親ノードを保持する
    @par = Array.new(n, -1)
    # グループのサイズを保持する
    @siz = Array.new(n, 1)
  end

  # 根を求める
  def root(x)
    if par[x] == -1
      return x
    else
      # 経路圧縮のため、rootを再起的に呼び出し、-1になるまで行う
      return par[x] = root(par[x])
    end
  end

  # x, y が同じグループに属するかどうか（根が一致するかどうか）
  def same?(x, y)
    return root(x) == root(y)
  end

  # x を含むグループと y を含むグループとを併合
  def unite(x, y)
    # それぞれの根を取得
    x = root(x)
    y = root(y)

    # 同じグループであれば早期リターン
    return false if x == y

    # y 側のサイズが小さくなるようにする
    x, y = y, x if siz[x] < siz[y]

    # y を x　の子とする
    par[y] = x
    siz[x] += siz[y]
    return true
  end

  # グループのサイズを返す
  def size(x)
    return siz[root(x)]
  end
end

N, M = gets.chomp.split(' ').map(&:to_i)
a_arr = []
b_arr = []

M.times do
  a, b = gets.chomp.split(' ').map(&:to_i)
  a_arr << a
  b_arr << b
end

count = 0

M.times do |i|
  uf = UnionFind.new(N)

  # 該当の辺を除いてuniteする
  M.times do |j|
    next if i == j
    # !a, bをindexに直すこと!
    uf.unite(a_arr[j] - 1, b_arr[j] - 1)
  end

  ok_flag = true
  (1...N).each do |k|
    if !uf.same?(0, k)
      ok_flag = false
      break
    end
  end

  count += 1 if ok_flag == false
end

puts count
