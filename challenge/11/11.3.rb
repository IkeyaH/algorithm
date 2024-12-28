# https://atcoder.jp/contests/abc049/tasks/arc065_b

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

N, K, L = gets.chomp.split(' ').map(&:to_i)

uf_root = UnionFind.new(N)
uf_train = UnionFind.new(N)

K.times do |i|
  p, q = gets.chomp.split(' ').map(&:to_i)
  uf_root.unite(p - 1, q - 1)
end

L.times do |k|
  r, s = gets.chomp.split(' ').map(&:to_i)
  uf_train.unite(r - 1, s - 1)
end

root_hash = {}

N.times do |i|
  root_road = uf_root.root(i)
  root_train = uf_train.root(i)
  if root_hash[[root_road, root_train]] != nil
    root_hash[[root_road, root_train]] = root_hash[[root_road, root_train]] += 1
  else
    root_hash[[root_road, root_train]] = 1
  end
end

N.times do |i|
  root_road = uf_root.root(i)
  root_train = uf_train.root(i)
  print "#{root_hash[[root_road, root_train]]} "
end

puts 
