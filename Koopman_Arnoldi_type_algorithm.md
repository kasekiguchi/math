# 前提

## ケーリー・ハミルトンの定理

任意の正方行列 $A\in\R^n$に対し，以下を満たす実数$a_i  (i = 0,1,\ldots)$が存在する．

$$
A^n  = \sum_{i=0}^{n-1} a_iA^i
$$

## 可観測性行列と可観測正準形

可観測性行列を以下で定義する．
$$
U_o = \left[\begin{array}{c}C\\CA\\\vdots\\CA^i\\\vdots\end{array}\right]
$$

以下で定義される座標変換を考える．
$$
T =  \left[\begin{array}{cccc}l&Al&\cdots&A^il&\cdots\end{array}\right]
$$
ただし，$ l = U_o^{-1}b_c$ であり，$b_c = [0 \ \ldots \ 0 \  1]^T$である．この座標変換によってシステム$(A,C)$ は可観測正準形$(A_o, C_o) := (T^{-1}AT,CT)$に変換され各行列は以下となる．

$$
A_o = \left[\begin{array}{cc}0 & {\bm a}_1\\I&\bm{a}_2\end{array}\right],\qquad C_o = b_c^T \tag{1}
$$

ここで$[\bm{a}_1^T \quad \bm{a}_2^T ]^T = [a_0 \ a_1 \ \ldots \ a_{n-1}]^T$ はケーリー・ハミルトンの定理で展開した係数を縦に並べたものである．

### 証明

$ T = [l \quad T_2]$　というパーティションを考える．
このとき
$$
T^{-1}AT = T^{-1} [T_2 \quad A^nl] = T^{-1} \left[T_2 \quad \left(\sum_{i=0}^na_iA^i\right) l\right] = T^{-1} \left[T_2 \quad \sum_{i=0}^na_i\left(A^il\right) \right] = T^{-1} [T_2 \quad T\bm{a}]
$$
ここで$\bm{a} = [\bm{a}_1^T \quad \bm{a}_2^T ]^T$であり，第２等式はケーリー・ハミルトンの定理を用いている．以上より$A_o$を得る．

また，$CT= [1 \ 0 \ \cdots\ 0]U_oT = [1 \ 0 \ \cdots\ 0]U_o [I \ A \ A^2 \ \cdots ]\otimes l = [C \ CA \ CA^2 \ \cdots ]\otimes l = b_c^T$である．Q.E.D.

## 座標変換とヴァンデルモンド行列

固有値は正則な座標変換に対して変化しない．つまり
$ \textrm{eig}(A)=\textrm{eig}(T^{-1}AT)$である．

固有値$\lambda_1,\ldots,\lambda_n$を用いて以下のヴァンデルモンド行列を構成する．（注：以下のような形の行列をヴァンデルモンド行列といい，固有値を使っているかはヴァンデルモンド行列であるということとは関係ない．）

$$
V = \left[\begin{array}{cc}1 &\lambda_1&\lambda_1^2&\cdots&\lambda_1^{n-1}\\
1 &\lambda_2&\lambda_2^2&\cdots&\lambda_2^{n-1}\\
\vdots&\vdots&\vdots&&\vdots\\
1 &\lambda_{n}&\lambda_{n}^2&\cdots&\lambda_{n}^{n-1}\end{array}\right]
$$

正方行列$M_1,M_2,\ldots \in\R^{n\times n}$とベクトル$v\in\R^{n}$に対して簡易クロネッカー積として以下を定義する
$$
[M_1 \quad M_2 \quad \ldots]\otimes v := [M_1v\quad M_2v\quad \ldots] \in \R^{n\times n}
$$
この表記を用いると固有値を対角に並べた行列$\Lambda :=\textrm{diag}(\lambda_1,\ldots,\lambda_n)$を用いて$V$は以下のように書き直せる．

$$
V = [I\quad \Lambda\quad\Lambda^2\quad \cdots\quad \Lambda^{n-1}]\otimes\bm{1}
$$

# Arnoldi タイプアルゴリズム

以下の関数空間上の線形システムを考える．
$$
 z[k+1] = A z[k]\\
 y[k] = Cz[k]
$$

時刻$k$を下添字で表すと$y_k = CA^k z_0$ となる．

クープマン固有値行列$\Lambda:=\textrm{diag}(\lambda_1,\lambda_2,\ldots)$, クープマンモード$\Phi:=[\phi_1\ \phi_2 \ \cdots]$ を使ってクープマンモード分解が可能であるとする．
$$
\Phi_{k+1} = \Lambda\Phi_{k}\\
z = M\Phi =  \sum_i M_i\phi_i\\
z_{k} = M\Phi_{k} =M\Lambda^{k}\Phi\\
z_{k+1} = M\Phi_{k+1} = M\Lambda\Phi_{k}=M\Lambda M^{-1}z_k = Az_k\\
y_{k} = CM\Phi_{k} =CM\Lambda^{k}\Phi\\
$$

よって
$$
[y_0\ y_1\ \ldots\ y_{N-1}] = CM\left([I\ \Lambda \ \Lambda^2\ \ldots\ \Lambda^{N-1}]\otimes\Phi\right)\\
=CM(V.*\Phi)\\
=(CM.*\Phi^T)V\\
$$
ここで$「.*」$ はMATLABの配列積である．$\Phi$にある時刻の状態を作用させることで$(CM.*\Phi^T)$は定数行列となり，これをモードベクトル$M_y$と呼ぶことにすると，モードベクトルは
$$M_y = [y_0\ y_1\ \ldots\ y_{N-1}]V^{-1}\tag{2}$$
と求まる．

ここでヴァンデルモンド行列$V$はAの固有値を並べたものであるので，一般性を失うことなく$A$を可観測正準形であるとできる．

<!--クープマンアプローチにおける観測量を$z\in \textrm{Mor}(\R^n,R^{\infty})$とする．-->
時刻$N$での出力は $y_N = CA^Nz$であり，$N$次で近似的にケーリー・ハミルトンの定理が成り立つとすると

$$
y_N = CA^Nz = C\left(\sum_{i=0}^{N-1}a_iA^i\right) z  = \sum_{i=0}^{N-1}a_i\left(CA^iz\right) =\sum_{i=0}^{N-1}a_iy_i
$$
となる．

実際はケーリー・ハミルトンの定理が成立するわけではないので，$r = y_N - \sum_{i=0}^{N-1}a_iy_i$ を最小化する$\{a_i\}$で近似することにする．このような$\bm{a}$は以下で求まる．

$$
\bm{a} = [y_0\ y_1\ \cdots \ y_{N-1}]^\dagger y_N \tag{3}
$$
ここで$(\cdot)^\dagger$は擬似逆行列を表す．

このように求まる$\bm{a}$を用いて可観測正準形$A_o$を(1)のように求めることができる．

以上をまとめると以下の手順でモードベクトルを求めることができる．

1. データから(3)で$\bm{a}$を求める．
2. (1)で$A_o$を求める．
3. $A_o$の固有値を使ってヴァンデルモンド行列$V$を作る
4. (2)でモードベクトル$M_y$を求める．
