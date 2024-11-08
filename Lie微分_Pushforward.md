Manifold : $M$, $N$

Differentiable map : $\phi$: $M \to N$

# Pushforward（押し込み）

$\def\d{{\rm d}}$

二つの多様体間の滑らかな写像によってベクトル場も写像されることを特徴づけるもの

Pushforward : $\d\phi: TM\to TN$

$M$上の点$x$は$\phi$によって$N$上の点$y$に写像される

$\phi : x \in M \mapsto y = \phi(x) \in N$

このとき、点$x$の接空間$T_xM$でのベクトル（場）$f$に対して自然に$T_yN$上のベクトル（場）を以下のように定義でき、それを$\d\phi\circ f$と表す。（$\phi_\ast f$とも）



# Pullback（引き戻し）

滑らかな多様体間の写像を使って値域上で定義された関数から定義域上の関数が自然に誘導されることを特徴づけたもの。

$h: N \to \mathbb R$

$\phi^\ast h = h\circ\phi : M \to \mathbb R$ 

# Lie derivative

ベクトル場に沿った多様体上の移動により引き起こされる変化を表すもの

$F$ : $M$上のベクトル場

$h$ : $M$上の関数

$\Phi_F^t$ : $F$のflow。$\Phi_F^t(x_0)$は$x_0$からベクトル場$F$に沿って$t$移動した先の点を表す。つまり$\dot{x}=F\circ x$の解

$h$ の$F$に沿ったLie微分$L_Fh$ は$\Phi_F^t$による$h$の変化率の$t\to 0$極限として定義される。つまり、

$L_Fh := \lim_{t\to 0}\frac{h(\Phi_F^t(x))-h(x)}{t} = \left.\frac{\d}{\d t}\right|_{t=0}h\circ\Phi_F^t$

連鎖律より直ちに

$L_Fh = \d h\cdot\frac{\d\Phi_F^t}{\d t} = \d h\cdot F$

$H$ : $M$上のベクトル場

接空間上の関数の場合、元の接空間と$\Phi_F^t$で移動した先の接空間が異なるため、そのまま差分をとっても意味がないため、$\Phi_F^t(x)$での接空間上の関数を$x$上の接空間にpushforwardする必要がある。つまり

$L_FH:=\lim_{t\to 0}\frac{\d\Phi_F^{\red{(-t)}}|_{\Phi_F^{t}(x)} H(\Phi_F^t(x))-H(x)}{t} = \left.\frac{\d}{\d t}\right|_{t=0}\d\Phi_F^{(-t)}H\circ\Phi_F^t$

pushforwardでは$x(0) = \Phi_F^{(-t)}(x(t))$に基づいている点に注意。

$L_FH = \frac{\partial \d\Phi_F^{(-t)}H}{\partial t}\circ\Phi_F^0 + \frac{\partial \d\Phi_F^{(-t)}H}{\partial x}\cdot F$

$\Phi_F^0(x) = x$ より、第1項は

$\frac{\partial \d\Phi_F^{(-t)}H}{\partial t} = \frac{\partial\d\Phi_F^{(-t)}}{\partial t}\cdot H + \d\Phi_F^{(-t)}\frac{\partial H}{\partial t}= \frac{\partial^2\Phi_F^{(-t)}}{\partial t\partial x}\cdot H= \frac{\partial}{\partial x}\frac{\partial \Phi_F^{(-t)}}{\partial t}\cdot H= \frac{\partial(-F)}{\partial x}\cdot H= -J_F\cdot H$

ここで二つ目の等式は$H$が時不変なベクトル場であることを用いた。

$\frac{\partial \d\Phi_F^{(-t)}H}{\partial x}\cdot F=\left(\d^2\Phi_F^{(-t)}\cdot H\right)\cdot F+\d\Phi_F^{(-t)} J_H\cdot F = J_H\cdot F$

ここで$\d\Phi_F^{0}=I,  \quad \d^2\Phi_F^{0}=0 $を用いた。

以上より

$L_FH = J_H\cdot F - J_ F\cdot H$

この演算は双線形性、歪対称性、ヤコビ恒等式を満たすことからLie bracketとなっており、$[F,H]$とも書く。