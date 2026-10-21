// ============================================================
//  数学分析入门（下册）· 习题  ——  公共模板
//  由 build.py / merge.py 拼接到正文文件之前
// ============================================================

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 1.8cm, x: 2.1cm),
  numbering: "1",
  number-align: center,
)

#set text(
  font: ("New Computer Modern Math", "Times New Roman", "SimSun"),
  size: 10.5pt,
  lang: "zh",
  region: "cn",
)

#set par(
  justify: true,
  first-line-indent: (amount: 2em, all: true),
  leading: 1.0em,
  spacing: 0.92em,
)

#set document(
  title: "数学分析入门（下册）· 习题汇编",
  author: "陆亚明",
)

#set heading(numbering: none)

// ---- 页眉 ---------------------------------------------------
#set page(header: context {
  set text(size: 8.5pt, fill: rgb("#6b7280"))
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    [数学分析入门（下册）],
    [习题汇编],
  )
  v(-0.55em)
  line(length: 100%, stroke: 0.4pt + rgb("#c9ced8"))
})

// ---- 过宽独立公式自动等比缩放到版心宽度 ---------------------
#show math.equation.where(block: true): it => layout(size => {
  let m = measure(it)
  if m.width > size.width {
    scale(x: size.width / m.width * 100%, y: 100%, origin: top + left, reflow: true, it)
  } else {
    it
  }
})

// ---- 章标题：居中 + 上下横线 --------------------------------
#show heading.where(level: 1): it => block(width: 100%, above: 0.4em, below: 1.3em)[
  #align(center)[
    #line(length: 100%, stroke: 1.1pt + rgb("#1f3864"))
    #v(0.55em)
    #text(size: 16.5pt, weight: "bold", fill: rgb("#1f3864"))[#it.body]
    #v(0.55em)
    #line(length: 100%, stroke: 1.1pt + rgb("#1f3864"))
  ]
]

// ---- 习题小节标题：居中、加宽字距、下方细线 -----------------
#show heading.where(level: 2): it => block(width: 100%, above: 1.35em, below: 0.85em)[
  #align(center)[
    #text(size: 13pt, weight: "bold", tracking: 0.18em, fill: rgb("#1f3864"))[#it.body]
    #v(0.3em)
    #line(length: 26%, stroke: 0.6pt + rgb("#1f3864"))
  ]
]

// ---- 列表辅助：小问用 (#sub) ---------------------------------
#let sub(n, body) = block(above: 0.15em, below: 0.15em, inset: (left: 1.9em))[
  #box(text(weight: "semibold")[（#n）]) #body
]

// ---- 插图 ---------------------------------------------------
#let bookfig(src, caption, width: 70%) = block(
  width: 100%, above: 0.8em, below: 0.8em, breakable: false,
)[
  #align(center)[
    #image(src, width: width)
    #v(0.3em)
    #text(size: 9pt)[#caption]
  ]
]



#pagebreak(weak: true)


= 第十二章 多元函数的极限


#v(0em)
== 习题 12.1

+ 设 $bold(x)_m = (x_1^((m)), dots.c, x_n^((m)))$，证明 ${bold(x)_m}$ 收敛于 $bold(a) = (a_1, dots.c, a_n)$ 当且仅当对任意的 $1 <= j <= n$ 有 $lim_(m -> oo) x_j^((m)) = a_j$.

+ 对下列集合 $E$，求 $E^o$，$partial E$ 以及 $overline(E)$：\
  （1）$E = {root(n, n) : n in ZZ_(>= 1)}$；\
  （2）$E = {(x, y) in RR^2 : 0 < y < x + 1}$；\
  （3）$E = {(x, y) in RR^2 : x y != 0}$；\
  （4）$E = {(x, y) in RR^2 : abs(x) + abs(y) < 1}$；\
  （5）$E = {(x, y) in RR^2 : x, y in QQ}$；\
  （6）$E = {(x, y) in RR^2 : 1 < x^2 + y^2 < 4}$.

+ 设 $A, B subset.eq RR^n$，证明：\
  （1）若 $A subset.eq B$，则 $A^o subset.eq B^o$ 且 $overline(A) subset.eq overline(B)$；\
  （2）$(A inter B)^o = A^o inter B^o$，$overline(A union B) = overline(A) union overline(B)$；\
  （3）$(A union B)^o supset.eq A^o union B^o$，$overline(A inter B) subset.eq overline(A) inter overline(B)$；\
  （4）举例说明（3）中的两个式子均未必有等号成立.

+ 设 $E subset.eq RR^n$，证明
  $ E^o = union_(G subset.eq E \ G "是开集") G, quad overline(E) = inter_(F subset.eq E \ F "是闭集") F. $

  因此 $E^o$ 是包含于 $E$ 的最大开集；$overline(E)$ 是包含 $E$ 的最小闭集.

+ 设 $G_1, G_2$ 是 $RR^n$ 中的两个不相交的开集，证明 $G_1 inter overline(G_2) = emptyset$.

+ 设 $bold(a) = (a_1, dots.c, a_n) in RR^n$，$bold(b) = (b_1, dots.c, b_m) in RR^m$，记
  $ (bold(a), bold(b)) = (a_1, dots.c, a_n, b_1, dots.c, b_m) in RR^(m+n). $

  若 $G$ 是包含 $(bold(a), bold(b))$ 的开集，证明必存在 $RR^n$ 中包含 $bold(a)$ 的开集 $G_1$ 和 $RR^m$ 中包含 $bold(b)$ 的开集 $G_2$ 使得 $G_1 times G_2 subset.eq G$.

+ 设 $E subset.eq RR^n$ 且 $E$ 中每个点均是孤立点. 证明存在开集 $G$ 和闭集 $F$ 使得 $E = G inter F$.

+ 设 $E, F subset.eq RR^n$，证明 $partial(E union F)$，$partial(E inter F)$ 以及 $partial(E without F)$ 的边界均是 $partial E union partial F$ 的子集.

+ 设 $E subset.eq RR^n$，证明 $partial E$ 是 $RR^n$ 中的闭集.

+ 设 $E subset.eq RR^n$，证明 $partial E = emptyset$ 的充要条件是 $E = emptyset$ 或 $E = RR^n$.

+ 设 $E$ 是 $RR^n$ 的一个既开且闭的子集，证明 $E = emptyset$ 或 $E = RR^n$.

+ 设 $E = B(bold(a), r)$，证明 $op("diam") (E) = 2r$.

+ 证明定理 1.21.

+ 对 $RR^n$ 的任意两个非空子集 $A$ 和 $B$，记
  $ d(A, B) = inf_(x in A, y in B) abs(bold(x) - bold(y)). $

  #v(0.3em)（1）设 $A$ 是紧集，$B$ 是闭集且 $A inter B = emptyset$，证明 $d(A, B) > 0$；\
  （2）若 $A$ 与 $B$ 均是闭集且 $A inter B = emptyset$，是否一定有 $d(A, B) > 0$？

+ 沿用上题记号，并当 $A = {bold(x)}$ 时将 $d(A, B)$ 简记为 $d(bold(x), B)$. 证明：对任意的 $E subset.eq RR^n$ 有
  $ overline(E) = {bold(x) in RR^n : d(bold(x), E) = 0}. $

+ 设 $F subset.eq RR^n$，$F != emptyset$，$r$ 是一个正常数，证明 ${bold(x) in RR^n : d(bold(x), F) < r}$ 是开集.

+ 证明 $RR^n$ 中每个闭集均可表为可数个开集的交，每个开集均可表为可数个闭集的并.

+ 设 $A, B$ 是 $RR^n$ 中的两个闭集且 $A inter B = emptyset$，证明存在开集 $G_1$ 和 $G_2$ 满足 $A subset.eq G_1$，$B subset.eq G_2$ 且 $G_1 inter G_2 = emptyset$.

+ 设 $F$ 是 $RR^n$ 中的闭集，$G$ 是 $RR^n$ 中的开集且 $F subset.eq G$. 证明存在开集 $G_1$ 满足
  $ F subset.eq G_1 subset.eq overline(G_1) subset.eq G. $

+ 假设 $(F_lambda)_(lambda in L)$ 是 $RR^n$ 中的一族闭集，其中至少有一个 $F_lambda$ 是有界集，并且 $inter_(lambda in L) F_lambda = emptyset$. 证明：存在 $lambda_1, dots.c, lambda_m in L$ 使得 $inter_(1 <= j <= m) F_(lambda_j) = emptyset$.

+ （闭集套定理）设 $(F_j)_(j in ZZ_(> 0))$ 是 $RR^n$ 中的一族非空有界闭集，满足\
  （1）对任意的正整数 $j$ 有 $F_j supset.eq F_(j+1)$；\
  （2）$lim_(j -> oo) op("diam") (F_j) = 0$，\
  证明存在唯一的 $bold(a) in RR^n$ 使得 $inter_(j=1)^(oo) F_j = {bold(a)}$.

+ （贝尔 (Baire)）对于 $RR^n$ 的子集 $E$，若 $(overline(E))^o = emptyset$，则称 $E$ 是疏集或无处稠密集 (nowhere dense set). 证明：$RR^n$ 不能写成至多可数个疏集的并.

+ 设 $E$ 是 $RR^n$ 的一个不可数的子集. 证明存在 $E$ 的聚点 $bold(a)$，使得 $bold(a)$ 的任一邻域与 $E$ 的交集均是不可数集.

+ 对 $RR^n$ 的两个非空子集 $A$ 和 $B$，记 $A + B = {bold(a) + bold(b) : bold(a) in A, bold(b) in B}$. 证明：\
  （1）若 $A$ 是开集，则 $A + B$ 也是开集；\
  （2）若 $A$ 是紧集，$B$ 是闭集，则 $A + B$ 是闭集；\
  （3）举例说明 $A$ 与 $B$ 均是闭集并不能保证 $A + B$ 是闭集.

+ 设 $E subset.eq RR^n$，证明以下命题等价：\
  （1）$E$ 是连通集；\
  （2）不存在 $E$ 的非空真子集 $A$，使得它既是 $E$ 的开子集又是 $E$ 的闭子集；\
  （3）不存在 $E$ 的两个非空闭子集 $A$ 和 $B$ 使得 $A union B = E$ 且 $A inter B = emptyset$；\
  （4）不存在 $E$ 的两个非空子集 $A$ 和 $B$ 使得 $A union B = E$ 且 $A inter overline(B) = overline(A) inter B = emptyset$.

+ 设 $E, F$ 均是 $RR^n$ 中的连通集且 $overline(E) inter F != emptyset$，证明 $E union F$ 也是 $RR^n$ 中的连通集.

+ 设 $(E_lambda)_(lambda in L)$ 是 $RR^n$ 中的一族连通集，并且 $inter_(lambda in L) E_lambda != emptyset$，证明 $union_(lambda in L) E_lambda$ 也是连通集.

+ 证明 $RR$ 中的每个开集均可表为至多可数个互不相交的开区间的并.

  设 $E$ 是一个非空集合，如果存在映射 $d: E^2 -> RR$ 满足\
  （1）对任意的 $x, y in E$ 均有 $d(x, y) >= 0$，并且 $d(x, y) = 0$ 当且仅当 $x = y$；\
  （2）对任意的 $x, y in E$ 均有 $d(x, y) = d(y, x)$；\
  （3）(三角形不等式) 对任意的 $x, y, z in E$ 有 $d(x, z) <= d(x, y) + d(y, z)$，\
  则称 $E$ 是一个距离空间 (metric space)，称 $d$ 为 $E$ 上的距离 (distance). 从第 29 题到第 36 题是一组题，介绍距离空间的一些例子.

+ 设 $E$ 是一个非空集合，对任意的 $x, y in E$，定义
  $ d(x, y) = cases(0"," & quad x = y, 1"," & quad x != y). $

  证明 $d$ 是 $E$ 上的距离. 拥有这一距离的集合 $E$ 被称为离散距离空间 (discrete metric space).

+ 设 $E$ 是以 $d$ 为距离的距离空间，对任意的 $x, y in E$，定义
  $ d_1 (x, y) = (d(x, y)) / (1 + d(x, y)). $

  证明 $d_1$ 也是 $E$ 上的一个距离.

+ 对 $RR^2$ 中的任意两个元素 $bold(x) = (x_1, x_2)$ 和 $bold(y) = (y_1, y_2)$，定义
  $ d(bold(x), bold(y)) = max (abs(x_1 - y_1), abs(x_2 - y_2)), $

  证明 $d$ 是 $RR^2$ 上的距离.

+ 设 $E$ 是定义在有界闭区间 $[a, b]$ 上的全体有界函数所成之集，对任意的 $f, g in E$，定义
  $ d(f, g) = sup_(x in [a, b]) abs(f(x) - g(x)). $

  证明 $d$ 是 $E$ 上的距离.

+ 设 $E$ 是定义在有界闭区间 $[a, b]$ 上的全体连续函数所成之集，对任意的 $f, g in E$，定义
  $ d(f, g) = integral_a^b abs(f(x) - g(x)) dif x. $

  证明 $d$ 是 $E$ 上的距离.

+ 设 $p$ 是一个素数，对任一非零整数 $a$，定义 $v_p (a)$ 为使得 $p^k$ 整除 $a$ 的最大的 $k$，即 $v_p (a) = max {k in ZZ_(>= 0) : p^k divides a}$. 进一步，对非零有理数 $x = a/b$（$a$ 和 $b$ 均为整数），定义 $v_p (x) = v_p (a) - v_p (b)$. 现对 $x in QQ$ 记
  $ abs(x)_p = cases(p^(-v_p (x))"," & quad x != 0, 0"," & quad x = 0). $

  证明：$d(x, y) = abs(x - y)_p$ 为 $QQ$ 上的一个距离.

+ 集合 $E$ 上的距离 $d$ 被称为是非阿基米德的 (non-Archimedean)，是指对任意的 $x, y, z in E$，均有
  $ d(x, z) <= max (d(x, y), d(y, z)). $

  否则，就称该距离是阿基米德的. 试讨论习题 31—34 中的距离是否是阿基米德的.

+ 设 $E$ 是一个被赋予了距离 $d$ 的距离空间，对任意的 $bold(a) in E$ 及 $r > 0$，我们称 $B(bold(a), r) = {x in E : d(x, bold(a)) < r}$ 为以 $bold(a)$ 为圆心，以 $r$ 为半径的圆. 证明：如果 $d$ 是非阿基米德距离，那么圆内每个点均是该圆的圆心.


#pagebreak(weak: true)


#v(0em)
== 习题 12.2

+ 用精确的数学语言表述：\
  （1）$lim_(x -> a^+, y -> b^-) f(x, y) = A$；\
  （2）$lim_(x -> a, y -> +oo) f(x, y) = A$；\
  （3）$lim_(x -> oo, y -> b) f(x, y) = -oo$；\
  （4）$lim_(x -> +oo, y -> -oo) f(x, y) = +oo$；\
  （5）$lim_(x -> a, y -> b) f(x, y) != A$；\
  （6）$lim_(x -> oo, y -> oo) f(x, y) != oo$.

+ 设 $f$ 在 $RR$ 上有定义且在任意有界闭区间上可积，证明 $integral_(-oo)^(+oo) f(x) dif x$ 收敛的充要条件是极限

  $ lim_(A -> -oo, B -> +oo) integral_(A)^(B) f(x) dif x $

  存在.

+ 判断下列二重极限是否存在，如果存在，计算其值：\
  （1）$display(lim_(x -> 0, y -> 0) (x^3 y^2)/(x^4 + y^4))$；\
  #v(0.6em)（2）$display(lim_(x -> +oo, y -> +oo) (x + y)/sqrt(x^2 - x y + y^2))$；\
  #v(0.6em)（3）$display(lim_(x -> 0, y -> 0) (x^3 + y^3)/(x^2 + y^2))$；\
  #v(0.6em)（4）$display(lim_(x -> +oo, y -> +oo) (x^2 + y^2) e^(-(x + y)))$；\
  #v(0.9em)（5）$display(lim_(x -> +oo, y -> +oo) ((x y)/(x^2 + y^2))^(x^2))$；\
  #v(0.6em)（6）$display(lim_(x -> 0^+, y -> 0^+) (e^(x y) - 1)/(x + sin y))$；\
  #v(0.6em)（7）$display(lim_(x -> 0^+, y -> 0^+) x^y)$.

+ 证明下列二元函数的两个累次极限 $lim_(y -> 0) lim_(x -> 0) f(x, y)$ 与 $lim_(x -> 0) lim_(y -> 0) f(x, y)$ 均存在且相等，但二重极限 $lim_(x -> 0, y -> 0) f(x, y)$ 不存在：\
  （1）$f(x, y) = display(log(1 + x y)/(x^2 + y^2 cos y))$；\
  #v(0.6em)（2）$f(x, y) = display((x^2 y^2)/(x^2 y^2 + (x - y)^2))$.

假设 $(a_((m,n)))_((m,n) in ZZ_(>0)^2)$ 是 $RR$ 的以 $ZZ_(>0)^2$ 为指标集的一个元素族，为方便起见我们把它记作 $(a_(m,n))$. 现对任意的正整数 $M, N$ 记

$ S_(M,N) = sum_(m=1)^M sum_(n=1)^N a_(m,n), $

若二重极限 $lim_(M -> oo, N -> oo) S_(M,N)$ 存在，则称二重级数 $sum_(m,n=1)^(+oo) a_(m,n)$ 收敛，并将这一极限值称为该二重级数的和；如果二重极限 $lim_(M -> oo, N -> oo) S_(M,N)$ 不存在，则称二重级数 $sum_(m,n=1)^(+oo) a_(m,n)$ 发散. 从第 5 题到第 12 题是一组题，介绍二重级数的一些性质和例子.

#set enum(numbering: n => numbering("1.", n + 4))

+ 设二重级数 $sum_(m,n=1)^(+oo) a_(m,n)$ 收敛，且对任意给定的正整数 $m$，级数 $sum_(n=1)^(+oo) a_(m,n)$ 均收敛，证明级数

  $ sum_(m=1)^(+oo) sum_(n=1)^(+oo) a_(m,n) $

  收敛，且有

  $ sum_(m=1)^(+oo) sum_(n=1)^(+oo) a_(m,n) = sum_(m,n=1)^(+oo) a_(m,n). $

+ 设 $a_(m,n) >= 0$（$forall m, n >= 1$），证明：当三个级数 $sum_(m,n=1)^(+oo) a_(m,n)$，$sum_(m=1)^(+oo) sum_(n=1)^(+oo) a_(m,n)$ 与 $sum_(n=1)^(+oo) sum_(m=1)^(+oo) a_(m,n)$ 中有一个收敛时，其余两个也收敛，且三者有相同的和.

+ （比较判别法）设 $0 <= a_(m,n) <= b_(m,n)$（$forall m, n >= 1$）且 $sum_(m,n=1)^(+oo) b_(m,n)$ 收敛，证明 $sum_(m,n=1)^(+oo) a_(m,n)$ 收敛.

+ 设 $sum_(m,n=1)^(+oo) abs(a_(m,n))$ 收敛，证明 $sum_(m,n=1)^(+oo) a_(m,n)$ 收敛.

+ 设 $sum_(m,n=1)^(+oo) abs(a_(m,n))$ 收敛，那么将 $a_(m,n)$（$m, n >= 1$）按任意方式排成一列所建立的级数都绝对收敛，且所有的级数的和均等于 $sum_(m,n=1)^(+oo) a_(m,n)$.

+ （哥德巴赫（Goldbach））设 ${u_k}$ 是将集合 ${m^n : m, n in ZZ_(>1)}$ 中的元素排成一列所得的数列，证明

  $ sum_(k=1)^(+oo) 1/(u_k - 1) = 1. $

+ 判断二重级数 $sum_(m,n=1)^(+oo) 1/((m + n^2)^alpha)$ 的敛散性.

+ 设 $Q(x, y) = a x^2 + 2 b x y + c y^2$ 是一个实系数的正定二元二次型，证明级数

  $ sum_(#stack(dir: ttb, $m,n=0$, $(m,n) != (0,0)$))^(+oo) 1/(Q(m,n)^s) $

  收敛当且仅当 $s > 1$. 当 $s > 1$ 时我们把上述级数的和记作 $zeta_Q (s)$，并称之为关于 $Q$ 的爱普斯坦（Epstein）$zeta$ 函数.

#set enum(numbering: "1.")


#pagebreak(weak: true)


#v(0em)
== 习题 12.3

+ 证明命题 3.5.

+ 证明推论 3.7.

+ 利用波尔查诺－魏尔斯特拉斯定理证明定理 3.14.

+ 计算下列二重极限：\
  （1）$display(lim_(x -> 1, y -> 0) log(x + e^y)/sqrt(x^2 + y^2))$；\
  #v(0.6em)（2）$display(lim_(x -> +oo, y -> 2) (1 + 1/(3x))^(x^2/(x + y)))$；\
  #v(0.6em)（3）$display(lim_(x -> 0, y -> 0) (x^2 + y^2)^(x^2 y^2))$.

+ 证明 $f : (bold(a), bold(x)) |-> bold(a) bold(x)$ 是从 $RR times RR^n$ 到 $RR^n$ 的连续映射.

+ 设 $A$ 是一个 $n times n$ 矩阵，证明：对任意的 $bold(x), bold(y) in RR^n$ 有 $abs(bold(x)^upright(T) A bold(y)) = O(abs(bold(x)) dot abs(bold(y)))$.

+ 设 $A$ 是一个 $n times n$ 矩阵，证明由 $phi(bold(x)) = bold(x)^upright(T) A bold(x)$ 所定义的映射 $phi : RR^n -> RR$ 是连续的.

+ 设 $phi in C^1((a, b))$. 对任意的 $x, y in (a, b)$，$x != y$，定义

  $ f(x, y) = (phi(x) - phi(y))/(x - y). $

  问能否对 $x in (a, b)$ 定义 $f(x, x)$ 的值使得 $f$ 在 $(a, b)^2$ 上连续？

+ 设 $L : RR^n -> RR^n$ 是非奇异的线性映射，证明 $L$ 将 $RR^n$ 中的开集映为开集，将 $RR^n$ 中的闭集映为闭集.

+ 举例说明一般的连续映射未必把开集映为开集.

+ 设 $E subset.eq RR^n$，$f$ 与 $g$ 均是从 $E$ 到 $RR^m$ 的连续映射，证明集合

  $ {bold(x) in E : f(bold(x)) = g(bold(x))} $

  是 $E$ 的闭子集.

+ 设 $f$ 与 $g$ 是从 $RR^n$ 到 $RR^m$ 的两个连续映射，$E$ 是 $RR^n$ 的一个稠密子集，并且对任意的 $bold(x) in E$ 有 $f(bold(x)) = g(bold(x))$. 证明 $f = g$.

+ 设 $E subset.eq RR^n$，$f : E -> RR$. 对任意的 $bold(a) in E$ 记

  $ omega(f; bold(a)) = inf_(delta > 0) ( sup_(bold(x) in upright(B)(bold(a), delta) inter E) f(bold(x)) - inf_(bold(x) in upright(B)(bold(a), delta) inter E) f(bold(x)) ), $

  并称之为 $f$ 在 $bold(a)$ 处的振幅. 证明 $f$ 在 $bold(a)$ 处连续的充要条件是 $omega(f; bold(a)) = 0$.

+ 设 $E subset.eq RR^n$，$f : E -> RR^m$. 证明 $f$ 在 $E$ 上连续的充要条件是：对任意的 $A subset.eq RR^m$ 有 $overline(f^(-1)(A)) inter E subset.eq f^(-1)(overline(A))$.

+ 设 $E$ 是 $RR^n$ 中的开集且 $f : E -> RR^m$. 证明 $f$ 在 $E$ 上连续的充要条件是：对任意的 $A subset.eq RR^m$ 有 $f^(-1)(A^circle) subset.eq (f^(-1)(A))^circle$.

+ 设 $K$ 是 $RR^n$ 中的非空紧集，$f : K -> K$ 满足

  $ abs(f(bold(x)) - f(bold(y))) < abs(bold(x) - bold(y)), quad forall bold(x), bold(y) in K, bold(x) != bold(y). $

  证明存在唯一的 $bold(a) in K$ 使得 $f(bold(a)) = bold(a)$.

+ 设

  $ E_1 = {(x, y) : x in [0, 1] inter QQ, y in [0, 1]}, $

  $ E_2 = {(x, y) : x in [0, 1] without QQ, y in [-1, 0]}. $

  证明 $E_1 union E_2$ 是 $RR^2$ 中的连通集.

+ 设 $E$ 是 $RR^n$ 中的凸集，证明 $overline(E)$ 也是 $RR^n$ 中的凸集.

+ 设 $A$ 是 $RR^n$ 的一个给定的非空子集. 对任意的 $bold(x) in RR^n$ 记 $f(bold(x)) = inf_(bold(a) in A) abs(bold(x) - bold(a))$. 证明 $f(bold(x))$ 是 $RR^n$ 上的一致连续函数.

+ 判断下列函数 $f$ 在指定集合 $E$ 上是否一致连续：\
  （1）$f(x, y) = sqrt(x^2 + y^2)$，$E = RR^2$. \
  （2）$f(x, y) = cos(x y)$，$E = RR^2$. \
  #v(0.6em)（3）$f(x, y) = sin(display(pi/(1 - x^2 - y^2)))$，$E = upright(B)(bold(0), 1)$. \
  （4）$f(x, y) = x^y$，$E = (0, 1)^2$.

+ 假设 $f : RR^n -> RR^m$ 在 $RR^n$ 上一致连续，证明对任意的 $bold(x) in RR^n without upright(B)(bold(0), 1)$ 有 $abs(f(bold(x))) = O(abs(bold(x)))$.

+ 设 $f$ 是从 $QQ^n$ 到 $RR^m$ 的一致连续映射，证明 $f$ 可被延拓为从 $RR^n$ 到 $RR^m$ 的一致连续映射.


#pagebreak(weak: true)


= 第十三章 多元函数的微分


#v(0em)
== 习题 13.1

+ 利用定义证明函数 $f(x, y) = abs(x + y)$ 在 $bold(0)$ 处不可微.

+ 利用定义证明函数 $f(x, y) = abs(x y)$ 在 $bold(0)$ 处可微.

+ 设 $A$ 是一个 $n times n$ 矩阵. 对任意的 $x in RR^n$，令 $f(x) = x^T A x$. 证明 $f$ 在 $RR^n$ 上可微并求 $f'(x)$.

+ 设 $E subset.eq RR^n$，$f: E -> RR^m$ 与 $g: E -> RR^m$ 均可微，证明 $h(x) = chevron.l f(x), g(x) chevron.r$ 也在 $E$ 上可微且对任意的 $x in E$ 有
  $ h'(x) = f(x)^T g'(x) + g(x)^T f'(x), $
  这里 $chevron.l , chevron.r$ 表示向量的内积.

+ 设 $f: RR -> RR^m$ 可微，且对任意的 $x in RR$ 有 $abs(f(x)) = 1$. 证明：对任意的 $x in RR$ 有 $chevron.l f(x), f'(x) chevron.r = 0$.

+ 设 $f: RR^n -> RR^n$ 连续可微，且对任意的 $x in RR^n$ 而言 $f'(x)$ 均非奇异. 又假设存在 $b in.not f(RR^n)$，并记 $phi(x) = abs(f(x) - b)^2$，证明：$phi'(x) != 0$ $(forall x in RR^n)$.


#pagebreak(weak: true)


#v(0em)
== 习题 13.2

+ 对下列函数 $f$ 计算其在指定点 $bold(a)$ 处沿指定方向 $bold(u)$ 的方向导数：\
  （1）$f(x, y) = x^2 + y^2$，$bold(a) = (1, 1)^T$，$bold(u) = (1, -2)^T$；\
  （2）$f(x, y) = x + log(y + 1)$，$bold(a) = (0, 0)^T$，$bold(u) = (1, 1)^T$；\
  （3）$f(x, y, z) = e^(x + y + z^2)$，$bold(a) = (1, 0, 0)^T$，$bold(u) = (0, 0, 1)^T$；\
  （4）$f(x, y, z) = (x + y^2)/z$，$bold(a) = (1, 1, 1)^T$，$bold(u) = (1, 0, 1)^T$.

+ 对于下列函数 $f(x, y)$，试求所有的 $bold(u)$（$abs(bold(u)) = 1$），使得 $f$ 在 $(0, 0)^T$ 点沿方向 $bold(u)$ 的方向导数存在：\
  （1）$f(x, y) = cases(x + y quad & x y = 0, 1 & x y != 0)$；\
  #v(0.7em)（2）$f(x, y) = sqrt(abs(x^2 - y^2))$.

+ 证明函数 $f(x_1, dots.c, x_n) = abs(x_1) + dots.c + abs(x_n)$ 在 $bold(0)$ 处沿任何方向的方向导数均不存在.

+ 对下列映射 $f$ 计算其雅可比矩阵：\
  （1）$f(x, y) = x^2 log y + x y + 2$；\
  （2）$f(x, y) = (x - y)/(x^2 + y^2 + 1)$；\
  （3）$f(x, y) = (x + y, x y)^T$；\
  （4）$f(r, theta) = (r cos theta, r sin theta)^T$；\
  （5）$f(x, y) = (y sin x, x cos y)^T$；\
  （6）$f(x, y, z) = (e^(x + z) + 1, z^2 arctan y)^T$；\
  （7）$f(r, theta, z) = (r cos theta, r sin theta, z)^T$；\
  （8）$f(r, phi, theta) = (r sin phi cos theta, r sin phi sin theta, r cos phi)^T$.

+ 对下列函数 $f$ 计算其各二阶偏导数：\
  （1）$f(x, y) = x y + y/x$；\
  （2）$f(x, y) = arctan(y/x)$；\
  （3）$f(x, y) = log(x^2 + y^2)$；\
  （4）$f(x, y) = x^y$.

+ 设 $f$ 是 $C^2$ 类的，计算下列偏导数：\
  （1）$u = f(x^2 + y^2)$，计算 $(partial u)/(partial x)$，$(partial^2 u)/(partial x^2)$ 及 $(partial^2 u)/(partial x partial y)$；\
  （2）$u = f(e^x log y)$，计算 $(partial u)/(partial y)$ 与 $(partial^2 u)/(partial x partial y)$；\
  （3）$u = f(x, x/y)$，计算 $(partial^2 u)/(partial x^2)$ 与 $(partial^2 u)/(partial y^2)$.

+ 设 $f(x, y) = e^x sin y$，对正整数 $m, n$ 计算 $(partial^(m + n) f)/(partial x^m partial y^n)$.

+ 设 $f(x, y, z) = 1/sqrt(x^2 + y^2 + z^2)$，证明在 $RR^3 without {bold(0)}$ 上有

  $ (partial^2 f)/(partial x^2) + (partial^2 f)/(partial y^2) + (partial^2 f)/(partial z^2) = 0. $

+ 设 $a, b$ 为常数，$a != 0$，令 $f(x, t) = 1/(2 a sqrt(pi t)) e^(-frac((x - b)^2, 4 a^2 t))$，证明在 $RR times RR_(> 0)$ 上有

  $ (partial f)/(partial t) = a^2 (partial^2 f)/(partial x^2). $

+ 设 $phi$ 与 $psi$ 均二阶可导，$z = phi(y/x) + x psi(y/x)$，证明

  $ x^2 (partial^2 z)/(partial x^2) + 2 x y (partial^2 z)/(partial x partial y) + y^2 (partial^2 z)/(partial y^2) = 0. $

+ （欧拉 (Euler)）假设 $E subset.eq RR^n$，且对任意的 $x in E$ 及 $t > 0$ 有 $t x in E$. 若函数 $f: E -> RR$ 满足

  $ f(t x) = t^alpha f(x), quad forall x in E, t > 0, $

  其中 $alpha$ 是一个给定的实数，则称 $f$ 是 $E$ 上的一个 $underline(alpha " 次齐次函数")$. 对 $E$ 上可微的 $alpha$ 次齐次函数 $f$ 证明

  $ sum_(j=1)^n x_j dot (partial f)/(partial x_j)(x) = alpha f(x), quad forall x = (x_1, dots.c, x_n) in E. quad (13.11) $

+ 设 $E subset.eq RR^n$，且对任意的 $x in E$ 及 $t > 0$ 有 $t x in E$. 又设 $f: E -> RR$ 可微且满足 (13.11). 证明 $f$ 是 $E$ 上的 $alpha$ 次齐次函数.

+ 设 $E subset.eq RR^n$，$f$ 与 $g$ 均是定义在 $E$ 上的可微函数，证明在 $E$ 上有

  $ "grad" f g = f dot "grad" g + g dot "grad" f. $

+ 研究函数 $f(x, y) = sqrt(abs(x y))$ 在点 $(0, 0)^T$ 处的可微性.

+ 研究函数

  $ f(x, y) = cases(x y cos 1/(x^2 + y^2) quad & x^2 + y^2 != 0, 0 & x^2 + y^2 = 0) $

  在点 $(0, 0)^T$ 处的可微性.

+ 设 $g(x, y)$ 在 $(0, 0)^T$ 的某邻域内连续，证明：$f(x, y) = abs(x - y) dot g(x, y)$ 在点 $(0, 0)^T$ 处可微的充要条件是 $g(0, 0) = 0$.

+ 设 $f: RR -> RR^2$ 满足 $f(x) = (x^2, x^3)^T$，证明 $f$ 在 $RR$ 上可微，但不存在 $xi in [0, 1]$，使得 $f(1) - f(0) = f'(xi)$.

+ 设

  $ f(x, y) = cases((x^2 + y^2) sin 1/sqrt(x^2 + y^2) quad & (x, y) != (0, 0), 0 & (x, y) = (0, 0).) $

  证明 $f$ 在点 $(0, 0)^T$ 处可微，但是 $(partial f)/(partial x)$ 与 $(partial f)/(partial y)$ 均在点 $(0, 0)^T$ 处不连续.

+ 设 $E subset.eq RR^n$，$f: E -> RR^m$，$bold(a)$ 是 $E$ 的一个内点. 又设存在 $bold(a)$ 的邻域 $U subset.eq E$，使得 $f$ 在 $U$ 上存在各偏导数，且这些偏导数在 $U$ 上有界. 证明 $f$ 在点 $bold(a)$ 处连续.

+ 证明例 2.14 中的函数 $f(x, y)$ 在 $RR^2$ 上连续可微，因此这个例子说明连续可微且各二阶偏导存在的函数其两个二阶偏导 $(partial^2 f)/(partial x partial y)$ 与 $(partial^2 f)/(partial y partial x)$ 未必相等.

+ 假设定义在 $RR^2$ 上的函数 $f(x, y)$ 满足\
  （1）$(partial^2 f)/(partial y partial x)$ 存在且在 $(x_0, y_0)^T$ 处连续；\
  #v(0.7em)（2）对任意的 $x$，$(partial f)/(partial y)(x, y_0)$ 均存在.

  证明 $(partial^2 f)/(partial x partial y)(x_0, y_0)$ 存在并且等于 $(partial^2 f)/(partial y partial x)(x_0, y_0)$.

+ 设 $f$ 是定义在区域 $D$ 上的可微函数，且在 $D$ 的每一点处 $f$ 的各偏导均等于 0，证明 $f$ 是 $D$ 上的常值函数.

+ 记 $D = RR^2 without (RR_(>= 0) times {0})$，并考虑定义在 $D$ 上的函数

  $ f(x, y) = cases(x^3 quad & x > 0 " 且 " y > 0, 0 & "其他的" (x, y) in D.) $

  证明 $f$ 在 $D$ 上连续可微，且在 $D$ 上有 $(partial f)/(partial y) = 0$，但是 $f$ 并非是一个取值与变量 $y$ 无关的函数. 注意将本题与上题做比较.

+ 设 $D$ 是 $RR^n$ 中的区域，$f: D -> RR^m$ 在 $D$ 上可微. 若 $f'$ 是常值映射，证明存在 $L in cal(L) (RR^n, RR^m)$ 及 $bold(a) in RR^m$ 使得对任意的 $x in D$ 有 $f(x) = L x + bold(a)$.

+ 设 $L in cal(L) (RR^n, RR^m)$，我们称

  $ norm(L) = sup_(abs(h) = 1) abs(L h) $

  为 $L$ 的范数. 证明：\
  （1）对任意的 $x in RR^n$ 有 $abs(L x) <= norm(L) dot abs(x)$；\
  （2）对任意的 $lambda in RR$，$norm(lambda L) = abs(lambda) dot norm(L)$. 特别地，$norm(-L) = norm(L)$；\
  （3）对任意的 $L_1, L_2 in cal(L) (RR^n, RR^m)$ 有 $norm(L_1 + L_2) <= norm(L_1) + norm(L_2)$；\
  （4）对任意的 $L_1 in cal(L) (RR^n, RR^m)$ 及 $L_2 in cal(L) (RR^m, RR^ell)$ 有

  $ norm(L_2 compose L_1) <= norm(L_2) dot norm(L_1). $

+ 设 $E$ 是 $RR^n$ 中的开集，$f: E -> RR^m$ 在 $E$ 上可微. 证明 $f$ 在 $E$ 上连续可微的充要条件是：对任意的 $bold(a) in E$ 及任意的 $epsilon > 0$，存在 $delta > 0$，使得对于满足 $abs(x - bold(a)) < delta$ 的任意的 $x in E$ 均有

  $ norm(f'(x) - f'(bold(a))) < epsilon. $


#pagebreak(weak: true)


#v(0em)
== 习题 13.3

+ 设 $E$ 是 $RR^n$ 中的凸开集，$f: E -> E$ 可微，且存在 $theta in (0, 1)$ 使得对任意的 $x in E$ 均有 $norm(f'(x)) <= theta$. 证明：对任意的 $x_0 in E$，由 $x_(k+1) = f(x_k)$ $(forall k >= 0)$ 所定义的序列 ${x_k}$ 收敛.

+ 设 $bold(a) in RR^n$，$f$ 是从 $bold(a)$ 的邻域 $U$ 到 $RR^m$ 的连续映射且在 $U without {bold(a)}$ 上可微. 又设存在 $L in cal(L)(RR^n, RR^m)$，使得对任意的 $epsilon > 0$，存在 $delta > 0$ 满足
  $ norm(f'(x) - L) < epsilon, quad forall x in B(bold(a), delta) without {bold(a)}. $
  证明 $f$ 在 $bold(a)$ 处可微且 $f'(bold(a)) = L$.

+ （泰勒公式的唯一性）设 $E$ 是 $RR^n$ 中的凸开集，$f$ 是定义在 $E$ 上的函数且 $f in C^r (E)$. 又设 $bold(a) in E$，且当 $bold(h) -> bold(0)$ 时有
  $ f(bold(a) + bold(h)) = f(bold(a)) + sum_(1 <= abs(bold(alpha)) <= r) A_alpha bold(h)^bold(alpha) + o(norm(bold(h))^r). $
  证明对任意的 $bold(alpha)$ 有 $display(A_bold(alpha) = 1/(bold(alpha)!) (partial^bold(alpha) f)/(partial x^bold(alpha)) (bold(a)))$.

+ 设 $f(x, y) = g(x) h(y)$，其中 $g in C^r ((a, b))$，$h in C^r ((c, d))$. 证明：对任意的 $x_0 in (a, b) times (c, d)$，$f$ 在 $x_0$ 处直至第 $r$ 次的带佩亚诺余项的泰勒公式可由 $g(x)$ 和 $h(y)$ 各自的带佩亚诺余项的泰勒公式相乘得到.

+ 写出下列函数带佩亚诺余项的麦克劳林公式：\
  （1）$sin(x^2 + y^2)$;\
  （2）$sqrt(1 + x + y)$;\
  （3）$e^x sin y$;\
  （4）$log(1 + x) log(1 + y)$.

+ 求下列函数 $f$ 在指定点 $bold(a)$ 处的泰勒多项式的前三项：\
  （1）$f(x, y) = x^alpha y^beta$，$bold(a) = (1, 1)$;\
  （2）$f(x, y) = 1/(1 + sin x - y)$，$bold(a) = (pi/2, 0)$;\
  （3）$f(x, y, z) = cos(x + 2 y + 3 z)$，$bold(a) = (1, -2, 1)$;\
  （4）$f(x, y, z) = (log(y + z^2))/(1 + x)$，$bold(a) = (0, 1, 0)$.

+ 证明：当 $abs(x)$ 和 $abs(y)$ 充分小时有
  $ arctan (1 + x + y)/(1 - x + y) approx pi/4 + x - x y. $

+ 计算下列二重极限：\
  （1）$display(lim_(#stack(dir: ttb, spacing: 0.1em, [$x -> 0$], [$y -> 0$])) ((1 + x)^y - 1)/(sin x y))$;\
  #v(1.1em)（2）$display(lim_(#stack(dir: ttb, spacing: 0.1em, [$x -> 0^+$], [$y -> 0^+$])) (e^x sin y - y)/sqrt(x^2 + x y + y^2))$.


#pagebreak(weak: true)


#v(0em)
== 习题 13.4

+ 设 $f: (u, v) |-> (x, y)$ 由
  $ cases(x = u + v, y = display(u/v)) $
  所定义，问 $f$ 在哪些点的附近存在反函数？并求相应的反函数的雅可比矩阵.

+ 设 $f: (rho, phi, theta) |-> (x, y, z)$ 由
  $ cases(x = rho sin phi cos theta, y = rho sin phi sin theta, z = rho cos phi) $
  所定义，问 $f$ 在哪些点的附近存在反函数？并求相应的反函数的雅可比矩阵.

+ 设 $E = (0, 1) times (0, a)$，且 $f: E -> RR^2$ 满足 $f(x, y) = (x cos y, x sin y)$. 证明 $f$ 在 $E$ 中每个点处有局部双射，但当 $a > 2 pi$ 时 $f: E -> f(E)$ 不是双射.

+ 详细写出定理 4.1 证明过程中的第一步.

+ 设 $E$ 是 $RR^n$ 中的凸开集，$f: E -> RR^n$ 可微，且对任意的 $x in E$ 而言 $f'(x)$ 均是正定的，证明 $f$ 是单射.

+ 设 $f: RR^n -> RR^n$ 连续可微，且存在 $alpha > 0$ 使得对任意的 $x, h in RR^n$ 均有 $h^T f'(x) h >= alpha abs(h)^2$. 证明：\
  （1）对任意的 $x, y in RR^n$ 有 $chevron.l f(x) - f(y), x - y chevron.r >= alpha abs(x - y)^2$;\
  （2）$f$ 把闭集映为闭集;\
  （3）$f$ 是双射.

+ 设 $f: RR^n -> RR^n$ 连续可微，对任意的 $x in RR^n$ 而言 $f'(x)$ 均非奇异，并且若 $K$ 是紧集则 $f^(-1) (K)$ 亦是紧集. 证明 $f$ 是满射.

+ 设 $f = (f_1, f_2)^T: RR^2 -> RR^2$ 满足 $f_1 (x, y) = x$ 以及
  $ f_2 (x, y) = cases(display((x^(4/3) + y^(4/3)) sin (1)/(sqrt(x^2 + y^2)) + y) & quad x^2 + y^2 != 0, display(0) & quad x^2 + y^2 = 0.) $
  #v(0.4em)证明 $f'(bold(0))$ 是恒等映射，但 $(partial f_2)/(partial x)$ 与 $(partial f_2)/(partial y)$ 在 $bold(0)$ 处皆不连续，并且在 $bold(0)$ 的任意邻域内均存在 $bold(a) != bold(b)$ 使得 $f(bold(a)) = f(bold(b))$.


#pagebreak(weak: true)


#v(0em)
== 习题 13.5

+ 计算 $display((partial z)/(partial x))$ 及 $display((partial z)/(partial y))$，其中：\
  （1）$z^3 - x y z + sin(x + y) = 10$;\
  （2）$z = e^(x y z)$;\
  （3）$z = (x/y)^z$;\
  （4）$z sin z = x y + log(z/x)$.

+ 设 $x u - y v = 0$，$y u + x v = 1$，求雅可比矩阵
  $ mat(delim: "[", (partial u)/(partial x), (partial u)/(partial y); (partial v)/(partial x), (partial v)/(partial y)). $

+ 设 $x + y = u + v$，$x e^u = y v$，求雅可比矩阵
  $ mat(delim: "[", (partial u)/(partial x), (partial u)/(partial y); (partial v)/(partial x), (partial v)/(partial y)). $

+ 设 $F: RR -> RR$ 连续可微，证明由方程
  $ a x + b y + c z = F(x^2 + y^2 + z^2) $
  可定义函数 $z = z(x, y)$ 满足
  $ (c y - b z) (partial z)/(partial x) + (a z - c x) (partial z)/(partial y) = b x - a y. $

+ 设 $F: RR^2 -> RR$ 连续可微，证明由方程
  $ F(x + z/y, y + z/x) = 0 $
  可定义函数 $z = z(x, y)$ 满足
  $ x (partial z)/(partial x) + y (partial z)/(partial y) = z - x y. $

+ 设 $f(x, y) = (x - y)^2$. 证明：虽然 $(partial f)/(partial y) (0, 0) = 0$，但是在 $(0, 0)$ 的邻域内仍可由方程 $f(x, y) = 0$ 确定唯一的满足 $y(0) = 0$ 的函数 $y = y(x)$. 这意味着隐函数定理中的条件仅是充分而非必要的.

+ 设 $a > 0$，$x = y + phi(y)$，其中 $phi in C^1 ([-a, a])$，$phi(0) = 0$，且当 $y in [-a, a]$ 时有 $abs(phi'(y)) <= alpha < 1$. 证明存在 $epsilon > 0$，使得当 $x in (-epsilon, epsilon)$ 时，存在唯一的可微函数 $y = y(x)$ 满足上面方程且 $y(0) = 0$.

+ 设 $f(x, y)$ 是定义在 $[-a, a] times [-b, b]$ 上的一个函数，满足：\
  （1）$f(0, 0) = 0$;\
  （2）对给定的 $y in [-b, b]$，$f(x, y)$ 作为 $x$ 的函数在 $[-a, a]$ 上连续；对给定的 $x in [-a, a]$，$f(x, y)$ 作为 $y$ 的函数在 $[-b, b]$ 上连续;\
  （3）对任意的 $y in [-b, b]$ 有 $display((partial f)/(partial y)) (0, y) > 0$.\
  证明存在 $a_0 in (0, a]$ 以及定义在 $[-a_0, a_0]$ 上的函数 $g(x)$ 使得
  $ f(x, g(x)) = 0, quad forall x in [-a_0, a_0]. $

+ 证明方程 $(x^2 + y^2)^2 = a^2 (x^2 - y^2)$ $(a > 0)$ 在点 $x = 0$ 的充分小的邻域内能确定两个可微函数 $y = y(x)$.

+ 证明不存在从 $RR^2$ 到 $RR$ 的连续可微的双射.

  从第 11 题到第 13 题是一组题，讨论全局问题的解.

+ 设 $E subset.eq RR^n$，$F$ 是 $RR^m$ 中的闭集，$f: E times F -> F$ 连续，且存在常数 $alpha in (0, 1)$ 使得
  $ abs(f(x, y_1) - f(x, y_2)) <= alpha abs(y_1 - y_2), quad forall x in E, y_1, y_2 in F. $
  证明存在唯一的连续映射 $g: E -> F$ 使得对任意的 $x in E$ 有
  $ f(x, g(x)) = g(x). $

+ 设 $E subset.eq RR$，$I$ 是一个区间，$f: E times I -> RR$ 连续，且满足：\
  （1）存在 $alpha > 0$ 使得
  $ (partial f)/(partial y) (x, y) >= alpha, quad forall x in E, y in I. $
  （2）对任意的 $x in E$，均存在 $y in I$ 使得 $f(x, y) = 0$.\
  证明存在唯一的一个连续函数 $g: E -> I$ 使得对任意的 $x in E$ 有
  $ f(x, g(x)) = 0. $
  并说明当 $I = RR$ 时条件 (2) 是多余的.

+ 证明由方程 $x y = log(x + y)$ 可唯一地确定 $RR_(>= 2)$ 上的非负连续函数 $y = y(x)$，其满足
  $ y = (log x)/x + (log x)/x^3 + O((log^2 x)/x^5), quad "当" x -> +oo "时". $


#pagebreak(weak: true)


#v(0em)
== 习题 13.6

+ 求下列曲线在指定点处的切线和法平面的方程：\
  （1）$x = a sin^2 t$，$y = b sin t cos t$，$z = c cos^2 t$，在 $t = pi/4$ 对应的点处；\
  （2）$z = x^2 + y^2$，$x + y = 1$，在点 $(1/2, 1/2, 1/2)$ 处；\
  （3）$x^2 + y^2 + z^2 = 9$，$z = x y$，在点 $(1, 2, 2)$ 处；\
  （4）$x^2 + y^2 = a^2$，$x^2 + z^2 = a^2$，在点 $(a/sqrt(2), a/sqrt(2), a/sqrt(2))$ 处.

+ 求下列曲面在指定点处的切平面和法线的方程：\
  （1）$z = x^2 - 9 y^2$，在点 $(4, -1, 5)$ 处；\
  （2）$z = arctan (x/y)$，在点 $(1, 1, pi/4)$ 处；\
  （3）$x = u cos v$，$y = u sin v$，$z = a v$，在参数 $(u_0, v_0)$ 对应的点处；\
  （4）$x = a cos phi cos theta$，$y = b cos phi sin theta$，$z = c sin phi$，在参数 $(phi_0, theta_0)$ 对应的点处.

+ 设 $a > 0$，证明曲面 $sqrt(x) + sqrt(y) + sqrt(z) = sqrt(a)$ 上任一点处的切平面在三个坐标轴上的截距之和是一个常数.

+ 设 $f$ 在 $RR_(>= 0)$ 上可导，且导数不等于 0. 证明旋转面 $z = f(sqrt(x^2 + y^2))$ 的法线与旋转轴相交.

+ 设 $f in C^1 (RR^2)$，$a$ 和 $b$ 是常数. 证明曲面 $f(x - a z, y - b z) = 0$ 上任一点处的切平面均与某定直线平行.

+ 设 $f in C^1 (RR^2)$，$a, b, c$ 为常数. 证明曲面 $F((x - a)/(z - c), (y - b)/(z - c)) = 0$ 的切平面过一固定点.


#pagebreak(weak: true)


#v(0em)
== 习题 13.7

+ 求下列函数的极值：\
  （1）$f(x, y) = x^2 - (y - 1)^2$；\
  （2）$f(x, y) = x^4 + y^4 - x^2 - 2 x y - y^2$；\
  （3）$f(x, y) = x y log(x^2 + y^2)$；\
  （4）$f(x, y, z) = x + y^2/(4 x) + z^2/y + 2/z$ $(x, y, z > 0)$.

+ 求 $f(x, y) = x^2 + y^2$ 在条件 $x/a + y/b = 1$ 下的极值.

+ 设 $m, n, p, a$ 均是正实数，求定义在 $RR^3_(>= 0)$ 上的函数 $f(x, y, z) = x^m y^n z^p$ 在条件 $x + y + z = a$ 下的极值.

+ 求半径为 $a$ 的球内具有最大体积的内接长方体.

+ （罗尔 (Rolle) 定理）设 $K$ 是 $RR^n$ 中的一个紧集，$f$ 是定义在 $K$ 上的一个连续函数，且在 $K^circle$ 上可微，在 $partial K$ 上取常值. 证明存在 $bold(a) in K^circle$ 使得 $f'(bold(a)) = bold(0)$.

+ 求 $f(x, y) = 1/2 (x^n + y^n)$ 在条件 $x + y = a$ $(x, y > 0)$ 下的最小值，并由此证明

  $ ((x + y)/2)^n <= (x^n + y^n)/2. $

+ （赫尔德 (Hölder) 不等式）设 $x_i, y_i$ $(1 <= i <= n)$ 以及 $p, q$ 均是正实数，满足 $1/p + 1/q = 1$. 证明

  $ sum_(i=1)^n x_i y_i <= (sum_(i=1)^n x_i^p)^(1/p) (sum_(i=1)^n y_i^q)^(1/q). $

+ 设 $A$ 是 $n$ 阶对称矩阵，求 $f(bold(x)) = bold(x)^T A bold(x)$ 在条件 $bold(x)^T bold(x) = 1$ 下的最大值和最小值.

+ 设 $f(x, y) = x^3 - 4 x^2 + 2 x y - y^2$，证明 $f(x, y)$ 在 $D = [-1, 4] times [-1, 1]$ 的内部有唯一的极值点，但该极值点并非 $f$ 在 $D$ 上的最值点.


#pagebreak(weak: true)


= 第十四章 含参变量的积分与反常积分


#v(0em)
== 习题 14.1

+ 计算下列极限：\
  （1）$lim_(n -> oo) integral_0^1 (dif x)/(1 + (1 + x/n)^n)$；\
  （2）$lim_(n -> oo) n integral_0^1 log(1 + (sin x)/n) dif x$；\
  （3）$lim_(y -> 0) integral_(-1)^1 sqrt(x^2 + y^2) dif x$；\
  （4）$lim_(y -> 0) integral_y^(1 + y) (dif x)/(1 + x^2 + y^2)$.

+ 设 $f in C([a, b])$，证明定义在 $[a, b]$ 上的函数

  $ y(x) = 1/k integral_a^x f(t) sin k (x - t) dif t $

  满足微分方程 $y'' + k^2 y = f(x)$.

+ 设 $n in ZZ$，证明贝塞尔 (Bessel) 函数

  $ J_n (x) = 1/pi integral_0^pi cos(n phi - x sin phi) dif phi $

  满足贝塞尔方程 $x^2 J_n''(x) + x J_n'(x) + (x^2 - n^2) J_n (x) = 0$.

+ 证明椭圆积分

  $ E(k) = integral_0^(pi/2) sqrt(1 - k^2 sin^2 phi) dif phi, quad 0 < k < 1 $

  满足微分方程 $E''(k) + 1/k E'(k) + 1/(1 - k^2) E(k) = 0$.

+ 设 $alpha in (-1, 1)$，计算积分

  $ I(alpha) = integral_0^pi log(1 + alpha cos x) dif x. $

+ 设 $abs(alpha) != 1$，证明

  $ integral_0^pi log(1 - 2 alpha cos x + alpha^2) dif x = cases(0 #h(1em) & abs(alpha) < 1, 2 pi log abs(alpha) #h(1em) & abs(alpha) > 1) $

+ 设 $abs(alpha) < 1$，计算

  $ I(alpha) = integral_0^(pi/2) log (1 + alpha cos x)/(1 - alpha cos x) dot 1/(cos x) dif x. $


#pagebreak(weak: true)


#v(0em)
== 习题 14.2

+ 设 $X$ 和 $Y$ 是 $RR$ 的两个子集，$f(x, y)$ 是定义在 $X times Y$ 上的函数，$x_0$ 是 $X$ 的一个聚点. 试写出判定 $x$ 沿 $X$ 中元素趋于 $x_0$ 时 $f(x, y)$ 在 $Y$ 上一致收敛的柯西准则并证明之.

+ 判断下列含参变量反常积分在指定集合上是否一致收敛：\
  #v(0.6em)（1）$integral_1^(+oo) (y^2 - x^2)/(x^2 + y^2)^2 dif x, quad y in RR$；\
  #v(0.6em)（2）$integral_0^(+oo) e^(-x y) sin x dif x, quad y in [a, +oo)$，其中 $a > 0$；\
  #v(0.6em)（3）$integral_0^(+oo) e^(-x y) sin x dif x, quad y in (0, +oo)$；\
  #v(0.6em)（4）$integral_0^(+oo) (x cos x y)/(x^2 + 1) dif x, quad y in [a, +oo)$，其中 $a > 0$；\
  #v(0.6em)（5）$integral_0^(+oo) (x cos x y)/(x^2 + 1) dif x, quad y in (0, +oo)$；\
  #v(0.6em)（6）$integral_0^(+oo) sqrt(y) e^(-y x^2) dif x, quad y in (0, +oo)$；\
  #v(0.6em)（7）$integral_0^1 1/x^y sin 1/x dif x, quad y in (0, 2)$.

+ 设 $f(x)$ 在 $RR_(>= 0)$ 上连续，若积分 $integral_0^(+oo) x^y f(x) dif x$ 在 $y = a$ 和 $y = b$ $(a < b)$ 时均收敛，证明

  $ integral_0^(+oo) x^y f(x) dif x $

  在 $[a, b]$ 上一致收敛.

+ 证明积分

  $ integral_1^(+oo) e^(-1/y^2 (x - 1/y)^2) dif x $

  在 $(0, 1)$ 上一致收敛，但不存在与 $y$ 无关的函数作为上述被积函数的优势函数.

+ 设 $f(x, y)$ 是定义在 $[a, b] times E$ 上的二元函数，$y_0$ 是 $E$ 的聚点，满足：\
  （1）对任意给定的 $y in E$，$f(x, y)$ 作为 $x$ 的函数在 $[a, b]$ 上可积；\
  （2）当 $y -> y_0$ 时 $f(x, y)$ 在 $[a, b]$ 上一致收敛于 $phi(x)$.\
  证明 $phi(x)$ 在 $[a, b]$ 上可积并且

  $ lim_(y -> y_0, y in E) integral_a^b f(x, y) dif x = integral_a^b phi(x) dif x. $

+ 设 $a != 0$，$g(y) = integral_0^(+oo) 1/x (1 - e^(-x y)) cos a x dif x$. 证明：\
  （1）$g(y)$ 在 $RR_(>= 0)$ 上连续；\
  （2）$g(y)$ 在 $RR_(> 0)$ 上可导.

+ 研究函数 $g(y) = integral_0^(+oo) (arctan x)/(x^y (3 + x^3)) dif x$ 的定义域及连续性.

+ 计算 $I(alpha) = integral_0^(+oo) e^(-x^2) cos alpha x dif x$.

+ 设 $alpha >= 0$，计算

  $ I(alpha) = integral_0^(+oo) (arctan alpha x)/(x (1 + x^2)) dif x. $

+ 设 $a > 0$，$b > 0$，计算

  $ integral_0^(+oo) (1 - cos a x)/x e^(-b x) dif x. $

+ 利用 $(arctan x)/x = integral_0^1 1/(1 + x^2 y^2) dif y$ $(x != 0)$ 计算积分

  $ I = integral_0^1 (arctan x)/(x sqrt(1 - x^2)) dif x. $

+ 利用 $1/sqrt(x) = 2/sqrt(pi) integral_0^(+oo) e^(-x y^2) dif y$，并引入收敛因子来证明菲涅耳 (Fresnel) 积分

  $ integral_(-oo)^(+oo) sin x^2 dif x = integral_(-oo)^(+oo) cos x^2 dif x = sqrt(pi/2). $

+ 利用例 2.22 和 2.24 中的结果计算下列积分：\
  #v(0.6em)（1）$integral_0^(+oo) 1/x sin 1/x dif x$；\
  #v(0.6em)（2）$integral_0^(+oo) (sin^4 x)/x^2 dif x$；\
  #v(0.6em)（3）$integral_(-oo)^(+oo) e^(-(a x^2 + b x + c)) dif x quad (a > 0)$；\
  #v(0.6em)（4）$integral_(-oo)^(+oo) e^(-x^2 - a^2/x^2) dif x quad (a > 0)$；\
  #v(0.6em)（5）$integral_0^(+oo) (cos a x - cos b x)/x^2 dif x quad (0 < a < b)$；\
  #v(0.6em)（6）$integral_0^(+oo) (e^(-a x^2) - e^(-b x^2))/x^2 dif x quad (0 < a < b)$.

+ 设 $p > 0$，$q > 0$，证明

  $ "B"(p + 1, q + 1) = (p q)/((p + q + 1)(p + q)) "B"(p, q). $

+ 计算 $integral_0^(+oo) e^(-x) log x dif x$.

  从第 16 题到第 19 题是一组题，利用 $Gamma$ 函数的积分表达式 (14.17) 以及例 2.24 来重新证明斯特林 (Stirling) 公式.

+ 设 $s >= 2$，利用 (14.17) 以及变量替换证明

  $ Gamma(s) = (s - 1)^s e^(1 - s) integral_(-1)^(+oo) ((1 + x) e^(-x))^(s - 1) dif x. $

+ 设 $s >= 2$，并记 $delta = s^(-0.4)$，利用例 2.24 证明

  $ integral_(-delta)^(delta) ((1 + x) e^(-x))^(s - 1) dif x = sqrt((2 pi)/s) + O(1/s). $

+ 通过考察被积函数的单调性来证明

  $ integral_(-1)^(-delta) ((1 + x) e^(-x))^(s - 1) dif x + integral_delta^(+oo) ((1 + x) e^(-x))^(s - 1) dif x lt.double 1/s. $

+ 对 $s >= 2$ 证明斯特林公式

  $ log Gamma(s) = (s - 1/2) log s - s + 1/2 log 2 pi + O(1/s). $

+ 设 $y >= 1$，利用变量替换 $t = (x - sqrt(y))/sqrt(y)$ 及习题 9.5 第 12 题证明

  $ integral_0^(+oo) cos(x^3 - 3 x y) dif x = sqrt(y) integral_(-1)^1 cos((t^3 + 3 t^2 - 2) y^(3/2)) dif t + O(1/y). $

+ 令 $s = t^3 + 3 t^2$，证明 $1/(3 t^2 + 6 t) - 1/(2 sqrt(3) sqrt(s))$ 在 $t in (0, 1]$ 时分段单调且存在常数 $alpha, beta < 0$ 使得

  $ alpha <= 1/(3 t^2 + 6 t) - 1/(2 sqrt(3) sqrt(s)) <= beta. $

+ 利用变量替换 $s = t^3 + 3 t^2$ 及习题 9.5 第 12 题证明

  $ integral_0^1 cos((t^3 + 3 t^2 - 2) y^(3/2)) dif t = 1/(2 sqrt(3)) integral_0^4 (cos((s - 2) y^(3/2)))/sqrt(s) dif s + O(y^(-3/2)). $

+ 利用第 12 题中的菲涅耳积分证明

  $ integral_0^1 cos((t^3 + 3 t^2 - 2) y^(3/2)) dif t = sqrt(pi)/(2 sqrt(3) y^(3/4)) sin(2 y^(3/2) + pi/4) + O(y^(-3/2)). $

+ 对 $y >= 1$ 证明

  $ integral_0^(+oo) cos(x^3 - 3 x y) dif x = sqrt(pi/3) y^(-1/4) sin(2 y^(3/2) + pi/4) + O(1/y). $


#pagebreak(weak: true)


= 第十五章 重积分


#v(0em)
== 习题 15.1

+ 证明 (15.1).

+ 设 $E$ 是 $RR^n$ 中的一个简单集合. 证明：对任意的 $epsilon > 0$ 及 $delta > 0$，存在有限多个 $RR^n$ 中的边长小于 $delta$ 的正方形（即各边长相等的矩形）$Q_1, dots.c, Q_k$，使得

  $ E subset.eq limits(union)_(i=1)^k Q_i quad "及" quad mu(E) > sum_(i=1)^k abs(Q_i) - epsilon. $

  同样也存在有限多个 $RR^n$ 中的边长小于 $delta$ 的正方形 $Q'_1, dots.c, Q'_ell$，使得

  $ E supset.eq limits(union)_(i=1)^ell Q'_i quad "及" quad mu(E) < sum_(i=1)^ell abs(Q'_i) + epsilon. $

+ 证明上题结论对于若尔当可测集 $E$ 也成立.

+ 设 $E, F$ 均是 $RR^n$ 中的有界集且 $E subset.eq F$，证明

  $ mu_*(E) <= mu_*(F) quad "以及" quad mu^*(E) <= mu^*(F). $

+ 设 $S$ 是 $RR^n$ 中的有界集，证明 $S$ 是若尔当可测集的充要条件是：对任意的 $epsilon > 0$，存在若尔当可测集 $E, F$ 满足 $E subset.eq S subset.eq F$ 以及 $mu(F without E) < epsilon$.

+ 证明：半径为 $r$ 的圆的面积为 $pi r^2$.

+ 设 $E = {n^(-1) : n in ZZ_(> 0)}$，证明 $E$ 是 $RR$ 中的若尔当零测集.

+ 设 $E$ 是 $RR^n$ 中的有界集，并且 $E$ 只有有限多个聚点，证明 $mu(E) = 0$.

+ 设 $E$ 是 $RR^n$ 中的有界集，证明 $mu^*(E) = mu^*(overline(E))$ 以及 $mu_*(E) = mu_*(E^circle)$.

+ 证明每个没有内点的若尔当可测集必是若尔当零测集.

+ 设 $E$ 是 $RR^n$ 中的有界集，证明 $mu^*(E) - mu_*(E) >= mu^*(partial E)$.

+ 把 $QQ inter [0, 1]$ 中的元素排成一列，记作 $a_1, a_2, dots.c, a_m, dots.c$，又令 $epsilon = 1/4$. 证明集合

  $ S = limits(union)_(m=1)^oo (a_m - epsilon/2^m, a_m + epsilon/2^m) $

  是 $RR$ 中的一个若尔当不可测的开集，并由此构造出 $RR$ 中的一个若尔当不可测的闭集.

+ 设 $E$ 是 $RR^n$ 中的有界集，证明 $E$ 是若尔当可测集的充要条件是：对任意的 $epsilon > 0$，存在 $RR^n$ 中的简单集合 $F$ 使得 $mu^*(E triangle F) < epsilon$.

+ 设 $E$ 和 $F$ 均是 $RR^n$ 中的若尔当可测集，\
  （1）举例说明由 $mu(E without F) = mu(E) - mu(F)$ 成立不能推出 $F subset.eq overline(E)$；\
  （2）证明 $mu(E without F) = mu(E) - mu(F)$ 成立的充要条件是 $F^circle subset.eq overline(E)$.

+ 设 $E$ 是 $RR^n$ 中的有界集，$F$ 是 $RR^n$ 中的简单集合，证明

  $ mu^*(E) = mu^*(E inter F) + mu^*(E without F). $

+ 设 $A, B$ 是 $RR$ 的两个非空子集，定义

  $ A + B = {a + b : a in A, b in B}. $

  证明：当 $A, B$ 及 $A + B$ 均是 $RR$ 的若尔当可测子集时有

  $ mu(A + B) >= mu(A) + mu(B). $

  并举例说明上式中的等号未必成立.

+ 设 $m$ 是一个给定的正整数，$f : [0, 1] -> [0, 1]$ 满足 $f(x) = {m x}$，这里 ${t} = t - [t]$ 表示 $t$ 的小数部分. 证明：\
  （1）若 $E$ 是一个简单集合且 $E subset.eq [0, 1]$，则 $f^(-1)(E)$ 也是简单集合且

  $ mu(f^(-1)(E)) = mu(E); $

  #v(0.4em)（2）若 $S$ 是 $[0, 1]$ 的一个若尔当可测子集，则 $f^(-1)(S)$ 也是若尔当可测集且

  $ mu(f^(-1)(S)) = mu(S). $


#pagebreak(weak: true)


#v(0em)
== 习题 15.2

+ 证明命题 2.5.

+ 证明命题 2.8.

+ 证明命题 2.9.

+ 证明推论 2.12.

+ 设 $Q = [a_1, b_1] times [a_2, b_2] times dots.c times [a_n, b_n]$ 是 $RR^n$ 中的一个闭矩形，$f : Q -> RR$. 证明 $f$ 在 $Q$ 上可积且 $integral_Q f = A$ 的充要条件是：对任意的 $epsilon > 0$，存在 $delta > 0$，\
  使得对每个区间 $[a_j, b_j]$ 的满足 $Delta x_j^((i_j)) = x_j^((i_j)) - x_j^((i_j - 1)) < delta$ 的任一分划

  $ a_j = x_j^((0)) < x_j^((1)) < dots.c < x_j^((m_j)) = b_j quad (1 <= j <= n) $

  以及任意的 $xi_(i j) in [x_j^((i_j - 1)), x_j^((i_j))]$ $(1 <= j <= n, 1 <= i_j <= m_j)$ 均有

  $ abs(sum_(i_1 = 1)^(m_1) dots.c sum_(i_n = 1)^(m_n) f(xi_(i_1), dots.c, xi_(i_n)) Delta x_1^((i_1)) dots.c Delta x_n^((i_n)) - A) < epsilon. $

+ 对 $1 <= j <= n$，设 $f_j (x)$ 在 $[a_j, b_j]$ 上可积. 证明 $n$ 元函数 $f_1 (x_1) dots.c f_n (x_n)$ 在 $Q = [a_1, b_1] times dots.c times [a_n, b_n]$ 上可积且

  $ integral dots.c integral_Q f_1 (x_1) dots.c f_n (x_n) dif x_1 dots.c dif x_n = product_(j=1)^n (integral_(a_j)^(b_j) f_j (x) dif x). $

+ 计算下列积分：\
  （1）$display(integral.double_([0, 1]^2) (x^3 + 1) tan y dif x dif y)$；\
  #v(0.5em)（2）$display(integral.double_([1, 2]^2) frac(log y, x^2) dif x dif y)$；\
  #v(0.7em)（3）$display(integral.double_([0, 1] times [0, pi/2]) frac(sin y, 1 + x^2) dif x dif y)$；\
  #v(0.7em)（4）$display(integral.double_([0, 1] times [0, 2]) frac(x abs(1 - y), (1 + x)^2) dif x dif y)$.

+ 设 $Q$ 是 $RR^n$ 中的一个闭矩形，$f : Q -> RR$ 是一个有界函数，且 $f$ 在 $Q$ 上不等于 $0$ 的点构成一个闭的勒贝格零测集. 证明 $f$ 在 $Q$ 上可积且 $integral_Q f = 0$.

+ 设 $Q$ 是 $RR^n$ 中的一个闭矩形，$f : Q -> RR$. 证明 $f$ 在 $Q$ 上可积且 $integral_Q f = A$ 的充要条件是：对任意的 $epsilon > 0$，存在 $delta > 0$，使得 $RR^n$ 中两两无公共内点的若尔当可测集 $J_1, dots.c, J_k$ 只要满足 $max_(1 <= i <= k) "diam" (J_i) < delta$ 以及

  $ Q = limits(union)_(i=1)^k J_i, $

  就对任意的 $xi_i in J_i$ $(1 <= i <= k)$ 有

  $ abs(sum_(i=1)^k f(xi_i) mu(J_i) - A) < epsilon. $


#pagebreak(weak: true)


#v(0em)
== 习题 15.3

+ 设 $E$ 是 $RR^n$ 中的有界集，$f$ 与 $g$ 均在 $E$ 上可积，证明 $max(f, g)$ 与 $min(f, g)$ 也在 $E$ 上可积.

+ 设 $E$ 与 $F$ 均是 $RR^n$ 中的有界集，且 $f$ 在 $E union F$ 上可积. \
  （1）举例说明 $f$ 未必在 $E$ 或 $F$ 上可积. \
  （2）如果 $E$ 和 $F$ 均是若尔当可测集，证明 $f$ 在 $E$ 和 $F$ 上均可积.

+ 设 $S$ 如习题 15.1 第 12 题所定义，证明恒等于 1 的函数在 $S$ 上不可积.

+ 设 $E$ 与 $F$ 均是 $RR^n$ 中的有界集，且 $f$ 在 $E$ 和 $F$ 上均可积，证明 $f$ 在 $E without F$ 上可积且

  $ integral_(E without F) f = integral_E f - integral_(E inter F) f. $

+ 设 $A, B$ 均是 $RR^n$ 中的若尔当可测集，

  $ f(bold(x)) = cases(1\, & bold(x) in B, 0\, & bold(x) in A without B.) $

  问 $f$ 是否在 $A$ 上可积？

+ （柯西 — 施瓦茨不等式）设 $E$ 是 $RR^n$ 中的有界集，$f$ 与 $g$ 均在 $E$ 上可积，证明

  $ abs(integral_E f g)^2 <= (integral_E f^2) dot (integral_E g^2). $

+ 设 $f(x, y)$ 在点 $(0, 0)$ 的某邻域内有定义，且在 $(0, 0)$ 处连续，计算

  $ lim_(r -> 0^+) 1/r^2 integral.double_([-r, r]^2) f(x, y) dif x dif y. $

+ 记

  $ I = integral.double_(abs(x) + abs(y) <= 10) (dif x dif y)/(100 + cos^2 x + cos^2 y), $

  证明 $1.96 <= I <= 2$.

+ 设 $E$ 是 $RR^n$ 中的若尔当可测集，$f$ 在 $E$ 上非负可积且存在 $E$ 的若尔当可测子集 $F$，使得 $mu(F) > 0$ 且对任意的 $bold(x) in F$ 有 $f(bold(x)) > 0$. 证明

  $ integral_E f > 0. $


#pagebreak(weak: true)


#v(0em)
== 习题 15.4

+ 假设 $f$ 在积分区域上连续，试交换下列积分的次序：\
  （1）$integral_0^2 dif x integral_(x/2)^(2 x) f(x, y) dif y$；\
  #v(0.8em)（2）$integral_(-1)^1 dif x integral_(x^2 + x)^(x + 1) f(x, y) dif y$；\
  #v(1em)（3）$integral_(-1)^1 dif x integral_(-sqrt(1 - x^2))^(sqrt(1 - x^2)) dif y integral_(sqrt(x^2 + y^2))^1 f(x, y, z) dif z$；\
  #v(1em)（4）$integral_0^1 dif x integral_0^x dif y integral_0^(x y) f(x, y, z) dif z$.

+ 设 $f(x, y)$ 在 $[0, a]^2$ 上连续，证明狄利克雷公式

  $ integral_0^a dif x integral_0^x f(x, y) dif y = integral_0^a dif y integral_y^a f(x, y) dif x. $

+ 计算极限

  $ lim_(n -> oo) 1/n^3 integral.double_([0, n]^2) ([x] + [y]) dif x dif y, $

  其中 $[x]$ 表示不超过 $x$ 的最大整数.

+ 利用富比尼原理计算下列重积分：\
  （1）$integral.double_D x y^2 dif x dif y$，其中 $D$ 是由 $y^2 = 2 p x$ $(p > 0)$ 和 $x = p/2$ 所围成的有界闭区域；\
  #v(0.9em)（2）$integral.double_D (x + 2 y) dif x dif y$，其中 $D$ 是由 $x^2 + y^2/4 = 1$ 在第一象限内的曲线段和 $y = 2 - 2 x$ 所围成的有界闭区域；\
  #v(0.9em)（3）$integral.double_D x^(p - 1) y^(q - 1) dif x dif y$ $(p, q >= 1)$，其中 $D$ 是由 $x + y = 1$ 和两个坐标轴所围成的有界闭区域；\
  #v(0.9em)（4）$integral.triple_V (dif x dif y dif z)/(1 + x + y + z)^3$，其中 $V$ 是由 $x + y + z = 1$ 和三个坐标平面所围成的有界闭区域.

+ 计算下列平面图形的面积：\
  （1）由 $x y = a^2$ 和 $x + y = 5/2 a$ $(a > 0)$ 所围成的有界闭区域；\
  （2）由 $y^2 = 2 p x + p^2$ $(p > 0)$ 和 $y^2 = -2 q x + q^2$ $(q > 0)$ 所围成的有界闭区域；\
  （3）由 $x^(2/3) + y^(2/3) = a^(2/3)$ $(a > 0)$ 所围成的有界闭区域.

+ 设 $t > 1$，证明双曲线 $x^2 - y^2 = 1$ 上两点 $A(t, sqrt(t^2 - 1))$，$B(t, -sqrt(t^2 - 1))$ 之间的曲线段与线段 $O A$，$O B$ 所围成的闭区域（如图 15.8 所示）的面积为 $"arcosh" t$.

+ 计算下列立体的体积：\
  （1）由 $z = x^2 + y^2$，$z = 2(x^2 + y^2)$，$y = x$ 和 $y = x^2$ 所围成的有界闭区域；\
  （2）由 $z = x + y$，$z = x y$，$x + y = 1$，$x = 0$ 和 $y = 0$ 所围成的有界闭区域.

+ 计算下列旋转体的体积：\
  （1）平面闭区域 ${(x, y) : x in [0, 1], y in [0, x^(2/3)]}$ 绕 $x$ 轴旋转所得的旋转体；\
  （2）平面上的圆 $x^2 + y^2 <= a^2$ 绕直线 $y = b$ $(b > a > 0)$ 旋转所得的旋转体.

+ 证明：曲面 $x y z = a^3$ $(a > 0)$ 上任一点处的切平面与三个坐标面围成的四面体体积均为 $9/2 a^3$.

+ 设 $Q = Q_1 times Q_2$ 是 $RR^n$ 中的闭矩形，其中 $Q_1$ 和 $Q_2$ 分别是 $RR^k$ 和 $RR^l$ 中的闭矩形且 $k + l = n$. 又设 $f$ 在 $Q$ 上可积，证明：使得 $f(bold(x), bold(y))$ 在 $Q_2$ 上关于变量 $bold(y)$ 不可积的那些 $bold(x) in Q_1$ 构成 $RR^k$ 中的勒贝格零测集.

+ 设 $E$ 是 $RR^2$ 中的开集且 $f in C^2 (E)$，利用富比尼定理证明：对任意的 $bold(a) in E$ 有

  $ (partial^2 f)/(partial x partial y) (bold(a)) = (partial^2 f)/(partial y partial x) (bold(a)). $

+ 把每个有理数 $x$ 写成既约分数 $p_x/q_x$ 的形式，其中 $q_x > 0$，并在正方形 $Q = [0, 1]^2$ 上定义函数 $f$ 如下：

  $ f(x, y) = cases(1\, & x " 与 " y " 均是有理数且 " q_x = q_y, 0\, & "其他情形".) $

  证明：\
  （1）$f$ 在 $Q$ 上的两个累次积分

  $ integral_0^1 dif y integral_0^1 f(x, y) dif x quad "与" quad integral_0^1 dif x integral_0^1 f(x, y) dif y $

  均存在且相等；\
  （2）$f$ 在 $Q$ 上处处不连续，从而在 $Q$ 上不可积.


#pagebreak(weak: true)


#v(0em)
== 习题 15.5

+ 计算下列重积分：\
  （1）$integral.double_(x^2 + y^2 <= a^2) x^2 sin y dif x dif y$；\
  （2）$integral.double_(pi^2 <= x^2 + y^2 <= 4 pi^2) sin sqrt(x^2 + y^2) dif x dif y$；\
  （3）$integral.double_(x^2 + y^2 <= 2 x) sqrt(x^2 + y^2) dif x dif y$；\
  （4）$integral.double_D 1/x dif x dif y$，其中 $D$ 是由 $x + y = p$，$x + y = q$ $(0 < p < q)$，$y = a x$ 及 $y = b x$ $(0 < a < b)$ 所围成的有界闭区域；\
  （5）$integral.double_D (x^2 sin x y)/y dif x dif y$，其中 $D$ 是由 $y^2 = p x$，$y^2 = q x$ $(0 < p < q)$，$x^2 = a y$ 及 $x^2 = b y$ $(0 < a < b)$ 所围成的有界闭区域；\
  #v(0.5em)（6）$integral.triple_V z dif x dif y dif z$，其中 $V$ 是椭球体 $x^2/a^2 + y^2/b^2 + z^2/c^2 <= 1$ $(a, b, c > 0)$ 的上半部分；\
  #v(0.5em)（7）$integral.triple_V sqrt(x^2 + y^2) dif x dif y dif z$，其中 $V$ 是由 $z = sqrt(x^2 + y^2)$ 与 $z = 1$ 所围成的有界闭区域；\
  #v(0.5em)（8）$integral.triple_V x^2 y dif x dif y dif z$，其中 $V$ 是由 $z = x^2 + y^2$ 与 $z = 2$ 所围成的有界闭区域；\
  #v(0.5em)（9）$integral.triple_V x^2 dif x dif y dif z$，其中 $V$ 是满足 $z >= sqrt(x^2 + y^2)$ 和 $x^2 + y^2 + z^2 <= 8$ 的有界闭区域.

+ 计算球 $x^2 + y^2 + z^2 <= a^2$ $(a > 0)$ 与圆柱 $x^2 + y^2 <= a x$ 相交的部分的体积.

+ 设 $0 <= a < b$，函数 $f : [a, b] -> RR$ 非负且连续，证明由平面闭区域

  $ {(x, y) in RR^2 : x in [a, b], y in [0, f(x)]} $

  绕 $y$ 轴旋转所得的旋转体的体积为

  $ 2 pi integral_a^b x f(x) dif x. $

+ 求平面闭区域 ${(x, y) : x in [0, pi], y in [0, sin x]}$ 绕 $y$ 轴旋转所得的旋转体的体积.

+ 设 $A = (a_(i j))_(3 times 3)$ 是一个满秩方阵，$h > 0$. 计算由曲面

  $ (a_(1 1) x + a_(1 2) y + a_(1 3) z)^2 + (a_(2 1) x + a_(2 2) y + a_(2 3) z)^2 + (a_(3 1) x + a_(3 2) y + a_(3 3) z)^2 = h^2 $

  所围成的有界闭区域的体积.

+ 设 $0 < a < b$，$0 < alpha < beta$，$h > 0$. $V$ 是由曲面 $z = a y^2$ $(y > 0)$，$z = b y^2$ $(y > 0)$，$z = alpha x$，$z = beta x$ 以及 $z = h$ 所围成的闭区域，计算

  $ I = integral.triple_V x^2 dif x dif y dif z. $

+ 设 $a > 0$，$V$ 是由 $(x^2 + y^2 + z^2)^2 = a^2 x y$ $(a > 0)$ 所围成的有界闭区域满足 $z >= 0$ 的那一部分，计算

  $ I = integral.triple_V (x y z)/(x^2 + y^2) dif x dif y dif z. $

+ 设 $A$ 是三阶正定对称矩阵，计算

  $ I = integral.triple_(bold(x)^T A bold(x) <= 1) e^(sqrt(bold(x)^T A bold(x))) dif bold(x). $

+ 设 $a, b, c$ 不全为 $0$，$f$ 在 $RR$ 上连续，证明

  $ integral.triple_(x^2 + y^2 + z^2 <= 1) f(a x + b y + c z) dif x dif y dif z = pi integral_(-1)^1 (1 - u^2) f(k u) dif u, $

  其中 $k = sqrt(a^2 + b^2 + c^2)$.

+ 计算 $n$ 重积分

  $ I = integral ... integral_([0, 1]^n) (x_1 + dots.c + x_n)^2 dif x_1 dots.c dif x_n. $

+ 设 $a_j > 0$ $(1 <= j <= n)$，求 $n$ 维圆锥体

  $ {(x_1, dots.c, x_n) : x_1^2/a_1^2 + dots.c + x_(n-1)^2/a_(n-1)^2 <= x_n^2/a_n^2, 0 <= x_n <= a_n} $

  的若尔当测度.

+ 设 $bold(a)_i = (a_(i 1), dots.c, a_(i n))$ $(1 <= i <= n)$ 线性无关，并记 $A = (a_(i j))_(n times n)$. 证明以 $plus.minus bold(a)_1, dots.c, plus.minus bold(a)_n$ 为顶点的 $n$ 维多面体的若尔当测度为 $(2^n)/(n!) abs(det A)$.

+ 设 $f$ 是定义在区间 $[0, a]$ 上的连续函数，证明

  $ integral_0^a dif x_1 integral_0^(x_1) dif x_2 dots.c integral_0^(x_(n-1)) f(x_1) f(x_2) dots.c f(x_n) dif x_n = 1/(n!) (integral_0^a f(x) dif x)^n. $


#pagebreak(weak: true)


#v(0em)
== 习题 15.6

+ 证明集合 $[0, 1] without QQ$ 不存在穷竭.

+ 设 $E$ 是 $RR^n$ 中的开集，验证定理 6.15 证明过程中所构造的集合列 ${E_m}$ 是 $E$ 的穷竭.

+ 设 $E$ 是一个若尔当可测集，${E_m}$ 是一个若尔当可测集列且满足

  $ E_m >= E_(m+1) (forall m >= 1) quad "与" quad E = union.big_(m=1)^oo E_m. $

  证明 $lim_(m -> oo) mu(E_m) = mu(E)$.

+ 讨论下列反常重积分的敛散性：\
  （1）$integral.double_(RR times [0, 1]) (dif x dif y)/(1 + x^2 + y^2)^p$；\
  （2）$integral.double_(x^2 + y^2 >= 1) (dif x dif y)/(x^2 + x y + y^2)^p$；\
  （3）$integral.double_(x^2 + y^2 < 1) (dif x dif y)/(1 - x^2 - y^2)^p$；\
  （4）$integral.double_([0, a]^2) (dif x dif y)/abs(x - y)^p$.

+ 证明 $integral.double_([0, +oo)^2) e^(-x y) sin x dif x dif y$ 发散.

+ 设 $p > 0$，$q > 0$，试讨论积分 $integral.double_(abs(x) + abs(y) >= 1) (dif x dif y)/(abs(x)^p + abs(y)^q)$ 的敛散性.

+ 计算下列积分：\
  （1）$integral.double_(x^2 + y^2 <= 1) log 1/sqrt(x^2 + y^2) dif x dif y$；\
  （2）$integral.triple_(x^2 + y^2 + z^2 > 1) (dif x dif y dif z)/(x^2 + y^2 + z^2)^3$.

+ 按下列步骤计算 $zeta(2)$：\
  （1）利用变量替换 $x = u - v$，$y = u + v$ 证明

  $ integral.double_([0, 1]^2) (dif x dif y)/(1 - x y) = pi^2/6, $

  （2）利用 $1/(1 - t)$ 的幂级数展式证明

  $ integral.double_([0, 1]^2) (dif x dif y)/(1 - x y) = zeta(2). $

  进而得出 $zeta(2) = pi^2/6$.

+ 计算积分

  $ integral dots.c integral_(x_1^2 + dots.c + x_n^2 < 1) (dif x_1 dots.c dif x_n)/sqrt(1 - x_1^2 - dots.c - x_n^2). $

+ （狄利克雷积分）设 $a, p_1, dots.c, p_n$ 均是正实数，证明

  $ integral_(Delta_n (a)) x_1^(p_1 - 1) dots.c x_n^(p_n - 1) dif x_1 dots.c dif x_n = (Gamma(p_1) dots.c Gamma(p_n))/(Gamma(p_1 + dots.c + p_n + 1)) a^(p_1 + dots.c + p_n), $

  其中 $Delta_n (a)$ 是例 4.6 中所定义的 $n$ 维单形.

  平行公理 (axiom of parallels) 是欧几里得 (Euclid) 几何中的一条重要公理，它宣称在平面上过一点能且只能作一条直线与已知直线平行，它的一个著名的等价命题是 "三角形的内角和等于 $pi$". 在历史上，人们对平行公理的研究促使了非欧几何的诞生. 从第 11 题到第 15 题是一组题，介绍双曲几何 (也被称为罗巴切夫斯基 (Лобачевский) 几何) 下的面积计算，这里所用的模型是由庞加莱 (H. Poincaré) 给出的.

+ 用 $bb(H)$ 表示上半平面，即 $bb(H) = {z in CC : "Im" z > 0}$. 设实数 $a, b, c, d$ 满足 $a d - b c > 0$，证明 $z |-> (a z + b)/(c z + d)$ 是从 $bb(H)$ 到 $bb(H)$ 的映射.

+ 设 $S subset.eq bb(H)$，$f$ 是下列三种变换中的某一个：\
  （1）（平移变换）$z |-> z + lambda$，其中 $lambda in CC$；\
  （2）（伸缩变换）$z |-> p z$，其中 $p in RR_(> 0)$；\
  （3）（反演变换）$z |-> -1/z$，

  证明下式中两个积分有一个收敛时另一个也收敛，并且

  $ integral.double_S (dif x dif y)/y^2 = integral.double_(f(S)) (dif x dif y)/y^2. $

+ 设实数 $a, b, c, d$ 满足 $a d - b c = 1$，又设 $f : z |-> (a z + b)/(c z + d)$ 是从 $bb(H)$ 到 $bb(H)$ 的映射. 证明：对于 $S subset.eq bb(H)$，下式中两个积分有一个收敛时另一个也收敛，并且

  $ integral.double_S (dif x dif y)/y^2 = integral.double_(f(S)) (dif x dif y)/y^2. $

  我们称 $integral.double_S (dif x dif y)/y^2$ 为 $S$ 的双曲面积.

+ $bb(H)$ 内的圆心在 $x$ 轴上的半圆以及垂直于 $x$ 轴的射线均被称为 $bb(H)$ 上的测地线 (geodesic). 设实数 $a, b, c, d$ 满足 $a d - b c = 1$，证明 $f : z |-> (a z + b)/(c z + d)$ 把测地线映为测地线.

+ 两条测地线的夹角指的是它们在相交点处切线的夹角. 对于两条垂直于 $x$ 轴的射线而言，我们称它们相交于 $oo$ 且夹角为 0. 由三条不同的测地线所围成的闭区域被称为三角形 (例如图 15.19 中三个阴影闭区域都是三角形). 证明：以 $alpha$，$beta$，$gamma$ 为内角的三角形的双曲面积为 $pi - alpha - beta - gamma$. 特别地，在双曲几何下三角形的内角和小于 $pi$.


#pagebreak(weak: true)


= 第十六章 曲线积分


#v(0em)
== 习题 16.1

+ 计算下列平面曲线段的弧长：\
  （1）$y = x^(3/2) (0 <= x <= 4)$；\
  （2）$x = 1/4 y^2 - 1/2 log y (1 <= y <= e)$；\
  （3）摆线 $x = a(t - sin t)$，$y = a(1 - cos t) (0 <= t <= 2 pi)$，其中 $a > 0$；\
  （4）$x = a cos^4 t$，$y = a sin^4 t$，其中 $a > 0$；\
  （5）心脏线 $r = a(1 + cos theta)$，其中 $a > 0$；\
  （6）$r = a sin^3 (theta/3)$，其中 $a > 0$.

+ 计算下列空间曲线段的弧长：\
  （1）$x = 2t$，$y = t^2$，$z = log t (1 <= t <= 2)$；\
  （2）$x^2 + y^2 = c z$ 与 $y = x tan(z/c)$ 的交线，从 $(0, 0, 0)$ 到 $(x_0, y_0, z_0)$ 的一段，其中 $c > 0$.

+ 设 $a > 0$，证明空间中的维维亚尼曲线

  $ cases(x^2 + y^2 + z^2 = a^2, x^2 + y^2 = a x) $

  与平面上的椭圆 $x^2/2 + y^2 = a^2$ 有相同的弧长.

+ 设简单曲线 $C$ 由 (16.1) 所定义，其中 $x(t)$，$y(t)$ 与 $z(t)$ 均在 $[a, b]$ 上连续可微，我们记 $bold(r) = (x(t), y(t), z(t))^T$ 又设 $L = (L_1, L_2, L_3)^T : RR^3 -> RR^3$ 是正交变换，证明

  $ (frac(dif (L_1 compose bold(r)), dif t))^2 + (frac(dif (L_2 compose bold(r)), dif t))^2 + (frac(dif (L_3 compose bold(r)), dif t))^2 = [x'(t)]^2 + [y'(t)]^2 + [z'(t)]^2, $

  进而得到 $C$ 的弧长在正交变换下保持不变.


#pagebreak(weak: true)


#v(0em)
== 习题 16.2

+ 计算下列第一型曲线积分：\
  （1）$integral_C x y dif s$，其中 $C$ 是椭圆 $x^2/a^2 + y^2/b^2 = 1 (a, b > 0)$ 在第一象限内的部分；\
  （2）$integral_C y^2 dif s$，其中 $C$ 是摆线 $x = a(t - sin t)$，$y = a(1 - cos t) (0 <= t <= 2 pi)$；\
  （3）$integral_C z dif s$，其中 $C$ 是圆锥螺线 $x = t cos t$，$y = t sin t$，$z = t (0 <= t <= t_0)$；\
  （4）$integral_C y z dif s$，其中 $C$ 是球面 $x^2 + y^2 + z^2 = a^2 (a > 0)$ 与平面 $x + y + z = 0$ 的交线；\
  （5）$integral_C z dif s$，其中 $C$ 是维维亚尼曲线 $x^2 + y^2 + z^2 = a^2$，$x^2 + y^2 = a x (a > 0)$ 满足 $z >= 0$ 的那一部分.

+ 设 $C$ 是圆周 $x^2 + y^2 = a^2 (a > 0)$，点 $(u, v)$ 不在 $C$ 上. 利用习题 14.1 第 6 题的结果计算第一型曲线积分

  $ I(u, v) = integral_C log frac(1, sqrt((x - u)^2 + (y - v)^2)) dif s. $

  $I(u, v)$ 被称为#underline[单层对数位势].


#pagebreak(weak: true)


#v(0em)
== 习题 16.3

+ 计算下列第二型曲线积分：\
  （1）$integral_C (x - y) dif x + (y - x) dif y$，其中 $C$ 是曲线段 $y = x^3 (0 <= x <= 1)$，方向从 $(0, 0)$ 到 $(1, 1)$；\
  （2）$integral_C y dif x + x^2 dif y$，其中 $C$ 是抛物线段 $y = 4 - (x - 1)^2 (-1 <= x <= 3)$，方向从 $(3, 0)$ 到 $(-1, 0)$；\
  #v(0.6em)（3）$integral_C frac(dif x + dif y, abs(x) + abs(y))$，其中 $C$ 是以 $(1, 0)$，$(0, 1)$，$(-1, 0)$ 和 $(0, -1)$ 为顶点的正方形的边界，方向沿逆时针方向；\
  （4）$integral_C (y^2 - z^2) dif x + 2 y z dif y - x^2 dif z$，其中 $C$ 是由参数方程 $x = t$，$y = t^2$，$z = t^3 (0 <= t <= 1)$ 给出的曲线，方向沿参数 $t$ 增加的方向；\
  （5）$integral_C y dif x + z dif y + x dif z$，其中 $C$ 是球面 $x^2 + y^2 + z^2 = a^2 (a > 0)$ 与平面 $x + y + z = 0$ 的交线，方向从 $x$ 轴正方向看是逆时针方向；\
  （6）$integral_C (y - z) dif x + (z - x) dif y + (x - y) dif z$，其中 $C$ 是球面 $x^2 + y^2 + z^2 = a^2 (a > 0)$ 与平面 $y = x tan alpha (0 < alpha < pi/2)$ 的交线，方向从 $x$ 轴正方向看是逆时针方向.

+ 设 $C$ 是 $RR^2$ 中的光滑曲线段，弧长为 $s$. 又设函数 $P(x, y)$，$Q(x, y)$ 均在 $C$ 上连续. 证明

  $ abs(integral_C P dif x + Q dif y) <= M s, $

  其中 $M = max_((x, y) in C) sqrt(P(x, y)^2 + Q(x, y)^2)$.

+ 记

  $ I_R = integral.cont_(x^2 + y^2 = R^2) frac(y dif x - x dif y, (x^2 + x y + y^2)^2). $

  证明 $lim_(R -> +oo) I_R = 0$.


#pagebreak(weak: true)


#v(0em)
== 习题 16.4

+ 计算下列第二型曲线积分（曲线方向均是相对于其所围有界闭区域的正向）：\
  （1）$integral.cont_C x y^2 dif y - x^2 y dif x$，其中 $C$ 是圆周 $x^2 + y^2 = a^2 (a > 0)$；\
  #v(0.6em)（2）$integral.cont_C (x + y) dif x - (x - y) dif y$，其中 $C$ 是椭圆 $frac(x^2, a^2) + frac(y^2, b^2) = 1 (a, b > 0)$；\
  （3）$integral.cont_C (e^x + y) dif x + sin(x + y) dif y$，其中 $C$ 是以 $(0, 0)$，$(0, 1)$ 和 $(1, 0)$ 为顶点的三角形的边界；\
  （4）$integral.cont_C (x + y^2) dif x + (y + x^2) dif y$，其中 $C$ 是心脏线 $r = a(1 + cos theta) (a > 0)$.

+ 利用格林公式计算下列曲线所围有界闭区域的面积：\
  （1）$y = x^2$ 与 $x = y^2$ 在第一象限内所围闭区域；\
  （2）摆线 $x = a(t - sin t)$，$y = a(1 - cos t) (0 <= t <= 2 pi)$ 与 $x$ 轴所围闭区域，其中 $a > 0$；\
  （3）心脏线 $r = a(1 + cos theta) (a > 0)$ 所围闭区域；\
  （4）笛卡尔（Descartes）叶形线 $x^3 + y^3 = 3 a x y (a > 0)$ 在第一象限所围闭区域；\
  #v(0.7em)（5）环索线 $y^2 = x^2 frac(a - x, a + x) (x >= 0)$ 所围闭区域，其中 $a > 0$；\
  #v(0.7em)（6）由曲线 $(frac(x, a))^n + (frac(y, b))^n = 1 (a, b, n > 0)$ 与坐标轴在第一象限所围闭区域.

+ 设 $a > 0$，$c > 0$ 且 $a c - b^2 > 0$. 又设 $S$ 是 $RR^2$ 中的一个有界闭区域，$bold(0) in S^degree$，且 $partial S$ 由有限多条光滑曲线组成，计算

  $ I = integral_(partial S) frac(y dif x - x dif y, a x^2 + 2 b x y + c y^2), $

  其中 $partial S$ 的方向为沿曲线正向.

+ 设 $bold(l)$ 是一个给定的非零向量，$C$ 是由有限多条光滑曲线所组成的简单闭曲线，证明

  $ integral.cont_C cos(bold(l), bold(n)) dif s = 0, $

  其中 $bold(n)$ 是 $C$ 的单位外法向量，$(bold(l), bold(n))$ 表示 $bold(l)$ 与 $bold(n)$ 的夹角.

+ 设 $C$ 是曲线段 $y = sin x (0 <= x <= pi)$，方向从 $(0, 0)$ 到 $(pi, 0)$. 计算

  $ integral_C x e^(x^2 + y^2) dif x + y e^(x^2 + y^2) dif y. $


#pagebreak(weak: true)


#v(0em)
== 习题 16.5

+ 证明 $f(x, y) = arctan frac(y, x)$ 是 $RR^2 without {(0, y) : y in RR}$ 上的调和函数.

+ 求定义在 $RR$ 上的所有二阶连续可导函数 $f$，使得 $f(x + y)$ 是 $RR^2$ 上的调和函数.

+ 求定义在 $RR_(> 0)$ 上的所有二阶连续可导函数 $f$，使得 $f(x^2 + y^2)$ 是 $RR^2 without {(0, 0)}$ 上的调和函数.

+ 证明在极坐标变换

  $ cases(x = r cos theta "," , y = r sin theta) $

  下有

  $ Delta f = (partial^2 f)/(partial x^2) + (partial^2 f)/(partial y^2) = (partial^2 f)/(partial r^2) + 1/r (partial f)/(partial r) + 1/r^2 (partial^2 f)/(partial theta^2). $

+ （拉普拉斯算子在正交变换下的不变性）假设 $f$ 是 $C^2$ 类的调和函数，$A = mat(delim: "[", a, b; c, d)$ 是一个正交矩阵，$g(x, y) = f(a x + b y, c x + d y)$. 证明 $Delta f = Delta g$.

+ （拉普拉斯方程在反演变换下的不变性）设 $f$ 是 $C^2$ 类的调和函数，证明函数 $g(x, y) = f(frac(x, x^2 + y^2), frac(y, x^2 + y^2))$ 满足

  $ (partial^2 g)/(partial x^2) + (partial^2 g)/(partial y^2) = 0. $

+ 设 $f$ 是区域 $D subset.eq RR^2$ 上的 $C^2$ 类的调和函数，$S = {bold(x) in RR^2 : abs(bold(x) - bold(a)) <= r} subset.eq D$，证明

  $ integral_S f = pi r^2 f(bold(a)). $

+ 设 $S = {(x, y) in RR^2 : (x - 5)^2 + (y - 4)^2 <= 20, (x - 4)^2 + (y - 2)^2 >= 1}$，计算重积分

  $ integral.double_S arctan frac(y, x) dif x dif y. $

+ 设 $D$ 是平面上由有限多条光滑曲线所围成的有界区域，$u in C^2 (D)$，且对 $D$ 中任意一条分段光滑闭曲线 $C$ 均有

  $ integral_C (partial u)/(partial x) dif y - (partial u)/(partial y) dif x = 0. $

  证明 $u$ 是 $D$ 上的调和函数.


#pagebreak(weak: true)


= 第十七章 曲面积分


#v(0em)
== 习题 17.1

+ 计算下列曲面的面积：\
  （1）马鞍面 $z = x y$ 被柱面 $x^2 + y^2 = a^2$（$a > 0$）所截的部分；\
  （2）椭圆抛物面 $z = frac(x^2, 2 a) + frac(y^2, 2 b)$ 被柱面 $frac(x^2, a^2) + frac(y^2, b^2) = c^2$（$a, b, c > 0$）所截的部分；\
  （3）螺旋面 $x = r cos theta$, $y = r sin theta$, $z = b theta$（$0 <= r <= a$, $0 <= theta <= 2 pi$），其中 $b > 0$；\
  （4）曲面 $(x^2 + y^2 + z^2)^2 = 2 a^2 x y$（$a > 0$）.

+ 设 $Omega$, $D$, $bold(r)$ 如定义 1.1 中所给出，$S = bold(r)(D)$ 是光滑曲面. 又设 $L: RR^3 -> RR^3$ 是正交变换. 证明 $abs((L compose bold(r))_u times (L compose bold(r))_v) = abs(bold(r)_u times bold(r)_v)$，进而得出光滑曲面的面积在正交变换下保持不变.

+ 计算由下列曲线段绕 $x$ 轴旋转所得的旋转曲面的面积：\
  （1）$y = frac(1, 3) x^3$（$0 <= x <= 2$）；\
  （2）$x^2 + (y - b)^2 = a^2$（$0 < a < b$）；\
  （3）摆线 $x = a (t - sin t)$, $y = a (1 - cos t)$（$0 <= t <= 2 pi$），其中 $a > 0$.

+ 求星形线 $x = a cos^3 t$, $y = a sin^3 t$（$a > 0$）绕直线 $y = x$ 旋转后所得曲面的面积.


#pagebreak(weak: true)


#v(0em)
== 习题 17.2

+ 计算下列第一型曲面积分：\
  （1）$integral.double_S frac(1, z) dif S$，其中 $S$ 是球面 $x^2 + y^2 + z^2 = a^2$ 满足 $z >= h$（$0 < h < a$）的部分；\
  （2）$integral.double_S (x + y + z) dif S$，其中 $S$ 是锥面 $z = sqrt(x^2 + y^2)$ 被圆柱 $x^2 + y^2 = 2 a x$（$a > 0$）所截的部分；\
  （3）$integral.double_S frac(1, (1 + x + y)^2) dif S$，其中 $S$ 是四面体 $x + y + z <= 1$, $x >= 0$, $y >= 0$, $z >= 0$ 的边界；\
  （4）$integral.double_S z^2 dif S$，其中 $S$ 是圆锥表面的一部分 $x = r cos theta sin alpha$, $y = r sin theta sin alpha$, $z = r cos alpha$（$0 <= r <= a$, $0 <= theta <= 2 pi$），$alpha in (0, pi/2)$ 是一个常数.

+ 计算
  $ F(t) = integral.double_(x^2 + y^2 + z^2 = t^2) f(x, y, z) dif S, $
  其中
  $ f(x, y, z) = cases(x^2 + y^2 "," & z >= sqrt(x^2 + y^2), 0 & z < sqrt(x^2 + y^2)) $

+ 设 $Omega$, $D$, $bold(r)$ 如定义 1.1 中所给出，$S = bold(r)(D)$ 是光滑曲面，$f$ 是定义在 $S$ 上的一个函数. 又设 $L: RR^3 -> RR^3$ 是正交变换. 证明
  $ integral.double_(L(S)) f dif S = integral.double_S f compose L dif S. $

+ 设 $f in C(RR)$，$S$ 是球面 $x^2 + y^2 + z^2 = 1$，证明泊松 (Poisson) 公式
  $ integral.double_S f(a x + b y + c z) dif S = 2 pi integral_(-1)^1 f(u sqrt(a^2 + b^2 + c^2)) dif u. $


#pagebreak(weak: true)


#v(0em)
== 习题 17.4

+ 计算下列第二型曲面积分：\
  （1）$integral.double_S x dif y and dif z + y dif z and dif x + z dif x and dif y$，其中 $S$ 是球面 $x^2 + y^2 + z^2 = a^2 (a > 0)$，定侧为外侧；\
  #v(0.7em)（2）$integral.double_S x dif y and dif z + y dif z and dif x + z dif x and dif y$，其中 $S$ 是圆柱面 $x^2 + y^2 = 1$，$0 <= z <= 3$，定侧为沿柱体外侧；\
  #v(0.7em)（3）$integral.double_S frac(1, x) dif y and dif z + frac(1, y) dif z and dif x + frac(1, z) dif x and dif y$，其中 $S$ 是椭球面 $frac(x^2, a^2) + frac(y^2, b^2) + frac(z^2, c^2) = 1 (a, b, c > 0)$，定侧为外侧；\
  #v(1em)（4）$integral.double_S x^2 dif y and dif z + y^2 dif z and dif x + z^2 dif x and dif y$，其中 $S$ 是圆锥面 $z = sqrt(x^2 + y^2) (0 <= z <= h)$，定侧为下侧；\
  #v(0.7em)（5）$integral.double_S x^2 dif y and dif z + y^2 dif z and dif x + z^2 dif x and dif y$，其中 $S$ 是抛物面 $z = x^2 + y^2 (0 <= z <= h)$，定侧为下侧；\
  #v(0.7em)（6）$integral.double_S y z dif y and dif z + z x dif z and dif x + x y dif x and dif y$，其中 $S$ 是八分之一球面 $x^2 + y^2 + z^2 = a^2 (a > 0)$，$x >= 0$，$y >= 0$，$z >= 0$，定侧为上侧.


#pagebreak(weak: true)


#v(0em)
== 习题 17.5

+ 利用高斯公式计算下列第二型曲面积分：\
  （1）$integral.double_S x^2 dif y and dif z + y^2 dif z and dif x + z^2 dif x and dif y$，其中 $S$ 是立方体 $[0, a]^3$ 的边界，定侧为外侧；\
  #v(0.7em)（2）$integral.double_S (x + y) dif y and dif z + (y + z) dif z and dif x + (z + x) dif x and dif y$，其中 $S$ 是椭球面 $frac(x^2, a^2) + frac(y^2, b^2) + frac(z^2, c^2) = 1 (a, b, c > 0)$，定侧为外侧；\
  #v(0.7em)（3）$integral.double_S x y dif y and dif z + (y + z) dif z and dif x + (z^2 + x) dif x and dif y$，其中 $S$ 是四面体 $x + y + z <= a (a > 0)$，$x >= 0$，$y >= 0$，$z >= 0$ 的边界，定侧为外侧；\
  #v(0.7em)（4）$integral.double_S (x - y + z) dif y and dif z + (y - z + x) dif z and dif x + (z - x + y) dif x and dif y$，其中 $S$ 是立体 $abs(x - y + z) + abs(y - z + x) + abs(z - x + y) <= 1$ 的边界，定侧为外侧.

+ 设 $V$ 是 $RR^3$ 中的一个有界闭区域，$partial V$ 由有限多个双侧的分片光滑曲面组成，定侧为外侧. 又设 $P, Q, R, u in C^1 (V)$. 证明三重积分的#underline[分部积分公式]

  $ integral.triple_V u dot (frac(partial P, partial x) + frac(partial Q, partial y) + frac(partial R, partial z)) dif x dif y dif z = integral.double_(partial V) u dot (P dif y and dif z + Q dif z and dif x + R dif x and dif y) $

  $ quad quad - integral.triple_V (P dot frac(partial u, partial x) + Q dot frac(partial u, partial y) + R dot frac(partial u, partial z)) dif x dif y dif z. $

+ 设 $a, b, c > 0$，计算

  $ integral.double_S frac(x dif y and dif z + y dif z and dif x + z dif x and dif y, (a x^2 + b y^2 + c z^2)^(3/2)), $

  其中 $S$ 是球面 $x^2 + y^2 + z^2 = 1$，定侧为外侧.

+ 设 $V$ 是 $RR^3$ 中的一个区域，证明：\
  （1）若 $f: V -> RR^3$ 与 $g: V -> RR^3$ 均是 $C^1$ 类的，则对任意的 $alpha, beta in RR$ 有

  $ "div" (alpha f + beta g) = alpha "div" f + beta "div" g; $

  #v(0.3em)（2）若 $f: V -> RR$ 与 $g: V -> RR^3$ 均是 $C^1$ 类的，则

  $ "div" (f dot g) = f dot "div" g + chevron.l g, "grad" f chevron.r. $

+ 设 $f$ 二阶可导，$r = sqrt(x^2 + y^2 + z^2)$. 在 $r != 0$ 时计算 $"div" ("grad" f (r))$，并说明哪些 $f$ 使得对任意的 $r != 0$ 有 $"div" ("grad" f (r)) = 0$.


#pagebreak(weak: true)


#v(0em)
== 习题 17.6

+ 利用斯托克斯公式计算下列第二型曲线积分：\
  （1）$integral.cont_C (z - y) dif x + (x - z) dif y + (y - x) dif z$，其中 $C$ 是以 $(a, 0, 0)$，$(0, a, 0)$，$(0, 0, a)$ 为顶点的三角形的边界 $(a > 0)$，方向从 $(a, 0, 0)$ 到 $(0, a, 0)$，再到 $(0, 0, a)$，最后回到 $(a, 0, 0)$；\
  #v(0.7em)（2）$integral.cont_C (y^2 + z^2) dif x + (z^2 + x^2) dif y + (x^2 + y^2) dif z$，其中 $C$ 是曲线 $x^2 + y^2 + z^2 = 2 R x$，$x^2 + y^2 = 2 r x (0 < r < R, z > 0)$，方向从 $z$ 轴正方向看是逆时针方向；\
  #v(0.7em)（3）$integral.cont_C (z - y) dif x + (x - z) dif y + (y - x) dif z$，其中 $C$ 是曲面 $x^2 + y^2 + z^2 = 1 (x, y, z >= 0)$ 的边界，方向为由所围曲面上侧部分所定的正向；\
  #v(0.7em)（4）$integral.cont_C (y^2 - z^2) dif x + (z^2 - x^2) dif y + (x^2 - y^2) dif z$，其中 $C$ 是平面 $x + y + z = frac(3, 2) a$ 截立方体 $[0, a]^3$ 所得截面的边界，方向从 $x$ 轴正方向看是逆时针方向.

+ 设 $V$ 是 $RR^3$ 中的区域，$f: E -> RR^3$ 与 $g: E -> RR^3$ 均连续可微，证明：\
  （1）对任意的 $alpha, beta in RR$ 有 $"rot" (alpha f + beta g) = alpha "rot" f + beta "rot" g$；\
  （2）$"div" (f times g) = chevron.l g, "rot" f chevron.r - chevron.l f, "rot" g chevron.r$.

+ 设 $V$ 是 $RR^3$ 中的区域，$f: E -> RR$ 与 $g: E -> RR^3$ 均连续可微，证明

  $ "rot" (f g) = f "rot" g + "grad" f times g. $


#pagebreak(weak: true)


= 第十八章 傅里叶分析初步


#v(0em)
== 习题 18.2

+ 求下列周期函数的形如 (18.5) 的傅里叶级数：\
  （1）$f(x)$ 以 $2$ 为周期，并且

  $ f(x) = cases(A & quad 0 <= x < 1, 0 & quad 1 <= x < 2) $

  其中 $A$ 是常数；\
  （2）$f(x)$ 以 $1$ 为周期，且在 $[0, 1]$ 上 $f(x) = x^2$；\
  （3）$f(x)$ 以 $2 pi$ 为周期，且在 $[-pi, pi)$ 上 $f(x) = x cos x$；\
  （4）$f(x) = abs(cos x)$.

+ 用 $norm(x)$ 表示 $x$ 与离它最近的整数之间的距离，即 $norm(x) = min_(n in ZZ) abs(x - n)$，求 $norm(x)$ 的形如 (18.6) 的傅里叶级数.

+ 求定义在 $(0, 1)$ 上的函数 $f(x) = x^2$ 的正弦级数.

+ 求定义在 $(0, pi)$ 上的函数 $f(x) = sin x$ 的余弦级数.

+ 设三角级数

  $ frac(a_0, 2) + sum_(n=1)^oo (a_n cos frac(2 pi n x, ell) + b_n sin frac(2 pi n x, ell)) $

  在 $RR$ 上一致收敛于 $f(x)$，证明这一三角级数是 $f(x)$ 的傅里叶级数.

+ 设 $f(x)$ 在 $(0, pi/2)$ 上可积，应当如何将 $f(x)$ 延拓为以 $2 pi$ 为周期的函数，使得其傅里叶级数形如

  $ sum_(n=1)^oo a_(2 n - 1) cos (2 n - 1) x ? $

+ 闻名遐迩的哥德巴赫猜想宣称每个不小于 $6$ 的偶数 $N$ 都可以写成两个素数之和，证明这一猜想等价于

  $ integral_0^1 S(alpha)^2 e(-N alpha) dif alpha > 0, $

  其中 $S(alpha) = sum_(p < N) e(alpha p)$，这里求和条件中的 $p < N$ 表示求和变量 $p$ 遍历小于 $N$ 的全部素数.

+ 设 $f(x)$ 是以 $ell$ 为周期的函数，且 $f(x)$ 在某个长度为 $ell$ 的闭区间上单调. 证明 $f(x)$ 的傅里叶系数满足

  $ a_n = O(frac(1, n)), quad b_n = O(frac(1, n)). $

+ 设 $f(x)$ 是周期函数，并且存在正常数 $L$ 及 $alpha in (0, 1]$ 使得

  $ abs(f(x) - f(y)) <= L abs(x - y)^alpha, quad forall x, y in RR. $

  证明 $hat(f)(n) lt.double abs(n)^(-alpha)$（$forall n != 0$）.


#pagebreak(weak: true)


#v(0em)
== 习题 18.3

+ 讨论 §18.2 习题 1 中诸函数的傅里叶级数的收敛性.

+ 设 $alpha in.not ZZ$，证明在 $(-pi, pi)$ 上有

  $ sin alpha x = frac(2 sin alpha pi, pi) sum_(n=1)^oo frac((-1)^n n, alpha^2 - n^2) sin n x. $

+ 证明：

  $ sum_(n=1)^oo frac(cos 2 n x, 4 n^2 - 1) = 1/2 - frac(pi, 4) sin x, quad forall x in [0, pi]. $

+ 设 $f(x)$ 以 $2 pi$ 为周期，且在 $[-pi, pi)$ 上有 $f(x) = e^x$，求 $f(x)$ 的傅里叶级数，并由此计算 $sum_(n=1)^oo ((-1)^n)/(n^2 + 1)$.

+ 设 $N$ 是正整数，$D_N$ 是狄利克雷核，证明

  $ integral_0^1 abs(D_N (x)) dif x = frac(2, pi^2) log N + O(1). $

+ 证明当 $x != k pi$（$k in ZZ$）时有

  $ 1/(sin x) = 1/x + sum_(n=1)^oo (-1)^n (frac(1, x + n pi) + frac(1, x - n pi)). $

+ （罗巴切夫斯基）利用上题结论与第十一章命题 1.12 重新证明

  $ integral_0^(+oo) frac(sin x, x) dif x = pi/2. $

  从第 8 题到第 11 题是一组题，介绍 (18.21) 的一些推论.

+ 证明在 $0$ 的充分小的去心邻域内有

  $ cot alpha = 1/alpha - 2 sum_(k=1)^oo frac(zeta(2 k), pi^(2 k)) alpha^(2 k - 1), $

  并由此计算 $zeta(2)$ 与 $zeta(4)$.

+ （1）利用 (18.21) 和沃利斯 (Wallis) 公式（习题 9.5 第 10 题）证明

  $ sin pi x = pi x product_(n=1)^oo (1 - x^2/n^2), quad forall x in [0, 1]. $

  #v(0.3em)（2）证明上式对任意的 $x in RR$ 均成立.

+ 证明：对任意的 $x in.not ZZ$ 有

  $ pi^2/(sin^2 pi x) = sum_(n in ZZ) frac(1, (x + n)^2). $

+ （博灵 (Beurling)）令

  $ f(x) = cases(display(frac(sin^2 pi x, pi^2) (sum_(n=0)^oo frac(1, (x - n)^2) - sum_(n=1)^oo frac(1, (x + n)^2) + frac(2, x))) & quad quad x in.not ZZ, "sgn" x & quad quad x in ZZ) $

  其中 $"sgn" x$ 是符号函数. 利用上题结果证明：\
  （1）对任意的 $x in RR$ 有 $f(x) >= "sgn" x$；\
  （2）$integral_(-oo)^(+oo) (f(x) - "sgn" x) dif x = 1.$


#pagebreak(weak: true)


#v(0em)
== 习题 18.4

+ 证明 $sum_(n=1)^oo sin n$ 是切萨罗可和的并求其切萨罗和.

+ 判断级数 $sum_(n=1)^oo (-1)^n ln n$ 是否是切萨罗可和的.

+ 设 $sum_(n=1)^oo u_n$ 是正项级数，证明：$sum_(n=1)^oo u_n$ 是切萨罗可和的当且仅当它收敛.

+ 设 $sum_(n=1)^oo a_n$ 与 $sum_(n=1)^oo b_n$ 是两个收敛的级数，它们的和分别为 $A$ 与 $B$.\
  #v(0.5em)（1）证明这两个级数的柯西乘积是切萨罗可和的，且其切萨罗和为 $A B$；\
  #v(0.4em)（2）利用（1）中结论证明第十章定理 4.12.

+ 设 $sum_(n=1)^oo u_n$ 是切萨罗可和的，证明当 $n -> oo$ 时 $u_n = o(n)$.

+ 设 $sum_(n=1)^oo u_n$ 是一个级数，如果极限

  $ lim_(r -> 1^-) sum_(n=1)^oo u_n r^n $

  存在，则称 $sum_(n=1)^oo u_n$ 是阿贝尔可和的，此时称上述极限值为 $sum_(n=1)^oo u_n$ 的阿贝尔和. 试按以下步骤证明切萨罗可和蕴含阿贝尔可和：

  （1）设 $sum_(n=1)^oo u_n$ 是切萨罗可和的，证明 $sum_(n=1)^oo u_n r^n$ 在 $(-1, 1)$ 上收敛；

  （2）对 $r in (-1, 1)$ 证明

  $ sum_(n=1)^oo u_n r^n = (1 - r)^2 sum_(n=1)^oo n sigma_n r^n, $

  其中 $sigma_n$ 是 $sum_(n=1)^oo u_n$ 的第 $n$ 个切萨罗和；

  （3）设 $sum_(n=1)^oo u_n$ 的切萨罗和为 $sigma$，证明该级数是阿贝尔可和的且其阿贝尔和是 $sigma$.


#pagebreak(weak: true)


#v(0em)
== 习题 18.5

+ （帕塞瓦尔恒等式）设 $f$ 是以 $ell$ 为周期的函数且 $f in cal(R)^2 [0, ell]$，证明

  $ 1/ell integral_0^ell f(x)^2 dif x = sum_(n in ZZ) abs(hat(f)(n))^2 $

  以及

  $ 2/ell integral_0^ell f(x)^2 dif x = frac(a_0^2, 2) + sum_(n=1)^oo (a_n^2 + b_n^2), $

  其中 $a_n$ 和 $b_n$ 是 $f$ 的傅里叶系数.

+ 利用帕塞瓦尔恒等式重新证明命题 4.5.

+ 求定义在 $[0, pi]$ 上的函数 $f(x) = x(pi - x)$ 的正弦级数，并对其使用帕塞瓦尔恒等式来计算 $zeta(6)$ 的值.

+ 证明三角级数 $sum_(n=2)^oo frac(sin n x, log n)$ 不是任何一个黎曼可积函数的傅里叶级数.


#pagebreak(weak: true)


#v(0em)
== 习题 18.6

+ 设 $"{" x_n "}"$ 是一致分布的，证明对任意的非零整数 $m$ 而言 $"{" m x_n "}"$ 均是一致分布的.

+ 设 $x_n in [0, 1) (forall n in ZZ_(> 0))$ 且 $"{" x_n "}"$ 是一致分布的，证明 $"{" x_n "}"$ 在 $[0, 1]$ 上稠密.

+ 设 $alpha$ 是一个有理数，证明 $"{" n alpha "}"$ 不是一致分布的.

+ 设数列 $"{" x_n - y_n "}"$ 收敛且 $"{" x_n "}"$ 一致分布，证明 $"{" y_n "}"$ 也一致分布.

+ 设 $"{" x_n "}"$ 是一个数列，$q$ 是一个正整数. 又假设对任意的整数 $0 <= r < q$ 而言，$"{" x_(q n + r) "}"$ 均是一致分布的. 证明 $"{" x_n "}"$ 是一致分布的.

+ 利用欧拉 (Euler) 求和公式（第十一章定理 4.3）和外尔准则证明 $"{" log n "}"$ 不一致分布.


#pagebreak(weak: true)


#v(0em)
== 习题 18.7

+ 求函数 $f(x) = cases(1"," & quad |x| < 1, 0"," & quad |x| >= 1)$ 的傅里叶变换.

+ 求函数 $f(x) = cases(sin x"," & quad |x| <= pi, 0"," & quad |x| > pi)$ 的傅里叶变换，并由此证明

  $ 2/pi integral_0^(+oo) (sin pi y sin x y)/(1 - y^2) dif y = sin x, quad quad forall x in [-pi, pi]. $

+ 试求一个定义在 $RR_(> 0)$ 上的满足

  $ integral_0^(+oo) phi(y) sin x y dif y = e^(-x), quad quad forall x > 0 $

  的函数 $phi(y)$.

+ 设 $b - a > 2$，

  $ f(x) = cases(x - a"," & quad x in [a, a + 1), 1"," & quad x in [a + 1, b - 1), b - x"," & quad x in [b - 1, b), 0"," & quad x < a " 或 " x >= b). $

  （1）对任意的 $y in RR$ 证明

  $ abs(hat(f)(y)) <= min(b - a, 1/(pi abs(y)), 1/(pi y)^2). $

  （2）证明 $integral_(-oo)^(+oo) abs(hat(f)(y)) dif y << log(b - a)$.

+ （普朗谢雷尔（Plancherel）公式）设 $f(x)$ 是在 $RR$ 上连续的实值函数且 $integral_(-oo)^(+oo) abs(f(x)) dif x$ 与 $integral_(-oo)^(+oo) f(x)^2 dif x$ 均收敛，证明

  $ integral_(-oo)^(+oo) f(x)^2 dif x = integral_(-oo)^(+oo) abs(hat(f)(x))^2 dif x. $

+ 对 $f(x) = max(1 - |x|, 0)$ 应用上题结论来计算 $integral_(-oo)^(+oo) (sin^4 x)/x^4 dif x$.

+ （泊松（Poisson）求和公式）设 $f in C^1 (RR)$，且存在 $lambda > 1$ 使得在 $RR$ 上有

  $ f(x) << 1/(1 + |x|)^lambda, quad quad f'(x) << 1/(1 + |x|)^lambda. $

  试通过研究函数 $F(x) = sum_(n in ZZ) f(x + n)$ 的傅里叶级数来证明

  $ sum_(n in ZZ) f(n) = sum_(n in ZZ) hat(f)(n), $

  上式右边中的 $hat(f)$ 是 $f$ 的傅里叶变换.

+ 对 $x > 0$ 记 $theta(x) = sum_(n in ZZ) e^(-pi n^2 x)$，利用上题结论证明

  $ theta(x) = x^(-1/2) theta(x^(-1)), quad quad forall x > 0. $


#pagebreak(weak: true)


#v(0em)
== 习题 18.8

+ 证明 (18.37).

+ 设 $G$ 是一个有限阿贝尔群，$chi$ 是 $G$ 上的一个特征，$A subset.eq G$ 与 $a in G$ 满足 $chi(a) != 1$ 以及 #box($abs(A triangle (a dot A)) <= M$)，其中 $a dot A = {a x : x in A}$，证明

  $ abs(sum_(x in A) chi(x)) <= M/(abs(1 - chi(a))). $

+ 设 $F$ 是一个有限域，$chi$ 是乘法群 $F without {0_F}$ 上的一个非主特征，证明：对任意的 $a in F without {0_F}$ 有

  $ sum_(x in F without {0_F, -a}) chi(x) overline(chi(x + a)) = -1. $

+ （高斯（Gauss）和）设 $F$ 是一个有限域，$chi$ 是乘法群 $F without {0_F}$ 上的特征，$psi$ 是加法群 $F$ 上的特征，我们称 $sum_(x in F without {0_F}) chi(x) psi(x)$ 为#underline[高斯和（Gauss sum）]. 证明：对非主特征 $chi$ 和 $psi$ 有

  $ abs(sum_(x in F without {0_F}) chi(x) psi(x)) = sqrt(abs(F)). $

+ （有限域中的勾股数）设 $F$ 是一个元素个数为奇数的有限域，证明方程

  $ a^2 + b^2 = c^2, quad quad a, b, c in F $

  的解数为 $abs(F)^2 + O(abs(F)^(3/2))$.

