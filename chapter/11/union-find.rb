# model-answerを元に、rubyでunion-findを実装する

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

# テスト
uf = UnionFind.new(7) # {0}, {1}, {2}, {3}, {4}, {5}, {6}

p uf.par

uf.unite(1, 2) # {0}, {1, 2}, {3}, {4}, {5}, {6}
uf.unite(2, 3) # {0}, {1, 2, 3}, {4}, {5}, {6}
uf.unite(5, 6) # {0}, {1, 2, 3}, {4}, {5, 6}

p uf.same?(1, 3)
p uf.same?(2, 5)

p uf.par

uf.unite(0, 1) # {0, 1, 2, 3}, {4}, {5, 6}
p uf.par
p uf.size(0) # 4
p uf.size(1) # 4
p uf.size(2) # 4
p uf.size(3) # 4
p uf.size(4) # 1
p uf.size(5) # 2
p uf.size(6) # 2
