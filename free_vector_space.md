# 自由ベクトル空間

注：このような構成でベクトル空間がつくれるというだけで任意のベクトル空間がこの性質（任意の元が有限の基底で表現される）というわけではない．．．

$k$ ：体

$X$ ：集合

$d$ ：$X$の濃度

$F$ ：$X$から$k$への射の集合（ただし$\forall f\in F$が有限個を除く全ての$x\in X$に対し$f(x)=0$．）

$h$ ：$X$から$F$への射

## $F$がベクトル空間となる

$f_1,f_2 \in F$に対し$(f_1+f_2)(x) = f_1(x) + f_2(x) \in k$，
$kf_1(x) \in k$ より$F$はベクトル空間

## $F$の基底

$y \in X$に対し
$$\delta_y(x) = \left\{\begin{array}{cc}1 & x = y \\0 & otherwise\end{array}\right. $$
とすると$\delta_y\in F$．

### $\{\delta_y\}_X$ は $F$の基底となる．

$E=\{e_i\}$が$F$の基底であるとは以下２つを満たすことである．

1. $\forall f\in F$に対し，有限個の$\lambda_i \in k$が存在し$f = \sum_i\lambda_i e_i$となる．

2. $\{e\}_i$から任意の互いに異なる有限個の元が線形独立．

$\{\delta_y\}_X$について
1は自明，2は$f=\sum_{i} \lambda_i \delta_{x_i}=0$とすると，任意の$i$に対し$f(x_i) = \lambda_i = 0$であることから成立．

## 直和$F$（$h:X\to F$の普遍性）

h : $X\to F$ $(i(x)\mapsto \delta_x)$という写像は$\{\delta_y\}_X\subset F$と全単射であるので，この写像をもって$X$は$F$の基底とみなせる．

任意のベクトル空間$V$に対し，$X$から$V$への射$\phi$が存在するならば$F$から$V$への射$\tau$が一意に存在し$\phi = \tau\circ h$を満たす．

つまり$h$が普遍性を有し，$F$は圏論的な意味で直和になっている．これは集合論的な直和と等価であり実際$i:F\to k^d$として$f\in F$に対し（$k$の元$\{\lambda_j\}$が存在し，$f=\sum_j\lambda_j\delta_j$）$i(f) := [\lambda_1,\ldots,\lambda_d]$ とすると，$i$は全単射となる．
