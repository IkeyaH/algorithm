# https://atcoder.jp/contests/abc120/tasks/abc120_d
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

# 辺を削除していく、というのは難しいよう
# 辺を一つずつ追加していく、と変換するらしい

N, M = gets.chomp.split(' ').map(&:to_i)
a_arr = []
b_arr = []

M.times do
  a, b = gets.chomp.split(' ').map(&:to_i)
  # 0-indexに変換
  a_arr << a - 1
  b_arr << b - 1
end

uf = UnionFind.new(N)
inconvenience = Array.new(N)

# 現在の不便さ
current_inconvenience = N * (N - 1) / 2

(M - 1).downto(0) do |i|
  inconvenience[i] = current_inconvenience

  if !uf.same?(a_arr[i], b_arr[i])
    size_x = uf.size(a_arr[i])
    size_y = uf.size(b_arr[i])

    uf.unite(a_arr[i], b_arr[i])
    current_inconvenience -= size_x * size_y
  end
end

M.times do |i|
  puts inconvenience[i]
end
