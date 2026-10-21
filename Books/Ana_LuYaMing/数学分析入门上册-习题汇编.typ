// ============================================================
//  数学分析入门（上册）· 习题  ——  公共模板
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
  title: "数学分析入门（上册）· 习题汇编",
  author: "陆亚明",
)

#set heading(numbering: none)

// ---- 页眉 ---------------------------------------------------
#set page(header: context {
  set text(size: 8.5pt, fill: rgb("#6b7280"))
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    [数学分析入门（上册）],
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


= 第一章 集合与映射


#v(0em)
== 习题 1.1

+ 证明下列结论：\
  （1）$3/2 in {x in QQ : x^2 + x - 2 > 0}$；\
  （2）${x in ZZ : x^2 - 4 <= 0} = {x in ZZ : x^4 < 81}$；\
  （3）${n in ZZ : 2 divides.not n} = {n in ZZ : 8 | n^2 - 1}$；\
  （4）${(x, y) in ZZ^2 : x^2 - 2 y^2 = 65} = emptyset$.

+ 设 $A = {a, b, {c}}$，试写出 $2^A$.

+ 设有限集 $A$ 的元素个数为 $n$，证明 $2^A$ 的元素个数为 $2^n$.

+ 假设 $X, Y, Z$ 是三个非空集合，$(x_1, y_1, z_1)$ 与 $(x_2, y_2, z_2)$ 均是 $X times Y times Z$ 中的元素，证明 $(x_1, y_1, z_1) = (x_2, y_2, z_2)$ 当且仅当 $x_1 = x_2$，$y_1 = y_2$ 且 $z_1 = z_2$.

+ 设 $R$ 是从 $X$ 到 $Y$ 的一个关系，则 $Y times X$ 的子集
  $ {(y, x) in Y times X : (x, y) in R} $
  是从 $Y$ 到 $X$ 的一个关系，我们称之为 $R$ 的逆（inverse），记作 $R^(-1)$. 证明 $(R^(-1))^(-1) = R$.

+ 设 $R$ 是从 $X$ 到 $Y$ 的一个关系，$S$ 是从 $Y$ 到 $Z$ 的一个关系，我们称集合
  $ {(x, z) in X times Z : exists y in Y " 使得 " (x, y) in R " 且 " (y, z) in S} $
  为关系 $R$ 与 $S$ 的复合（composition），记作 $S compose R$. 证明：\
  （1）$(S compose R)^(-1) = R^(-1) compose S^(-1)$；\
  （2）若 $T$ 是从 $Z$ 到集合 $U$ 的一个关系，则 $T compose (S compose R) = (T compose S) compose R$.

+ 设 $R = {(x, y) in ZZ_(>= 0)^2 : x + y = 6}$，$S = {(x, y) in ZZ_(>= 0)^2 : x y = 30}$. \
  （1）设 $A = {1, 2, 4, 5}$，求 $S^(-1)(A)$；\
  （2）求 $R^(-1)$ 以及 $S compose R$.

+ 设 $X$ 是一个集合. 令
  $ cal(R) = {R subset.eq X times X : "对任意的" S subset.eq X times X " 均有 " R compose S = S compose R} $
  证明 $cal(R) = {emptyset, Delta_X}$，其中 $Delta_X = {(x, x) : x in X}$.


#pagebreak(weak: true)


#v(0em)
== 习题 1.2

+ 设 $p$ 是一个给定的素数，对任意的非零整数 $a$，用 $v_p (a)$ 表示使得 $p^m | a$ 成立的最大非负整数 $m$. 现考虑 $QQ_(!= 0) times ZZ$ 的子集
  $ f = {(a/b, v_p (a) - v_p (b)) : a, b in ZZ_(!= 0)}, $
  证明：$f$ 是从 $QQ_(!= 0)$ 到 $ZZ$ 的映射.

+ 设 $f: ZZ_(> 0) -> QQ$ 满足 $f(x) = x/(x^2 + 1)$，证明 $f$ 是单射.

+ 设 $f: X -> X$. 记 $f_1 (x) = f(x)$，$f_n = f compose f_(n-1)$ $(n = 2, 3, dots.c)$. 证明：若存在 $n_0$ 使得 $f_(n_0) (x) = x$ $(forall x in X)$，则 $f$ 为从 $X$ 到 $X$ 的双射.

+ 设 $f: X -> Y, g: Y -> Z$. 证明：若 $g compose f$ 是单射，则 $f$ 是单射；若 $g compose f$ 是满射，则 $g$ 是满射.

+ 设 $f: X -> Y, g: Y -> X$，并且对任意的 $x in X$ 均有 $g(f(x)) = x$，证明：$f$ 为单射，$g$ 为满射.

+ 设 $f: X -> Y, g: Y -> Z, h: Z -> U$，又设 $g compose f$ 与 $h compose g$ 均为双射. 证明：$f, g, h$ 都是双射.

+ 设 $f: X -> Y$. 证明 $f$ 是满射的充要条件是：对任意的非空集合 $Z$ 及映射 $g_1 : Y -> Z$ 与 $g_2 : Y -> Z$，若有 $g_1 compose f = g_2 compose f$，则 $g_1 = g_2$.

+ 设 $f: X -> Y$. 证明 $f$ 是单射的充要条件是：对任意的非空集合 $Z$ 及映射 $g_1 : Z -> X$ 与 $g_2 : Z -> X$，若有 $f compose g_1 = f compose g_2$，则 $g_1 = g_2$.

+ 设 $f_1 (x) = x/sqrt(1 + x^2)$，$f_n = f_1 compose f_(n-1)$ $(n = 2, 3, dots.c)$，求 $f_n (x)$.

+ 设函数 $f$ 满足 $f(x/(x + 1)) = x^2$，求 $f(x)$.

+ 设 $f$ 与 $g$ 均是定义在 $ZZ$ 上的非常值函数，且对任意的 $x, y in ZZ$ 有
  $ f(x + y) = f(x) g(y) + g(x) f(y), $
  $ g(x + y) = g(x) g(y) - f(x) f(y). $
  求 $f(0)$ 与 $g(0)$ 的所有可能值.

+ 设 $f$ 是定义在 $RR$ 上的一个函数，证明它可写成一个奇函数与一个偶函数之和.

+ 定义在 $RR$ 上的单调递增的偶函数存在吗？

+ 证明取整函数 $[x]$ 满足以下性质：\
  （1）$[x] <= x < [x] + 1$；\
  （2）${x} = x - [x]$ 是以 $1$ 为最小正周期的周期函数；\
  （3）当 $x in.not ZZ$ 时，$[-x] = -[x] - 1$；\
  （4）若 $x <= y$，则 $[x] <= [y]$；\
  （5）对任意的 $x, y in RR$ 有 $[x] + [y] <= [x + y] <= [x] + [y] + 1$；\
  （6）对任意的 $m in ZZ_(>= 1)$ 有 $[ [x]/m ] = [x/m]$.

+ 设 $n in ZZ_(>= 1)$，$a in RR$，证明：
  $ sum_(k=0)^(n-1) [a + k/n] = [n a]. $

+ 在平面直角坐标系中，横坐标和纵坐标均为整数的点被称为整点. 设 $A$ 是一个正实数，证明双曲线 $x y = A$ $(x > 0, y > 0)$ 下方（包含该双曲线）横、纵坐标均为正整数的整点的个数为
  $ 2 sum_(n <= sqrt(A)) [A/n] - [sqrt(A)]^2. $

+ 设 $x in RR$，用 $||x||$ 表示 $x$ 与离它最近的整数之间的距离，即 $||x|| = min_(n in ZZ) |x - n|$，证明：\
  （1）对任意的 $x in RR$ 有 $||x|| <= 1/2$；\
  （2）$||x||$ 是以 $1$ 为最小正周期的周期函数；\
  （3）$||x|| = |[x + 1/2] - x|$；\
  （4）（三角形不等式（triangle inequality））对任意的 $x, y in RR$ 有 $||x + y|| <= ||x|| + ||y||$.

+ 两个定义在 $RR$ 上的周期函数的复合是不是周期函数？

+ 两个定义在 $RR$ 上的周期函数的乘积是不是周期函数？

+ 假设定义在 $[0, 1]$ 上的函数 $f$ 满足 $f(x) = x$，试将其延拓为 $RR$ 上的以 $2$ 为周期的偶函数.

+ 定义在 $RR$ 上的函数
  $ D(x) = cases(1 & quad x in QQ, 0 & quad x in.not QQ) $
  被称为狄利克雷函数. 证明：$D(x)$ 既是偶函数又是周期函数，但是它没有最小正周期.

+ 设 $f: ZZ_(> 0) -> ZZ$ 满足：\
  （1）$f(2) = 2$；\
  （2）对任意的 $m, n in ZZ_(> 0)$，均有 $f(m n) = f(m) f(n)$；\
  （3）若 $m > n$，则有 $f(m) > f(n)$.\
  证明：$f(n) = n$ $(forall n in ZZ_(> 0))$.

+ 设函数 $f: ZZ_(>= 0) -> ZZ_(>= 0)$ 满足 $f(n + 1) > f(f(n))$ $(forall n in ZZ_(>= 0))$，  证明：对任意的非负整数 $n$ 有 $f(n) = n$.

  设 $X$ 是非空集合，$R$ 是从 $X$ 到 $X$ 的一个关系（参见习题 1.1 第 5 题上面一段），如果满足\
  （1）（自反性）$x R x$ $(forall x in X)$；\
  （2）（对称性）若 $x R y$，则 $y R x$；\
  （3）（传递性）若 $x R y$ 且 $y R z$，则 $x R z$，\
  就称 $R$ 是 $X$ 上的一个等价关系（equivalence relation）. 从第 24 题到第 32 题是一组题，给出了等价关系的一些性质及相关例子.

+ 设 $R$ 是从实数集 $RR$ 到其自身的一个关系，满足：
  $ x R y quad "当且仅当" quad x - y in ZZ. $
  问 $R$ 是否是 $RR$ 上的等价关系？

+ 设 $R$ 是从实数集 $RR$ 到其自身的一个关系，满足：
  $ x R y quad "当且仅当存在非零有理数" space k space "使得" quad y = k x. $
  问 $R$ 是否是 $RR$ 上的等价关系？

+ 设 $R$ 是从 $X$ 到 $X$ 的一个满足对称性和传递性的关系，证明：$R$ 是一个等价关系当且仅当 $R^(-1)(X) = X$（$R^(-1)$ 的定义参见习题 1.1 第 5 题）.

+ 设 $R$ 是从 $X$ 到 $X$ 的一个关系，证明：$R$ 满足对称性当且仅当 $R = R^(-1)$，$R$ 满足传递性当且仅当 $R compose R subset.eq R$.

+ 设 $R_1$ 和 $R_2$ 均为集合 $X$ 上的等价关系，证明：$R_1 compose R_2$ 仍是 $X$ 上的等价关系的充要条件是 $R_1 compose R_2 = R_2 compose R_1$.

+ 设 $R$ 为 $X$ 上的一个等价关系，对于任意的 $x in X$，记 $overline(x) = {y in X : y R x}$，并称之为 $x$ 所在的等价类（equivalence class）. 证明：任意两个不相等的等价类无公共元素.

+ 设 $R$ 为 $X$ 上的一个等价关系，我们把由 $R$ 所决定的全体等价类所成之集称为 $X$ 在 $R$ 下的商集（quotient set），记作 $X \/ R$，即
  $ X \/ R = {overline(x) : x in X}. $
  称由 $pi (x) = overline(x)$ $(forall x in X)$ 所定义的映射 $pi: X -> X \/ R$ 为典范映射（canonical mapping）. 证明：若 $f: X -> Y$ 是满射，则可在 $X$ 上定义等价关系 $R$，其满足
  $ x_1 R x_2 quad "当且仅当" quad f(x_1) = f(x_2), $
  并且存在双射 $g: X \/ R -> Y$ 使得 $g compose pi = f$.

+ 考虑从 $NN times NN$ 到其自身的一个关系 $R$，其满足
  $ (a, b) R (c, d) quad "当且仅当" quad a + d = b + c. $
  证明：\
  （1）$R$ 是 $NN times NN$ 上的一个等价关系；\
  （2）存在双射 $f: (NN times NN) \/ R -> ZZ$.

+ 考虑从集合 $X = {(a, b) in ZZ^2 : b != 0}$ 到其自身的一个关系 $R$，其满足
  $ (a, b) R (c, d) quad "当且仅当" quad a d = b c. $
  证明：\
  （1）$R$ 是 $X$ 上的一个等价关系；\
  （2）存在双射 $f: X \/ R -> QQ$.


#pagebreak(weak: true)


#v(0em)
== 习题 1.3

+ 证明命题 3.12 的（3）和（4）.

+ 证明命题 3.17.

+ 设 $A = {x in ZZ : abs(x - 1) + abs(x + 1) <= 4}$，$B = {x in ZZ : x(x - 1)(x - 2) >= 0}$，求 $A union B$ 与 $A inter B$.

+ 对任意的正整数 $q$ 记 $A_q = {a/q : a in ZZ}$，计算 $union.big_(q=1)^oo A_q$ 和 $inter.big_(q=1)^oo A_q$.

+ 设 $X, Y$ 是集合. \
  （1）证明：$2^X union 2^Y subset.eq 2^(X union Y)$；\
  （2）给出 $2^X union 2^Y = 2^(X union Y)$ 成立的充要条件.

+ 设 $A, B, C$ 为集合，证明：\
  （1）$(A union B) without C = (A without C) union (B without C)$；\
  （2）$(A inter B) without C = (A without C) inter (B without C)$；\
  （3）$A times (B union C) = (A times B) union (A times C)$；\
  （4）$A times (B inter C) = (A times B) inter (A times C)$.

+ 设 $A, B, C$ 均是有理数集 $QQ$ 的子集，定义 $A + B = {a + b : a in A, b in B}$，证明：
  $ A + (B union C) = (A + B) union (A + C). $
  等式 $A + (B inter C) = (A + B) inter (A + C)$ 成立吗？

+ 设 $A, B, C, D$ 为集合，证明：
  $ (A inter B) times (C inter D) = (A times C) inter (B times D). $
  等式 $(A union B) times (C union D) = (A times C) union (B times D)$ 成立吗？

+ 设 $X$ 是一个集合，现考虑 $2^X$ 上的一个关系
  $ R = {(A, B) : A, B subset.eq X " 且 " A Delta B " 是有限集"}. $
  证明：$R$ 是 $2^X$ 上的一个等价关系.

+ 设 $X$ 是一个 $n$ 元集合，$cal(A) = {(A, B) : A, B subset.eq X " 且 " A inter B = emptyset}$，求 $cal(A)$ 的元素个数.

+ 设 $f: X -> Y$，证明：\
  （1）对任意的 $B subset.eq Y$ 均有 $f(f^(-1)(B)) = B inter f(X)$；\
  （2）$f$ 是满射的充要条件是：对任意的 $B subset.eq Y$ 均有 $B = f(f^(-1)(B))$.

+ 设 $f: X -> Y$，证明下列命题等价：\
  （1）$f$ 是单射；\
  （2）对任意的 $A subset.eq X$ 均有 $f^(-1)(f(A)) = A$；\
  （3）对任意的 $A, B subset.eq X$ 有 $f(A without B) = f(A) without f(B)$；\
  （4）对任意的 $A, B subset.eq X$ 有 $f(A inter B) = f(A) inter f(B)$；\
  （5）若 $A, B subset.eq X$ 满足 $A inter B = emptyset$，则 $f(A) inter f(B) = emptyset$.

+ 设 $X$ 是全集，对 $X$ 的子集 $A$，我们记
  $ chi_A (x) = cases(1 & quad x in A, 0 & quad x in X without A), $
  并称 $chi_A$ 为 $A$ 的特征函数（characteristic function）. 现设 $A, B subset.eq X$，证明：\
  （1）$A subset.eq B$ 当且仅当 $chi_A (x) <= chi_B (x)$ $(forall x in X)$；\
  （2）$A = B$ 当且仅当 $chi_A = chi_B$；\
  （3）$chi_(A^c) (x) = 1 - chi_A (x)$ $(forall x in X)$；\
  （4）$chi_(A union B) (x) = chi_A (x) + chi_B (x) - chi_(A inter B) (x)$ $(forall x in X)$；\
  （5）$chi_(A inter B) (x) = chi_A (x) dot chi_B (x)$ $(forall x in X)$；\
  （6）$chi_(A without B) (x) = chi_A (x) (1 - chi_B (x))$ $(forall x in X)$；\
  （7）$chi_(A Delta B) (x) = abs(chi_A (x) - chi_B (x))$ $(forall x in X)$.

+ 设 $A, B, C$ 是三个集合，证明：
  $ A union (B Delta C) supset.eq (A union B) Delta (A union C), $
  并且 $A union (B Delta C) = (A union B) Delta (A union C)$ 当且仅当 $A = emptyset$.

+ （容斥原理）设 $X$ 是一个有限集，$A_1, A_2, dots.c, A_n$ 均是 $X$ 的子集. 若用 $|S|$ 表示 $X$ 的子集 $S$ 的元素个数，试利用关系式 $|S| = sum_(a in X) chi_S (a)$ 证明：
  $ abs((union.big_(k=1)^n A_k)^c) = abs(X) + sum_(j=1)^n (-1)^j sum_(1 <= i_1 < i_2 < dots.c < i_j <= n) abs(A_(i_1) inter A_(i_2) inter dots.c inter A_(i_j)). $

+ 设 $a_1, a_2, dots.c, a_n$ 是 $n$ 个正整数，证明：
  $ max(a_1, a_2, dots.c, a_n) = sum_(j=1)^n (-1)^(j-1) sum_(1 <= i_1 < i_2 < dots.c < i_j <= n) min(a_(i_1), a_(i_2), dots.c, a_(i_j)). $

+ 设 $n >= 2$，$A_1, A_2, dots.c, A_n$ 均是有限集. 用 $|S|$ 表示集合 $S$ 的元素个数. 证明：
  $ abs(A_1 Delta A_2 Delta dots.c Delta A_n) = sum_(1 <= j <= n) (-2)^(j-1) sum_(1 <= i_1 < i_2 < dots.c < i_j <= n) abs(A_(i_1) inter A_(i_2) inter dots.c inter A_(i_j)). $


#pagebreak(weak: true)


#v(0em)
== 习题 1.4

+ 证明：任意两个区间有相同的势.

+ 证明：每个无限集均包含一个可数子集.

+ 设 $A$ 是一个集合，证明 $A$ 是无限集的充要条件是：存在 $A$ 的真子集 $B$，使得 $A$ 与 $B$ 有相同的势.

+ 设 $A$ 是一个无限集，$B$ 是一个至多可数集，证明：$A$ 与 $A union B$ 有相同的势.

+ 对任意的非空集合 $X, Y$，用 $Y^X$ 表示从 $X$ 到 $Y$ 的全体映射所成之集. 试对任意的非空集合 $A$ 证明：$2^A$ 与 ${0, 1}^A$ 具有相同的势.

+ 设 $n$ 是一个给定的正整数，$A_1, A_2, dots.c, A_n$ 均是可数集，证明：$A_1 times A_2 times dots.c times A_n$ 也是可数集.

+ （康托尔）证明：从 $ZZ_(> 0)$ 到 ${0, 1}$ 的全体映射所成之集是不可数集.


#pagebreak(weak: true)


= 第二章 实数理论


#v(0em)
== 习题 2.1

+ 设 $F$ 是一个域，证明 $F$ 中的零元与乘法幺元均是唯一的。

+ 设 $F$ 是一个域，$x in F$，证明 $x$ 的负元是唯一的，当 $x != 0_F$ 时证明 $x$ 的乘法逆元也是唯一的。

+ 集合 $S = {m / 2^n : m, n in ZZ}$ 在通常的加法和乘法运算下是否是一个域？

+ 在 $bb(F)_3 times bb(F)_3$ 上定义运算如下：

  $ (a, b) + (c, d) = (a + c, b + d), $
  $ (a, b) dot (c, d) = (a c - b d, a d + b c), $

  其中上面两个式子右边有序对中出现的运算均是例 1.3 中所给出的 $bb(F)_3$ 中的运算. 证明 $bb(F)_3 times bb(F)_3$ 是一个元素个数为 9 的域.

+ 设 $X = {frac(p(x), q(x)) : p(x) " 与 " q(x) " 均为有理系数多项式，且 " q(x) " 不是零多项式"}$，证明 $X$ 在通常的加法和乘法运算下形成一个域.

+ 若域 $F$ 中只有有限多个元素，则称之为有限域（finite field）. 设 $F$ 是 $n$ 个元素的有限域，\
  （1）证明 $n 1_F = 0_F$，进而证明存在素数 $p$ 使得 $p 1_F = 0_F$；\
  （2）若 $n$ 是奇数，则证明对 $F$ 中任意非零元 $a$ 有 $2a != 0_F$.

+ 设 $F$ 为有序域，证明对 $F$ 的任意非零元 $a$ 而言 $a^2$ 均为正元素. 特别地，$1_F$ 为正元素.

+ 证明：任何有限域均不是有序域.

+ 设 $F$ 为有序域，证明：存在 $R subset.eq F times F$ 使得 \
  （1）对任意的 $x in F$ 有 $(x, x) in R$；\
  （2）若 $x, y in F$ 满足 $(x, y) in R$ 及 $(y, x) in R$，则 $x = y$；\
  （3）若 $x, y, z in F$ 满足 $(x, y) in R$ 及 $(y, z) in R$，则 $(x, z) in R$；\
  （4）对任意的 $x, y in F$，$(x, y) in R$ 与 $(y, x) in R$ 中至少有一个成立.

+ 证明：如果 $F$ 是有序域，那么任意一个与之同构的域均是有序域.


#pagebreak(weak: true)


#v(0em)
== 习题 2.2

+ 设 $alpha$ 是一个分割，证明 $-(-alpha) = alpha$.

+ 设 $alpha$ 是一个分割，证明 $alpha > 0^*$ 当且仅当 $-alpha < 0^*$.

+ 设 $alpha, beta$ 是分割，证明存在唯一的分割 $gamma$ 使得 $alpha + gamma = beta$.

+ 证明 $alpha$ 是有理分割当且仅当 $-alpha$ 是有理分割.

+ 设 $beta, gamma$ 均是正分割，证明式 (2.4).

+ 设 $alpha$ 是一个分割，证明 $0^* dot alpha = 0^*$.

+ 设 $p$ 是有理数，证明 $|p^*| = |p|^*$.

+ 证明引理 2.24.

+ 我们把例 2.3 中的分割记作 $sqrt(2)$，证明 $sqrt(2)$ 不是有理分割.

+ 令 $sqrt(2)$ 如上题所设，证明 $sqrt(2) dot sqrt(2) = 2^*$.

+ 证明集合 ${a + b sqrt(2) : a, b in QQ}$ 在通常的加法和乘法运算下形成一个域.

+ 设 $x, y in RR$，证明三角形不等式

  $ abs(x + y) <= abs(x) + abs(y), $

  并将其推广至多个实数的情形.

+ 证明有理数集和无理数集在实数集中的稠密性（density），即对任意的实数 $x < y$，证明存在有理数 $p$ 和无理数 $xi$ 使得

  $ x < p < y quad "及" quad x < xi < y. $

+ 假设对任意的正整数 $n$，$a_n$ 均是实数. 记

  $ A = union.big_(n=1)^oo inter.big_(m=1)^oo {x in RR : x < a_(n+m)}, quad B = inter.big_(n=1)^oo union.big_(m=1)^oo {x in RR : x < a_(n+m)}. $

  证明 $A subset.eq B$.

+ （狄利克雷）设 $tau >= 1$ 是一个给定的实数，证明：对任意的实数 $x$，均存在既约有理数 $frac(a, q)$，满足 $1 <= q <= tau$ 以及

  $ abs(x - frac(a, q)) < frac(1, q tau). $


#pagebreak(weak: true)


#v(0em)
== 习题 2.3

+ 设 $A$ 是 $RR$ 的一个非空子集. 证明：当 $A$ 的上确界存在时，其上确界必唯一；当 $A$ 的下确界存在时，其下确界也必唯一.

+ 求下列集合的上、下确界：\
  （1）${n in ZZ : n^2 + 5n - 16 <= 0}$；\
  （2）${x in RR : abs(x + 2) - abs(x) < 1}$；\
  （3）${x in RR : frac(2x + 1, x - 1) <= 1}$；\
  （4）${frac(n^2 - 1, n^2 + 1) : n in ZZ}$.

+ 设 $I subset.eq RR$，函数 $f(x)$ 和 $g(x)$ 均在 $I$ 上有界，证明：\
  （1）$sup_(x in I)(f(x) + g(x)) <= sup_(x in I) f(x) + sup_(x in I) g(x)$；\
  （2）$inf_(x in I)(f(x) + g(x)) >= inf_(x in I) f(x) + inf_(x in I) g(x)$.

+ 举例说明上题中的等号未必成立.

+ 设 $I subset.eq RR$，函数 $f(x)$ 和 $g(x)$ 均在 $I$ 上有界，且在 $I$ 上有 $f(x) <= g(x)$. 证明：\
  （1）$sup_(x in I) f(x) <= sup_(x in I) g(x)$；\
  （2）$inf_(x in I) f(x) <= inf_(x in I) g(x)$.

+ 设 $A$ 和 $B$ 是实数集 $RR$ 的两个有界非空子集，记

  $ A + B = {a + b : a in A, b in B}, $

  证明：\
  （1）$sup(A + B) = sup A + sup B$；\
  （2）$inf(A + B) = inf A + inf B$.

+ 设 $A$ 和 $B$ 是实数集 $RR$ 的两个有界非空子集，它们的元素均非负，记

  $ A dot B = {a dot b : a in A, b in B}, $

  证明：\
  （1）$sup(A dot B) = sup A dot sup B$；\
  （2）$inf(A dot B) = inf A dot inf B$.

+ 设 $A$ 和 $B$ 是两个非空实数集，$f(x, y)$ 是定义在 $A times B$ 上的有界二元函数，证明：\
  （1）$inf_((x, y) in A times B) f(x, y) = inf_(x in A) (inf_(y in B) f(x, y)) = inf_(y in B) (inf_(x in A) f(x, y))$；\
  （2）$sup_((x, y) in A times B) f(x, y) = sup_(x in A) (sup_(y in B) f(x, y)) = sup_(y in B) (sup_(x in A) f(x, y))$.

+ 证明：如果 $I$ 是一个区间，那么它要么是 $RR$，要么是定义 2.31 中的某个集合.

+ 设 $E$ 是一个集合. 对任意的正整数 $n$，假设 $f_n : E -> RR$ 是定义在 $E$ 上的函数，且对任意给定的 $x in E$，集合 ${f_n (x) : n in ZZ_(>= 1)}$ 均有界. 现按下式定义 $E$ 上的函数 $g$ 和 $h$：

  $ g(x) = sup_(n >= 1) f_n (x), quad h(x) = inf_(n >= 1) f_n (x). $

  证明：对任意的 $a in RR$ 有

  $ g^(-1)((a, +oo)) = union.big_(n=1)^oo f_n^(-1)((a, +oo)), quad h^(-1)((-oo, a)) = union.big_(n=1)^oo f_n^(-1)((-oo, a)). $

+ 设 $A$ 是 $RR$ 的一个非空子集，$a$ 是一个实数，若包含 $a$ 的每个开区间都含有 $A$ 中异于 $a$ 的元素，则称 $a$ 是 $A$ 的聚点. 现设 $A, B$ 均不是空集，满足 $A union B = RR$ 以及 $A inter B = emptyset$. 证明：或者 $A$ 含有 $B$ 的聚点，或者 $B$ 含有 $A$ 的聚点.

+ 试由确界原理推出戴德金定理.

+ 设函数 $f(x)$ 在区间 $[a, b]$ 上单调递增，且 $f(a) > a$，$f(b) < b$. 证明：存在 $xi in [a, b]$，使得 $f(xi) = xi$.

+ 设 $P(x)$ 是关于实数 $x$ 的一个命题，且满足：\
  （1）存在 $a in RR$ 使得命题 $P(x)$ 对任意的 $x < a$ 均成立；\
  （2）对任意的 $b in RR$ 而言，如果 $P(x)$ 对任意的 $x < b$ 均成立，则存在 $c > b$ 使得 $P(x)$ 对任意的 $x < c$ 均成立.\
  证明命题 $P(x)$ 对任意的实数 $x$ 均成立.


#pagebreak(weak: true)


#v(0em)
== 习题 2.4

+ 设 $f(x)$ 是定义在有界闭区间 $I$ 上的一个函数，且对任意的 $a in I$，存在 $a$ 的邻域 $I_a$，使得 $f(x)$ 在 $I_a inter I$ 上有界. 证明 $f(x)$ 在 $I$ 上有界.

+ 设 $f(x)$ 是定义在开区间 $I$ 上的一个函数，且对任意的 $a in I$，存在 $a$ 的邻域 $I_a$，使得 $f(x)$ 在 $I_a$ 上单调递增. 证明 $f(x)$ 在 $I$ 上单调递增.

+ 设定义在开区间 $I$ 上的函数 $f(x)$ 满足：对任意的 $a in I$，存在 $delta_a > 0$，使得

  $ f(x) cases(< f(a) & quad x in (a - delta_a, a) inter I, > f(a) & quad x in (a, a + delta_a) inter I.) $

  证明 $f(x)$ 在 $I$ 内是严格单调递增的.

+ 设 $L$ 是一个无穷指标集，$(I_lambda)_(lambda in L)$ 是开区间 $(a, b)$ 的一个开覆盖，证明可选出一列开区间 $I_(lambda_1), I_(lambda_2), dots.c, I_(lambda_n), dots.c$，使得 $(I_(lambda_n))_(n in ZZ_(>= 0))$ 为 $(a, b)$ 的一个覆盖.

+ 设 $(I_lambda)_(lambda in L)$ 是有界闭区间 $[a, b]$ 的一个开覆盖，证明存在 $delta > 0$，使得 $[a, b]$ 的任意一个长度小于 $delta$ 的闭子区间必包含于某个 $I_lambda$. $delta$ 被称为该开覆盖的勒贝格（Lebesgue）数.

+ 利用有限覆盖定理证明确界原理.


#pagebreak(weak: true)


#v(0em)
== 习题 2.5

+ 证明命题 5.1.

+ 设 $n, k$ 是两个正整数，证明 $root(k, n)$ 是有理数当且仅当 $n$ 是某个整数的 $k$ 次方.

+ 设 $a, b$ 是两个正整数，且 $sqrt(a) + sqrt(b) in QQ$，证明 $a$ 和 $b$ 均是整数的平方.

+ 求集合 $\{root(n, n) : n in ZZ_(>= 1)\}$ 的上确界和下确界.

+ 设 $f$ 是从实数域 $RR$ 到其自身的同构，证明对任意的 $x in RR$ 有 $f(x) = x$.


#pagebreak(weak: true)


#v(0em)
== 习题 2.6

+ 设 $n$ 个正实数 $x_1, x_2, dots.c, x_n$ 满足 $x_1 x_2 dots.c x_n = 1$，证明

  $ (1 + x_1)(1 + x_2) dots.c (1 + x_n) >= 2^n. $

+ （伯努利（Bernoulli）不等式）设 $x > -1$，$n$ 为正整数，证明

  $ (1 + x)^n >= 1 + n x, $

  并讨论等号成立的条件.

+ 设 $x_k > -1$（$k = 1, 2, dots.c, n$）且诸 $x_k$ 符号相同，证明

  $ product_(k=1)^n (1 + x_k) >= 1 + sum_(k=1)^n x_k, $

  并讨论等号成立的条件.

+ 设 $a_1, a_2, dots.c, a_n$ 均为正实数，$f : \{1, 2, dots.c, n\} -> \{1, 2, dots.c, n\}$ 是一个双射，证明

  $ sum_(k=1)^n a_(f(k))/a_k >= n. $

+ 设 $a_1, a_2, dots.c, a_n in (0, 1)$，证明

  $ (sum_(k=1)^n a_k)(sum_(k=1)^n (1 - a_k)/a_k) >= n sum_(k=1)^n (1 - a_k). $

+ 设 $a, b, c, d$ 均是正实数，证明

  $ 1/(a + b)(1/c + 1/d) >= 1/(a c + b d) + 1/(a d + b c). $

+ 设正实数 $a_1, a_2, dots.c, a_n$ 满足 $a_1 + a_2 + dots.c + a_n = 1$，证明

  $ sum_(k=1)^n (a_k + 1/a_k)^2 >= ((n^2 + 1)^2)/n. $

+ 设 $A, B$ 是两个非空有限集且 $f : A -> B$. 证明集合 $\{(a, a') in A^2 : f(a) = f(a')\}$ 的元素个数至少是 $max(|A|, (|A|^2)/(|B|))$，这里 $|A|$ 和 $|B|$ 分别表示 $A$ 与 $B$ 的元素个数.

+ 设 $A, B$ 是 $RR$ 的两个有限非空子集，我们用 $E(A, B)$ 表示集合

  $ \{(a_1, a_2, b_1, b_2) in A times A times B times B : a_1 + b_1 = a_2 + b_2\} $

  的元素个数，并称之为 $A$ 与 $B$ 的加法能量（additive energy）. 证明：对 $RR$ 的任意三个有限非空子集 $A, B, C$ 有

  $ E(A, B union C)^(1/2) <= E(A, B)^(1/2) + E(A, C)^(1/2). $


#pagebreak(weak: true)


#v(0em)
== 习题 2.7

+ 证明命题 7.2.

+ 证明命题 7.5.

+ 计算 $log_8 (sqrt(2 + sqrt(3)) - sqrt(2 - sqrt(3)))$.

+ $sqrt(2)^(sqrt(3))$ 与 $sqrt(3)^(sqrt(2))$ 哪个大？

+ 证明 $log_10 2$ 是无理数.

+ 设非零实数 $a, b, c$ 满足 $2^a = 3^b = 6^c$，证明 $1/a + 1/b = 1/c$.

+ 证明 (2.12) — (2.15).

+ 设 $a, b, c$ 均是大于 $1$ 的实数，证明

  $ 2((log_a b)/(a + b) + (log_b c)/(b + c) + (log_c a)/(c + a)) >= 9/(a + b + c). $


#pagebreak(weak: true)


#v(0em)
== 习题 2.8

+ 证明命题 8.2.

+ 设 $|z| = 1$，求 $|z^2 - z + 1|$ 的最大值和最小值.

+ 证明复数域与实数域 $RR$ 不同构.

+ 设 $z_1, z_2$ 是两个复数，证明 $|z_1 + z_2|^2 + |z_1 - z_2|^2 = 2|z_1|^2 + 2|z_2|^2$.

+ 设 $z in CC without RR$，证明 $z + 1/z in RR$ 的充要条件是 $|z| = 1$.

+ 记 $bb(H) = \{z in CC : "Im" z > 0\}$. 证明：$f : z |-> z/(z + 1)$ 是从 $bb(H)$ 到 $bb(H)$ 的双射.

+ （柯西-施瓦茨不等式）设 $x_k, y_k$（$1 <= k <= n$）均是复数，证明

  $ abs(sum_(k=1)^n x_k overline(y_k)) <= (sum_(k=1)^n abs(x_k)^2)^(1/2) (sum_(k=1)^n abs(y_k)^2)^(1/2). $

+ 证明奇数次实系数多项式方程必有实根.

+ 设 $n$ 是一个正整数，$f$ 是一个 $n$ 次复系数多项式，$z_1, z_2, dots.c, z_(n+1)$ 是 $n + 1$ 个两两不同的复数. 证明：对任意的 $z in CC$ 有

  $ sum_(j=1)^(n+1) f(z_j) product_(k=1, k != j)^(n+1) (z - z_k)/(z_j - z_k) = f(z). $

+ 设 $x in CC$，若 $x$ 是某个有理系数多项式的根，则称 $x$ 为代数数（algebraic number），否则称 $x$ 为超越数（transcendental number）. 证明全体代数数所成之集是可数集，并由此推出超越数的存在性.


#pagebreak(weak: true)


= 第三章 数列的极限


#v(0em)
== 习题 3.1

+ 判断以下命题是否正确. 如果正确，请给出证明；如果错误，请举出反例：\
  （1）若数列 $\{x_n\}$ 的子列 $\{x_n\}_(n >= n_0)$ 收敛，则 $\{x_n\}$ 也收敛. \
  （2）若存在 $n_epsilon in ZZ_(> 0)$，使得对任意的 $n > n_epsilon$，均有 $|x_n - a| < 1/n$，则数列 $\{x_n\}$ 收敛于 $a$. \
  （3）若对任意的实数 $a$，均存在 $k in ZZ_(> 0)$，使得对任意的 $N in ZZ_(> 0)$，均存在 $n > N$ 满足 $|x_n - a| > 1/k$，则数列 $\{x_n\}$ 发散. \
  （4）若数列 $\{x_n\}$ 满足 $lim_(n -> oo) (x_(n+1) - x_n) = 0$，则 $\{x_n\}$ 收敛. \
  （5）若数列 $\{x_n\}$ 各项均不为 $0$，则 $\{x_n\}$ 是无穷大量当且仅当 $\{1/x_n\}$ 是无穷小量. \
  （6）无界数列要么有一个正无穷大量子列，要么有一个负无穷大量子列.

+ 利用定义证明：\
  （1）$lim_(n -> oo) (2n^2 - n + 1)/(n^2 + 1) = 2$；\
  （2）$lim_(n -> oo) (sqrt(n+1) - sqrt(n)) = 0$；\
  （3）$lim_(n -> oo) 3^n/(n!) = 0$；\
  （4）$lim_(n -> oo) n^n/(n!) = +oo$；\
  （5）$lim_(n -> oo) (-n^3 + 1)/(n - 2) = -oo$；\
  （6）$lim_(n -> oo) ((-1)^n n^2)/(n - sqrt(n)) = oo$.

+ 利用定义证明数列 $\{x_n\}$ 是发散的，其中：\
  （1）$x_n = (1 + (-1)^n)/2$；\
  （2）$x_n = sqrt(n) + 1/n$；\
  （3）$x_n = n^((-1)^n)$.

+ 计算 $union.big_(n=1)^(+oo) (1 + 1/n, 3)$ 及 $inter.big_(n=1)^(+oo) (1 - 1/n, 3)$.

+ 设 $\{x_n\}$ 是无穷小量且 $\{y_n\}$ 有界，证明 $\{x_n y_n\}$ 也是无穷小量.

+ 证明：如果 $lim_(n -> oo) x_n = a$，那么 $lim_(n -> oo) |x_n| = |a|$. 当 $a$ 为何值时这一命题的逆命题成立？

+ 设正数列 $\{x_n\}$ 以正数 $a$ 为极限，$k$ 是一个正整数，证明 $lim_(n -> oo) root(k, x_n) = root(k, a)$.

+ 证明数列 $\{x_n\}$ 收敛的充要条件是：子列 $\{x_(2n)\}$ 和 $\{x_(2n-1)\}$ 收敛于同一极限.

+ 设 $\{x_n\}$ 是一个数列，且三个子列 $\{x_(2n)\}$，$\{x_(2n+1)\}$ 及 $\{x_(3n)\}$ 均收敛，证明 $\{x_n\}$ 收敛.

+ 设三个数列 $\{x_n\}$，$\{y_n\}$ 和 $\{z_n\}$ 满足：

  $ mat(delim: "{", row-gap: #0.6em,
      x_(n+1) = (y_n + z_n)/2 "," ;
      y_(n+1) = (z_n + x_n)/2 "," ;
      z_(n+1) = (x_n + y_n)/2 ",") $

  $forall n in ZZ_(> 0)$. 证明这三个数列收敛于同一极限，并求该极限值.

+ （柯西）设 $lim_(n -> oo) x_n = a$，证明 $lim_(n -> oo) (x_1 + x_2 + dots.c + x_n)/n = a$.

+ 若 $\{x_n\}$ 收敛，证明在该数列中一定有最大数或最小数，但不一定同时有最大数和最小数.

+ 若 $\{x_n\}$ 是正无穷大量，证明在该数列中一定有最小数.

+ 设 $\{x_n\}$ 是一个数列，$phi$ 是正整数集 $ZZ_(> 0)$ 到自身的一个双射. 对每个正整数 $n$，记 $y_n = x_(phi(n))$（我们称数列 $\{y_n\}$ 为 $\{x_n\}$ 的一个重排）. 若 $lim_(n -> oo) x_n = a$，证明 $lim_(n -> oo) y_n = a$.


#pagebreak(weak: true)


#v(0em)
== 习题 3.2

+ 判断以下命题是否正确. 如果正确，请给出证明；如果错误，请举出反例：\
  （1）若数列 $\{x_n\}$ 和 $\{y_n\}$ 均发散，则 $\{x_n + y_n\}$ 与 $\{x_n dot y_n\}$ 也都发散. \
  （2）若 $lim_(n -> oo) x_n y_n = 0$，则 $\{x_n\}$ 和 $\{y_n\}$ 中至少有一个收敛于 $0$. \
  （3）若数列 $\{x_n\}$，$\{y_n\}$ 满足 $lim_(n -> oo) (x_n - y_n) = 0$，则 $lim_(n -> oo) x_n = lim_(n -> oo) y_n$. \
  （4）若数列 $\{x_n\}$ 收敛，且其每一项均不为 $0$，则 $lim_(n -> oo) x_(n+1)/x_n = 1$. \
  （5）若数列 $\{x_n\}$ 是正数列且 $lim_(n -> oo) x_(n+1)/x_n < 1$，则 $\{x_n\}$ 是无穷小量. \
  （6）若 $\{x_n\}$，$\{y_n\}$ 和 $\{z_n\}$ 满足 $x_n <= y_n <= z_n$（$forall n >= 1$）且 $lim_(n -> oo) (z_n - x_n) = 0$，则 $\{y_n\}$ 收敛.

+ 计算：\
  （1）$lim_(n -> oo) (5n^4 + 3n^2 - 2)/(n^4 - 4n + 1)$；\
  （2）$lim_(n -> oo) ((-2)^n + 3^n)/((-2)^(n+1) + 3^(n+1))$；\
  （3）$lim_(n -> oo) ((n+1)^alpha - n^alpha)$（$0 < alpha < 1$）；\
  （4）$lim_(n -> oo) root(n, a^n + b^n)$（$a, b > 0$）；\
  （5）$lim_(n -> oo) (log_a n)/n^b$（$a > 0$，$a != 1$，$b > 0$）；\
  （6）$lim_(n -> oo) 1/root(n, n!)$；\
  （7）$lim_(n -> oo) (1/sqrt(n^2 + 1) + 1/sqrt(n^2 + 2) + dots.c + 1/sqrt(n^2 + n))$；\
  （8）$lim_(n -> oo) (1 + 2^2 + dots.c + n^n)/n^n$.

+ 证明：$lim_(n -> oo) ((2n - 1)!!)/((2n)!!) = 0$.

+ 设 $I$ 是一个闭区间，$x_n in I$（$forall n$）且 $lim_(n -> oo) x_n = xi$，证明 $xi in I$. 如果把区间 $I$ 换成开区间，结论还成立吗？

+ 假设数列 $\{x_n\}$ 满足 $x_(n+1) = x_n^2 + 1$，试讨论其敛散性.

+ 设数列 $\{x_n\}$ 各项均为正数，且 $lim_(n -> oo) root(n, x_n) = a$. 证明当 $a < 1$ 时 $\{x_n\}$ 是无穷小量，当 $a > 1$ 时 $\{x_n\}$ 是无穷大量. 当 $a = 1$ 时，情况如何？

+ 设 $\{x_n\}$ 是一个正数列，且 $lim_(n -> oo) x_n = a$，证明 $lim_(n -> oo) root(n, x_1 x_2 dots.c x_n) = a$.

+ 设 $lim_(n -> oo) x_n = a$，求 $lim_(n -> oo) ([n x_n])/n$，这里 $[t]$ 为取整函数.

+ 对任一大于 $1$ 的自然数 $n$，以 $Omega(n)$ 表示 $n$ 的全部素因子的个数（按重数计算），证明：

  $ lim_(n -> oo) (Omega(n))/n = 0. $

+ 设 $\{F_n\}$ 为斐波那契（Fibonacci）数列，即

  $ F_0 = F_1 = 1, quad F_(n+1) = F_n + F_(n-1), quad forall n in ZZ_(> 0). $

  现令 $x_n = F_n/F_(n-1)$，证明数列 $\{x_n\}$ 收敛并求其极限.

+ 设函数 $f: RR -> RR_(>= 0)$ 满足：对任意的 $x, y in RR$ 有\
  （1）$f(x y) = f(x) f(y)$；\
  （2）$f(x + y) <= f(x) + f(y)$.\
  证明：$f(x + y) <= max(f(x), f(y))$ 对任意的 $x, y in RR$ 均成立的充要条件是

  $ f(n) <= 1, quad forall n in ZZ_(> 0). $


#pagebreak(weak: true)


#v(0em)
== 习题 3.3

+ 设 $x_n = 10/1 dot 11/3 dots.c (n+9)/(2n-1)$，证明 $lim_(n -> oo) x_n = 0$.

+ 设 $0 < a_1 < b_1$，且对任意的正整数 $n$ 有

  $ a_(n+1) = sqrt(a_n b_n), quad b_(n+1) = (a_n + b_n)/2. $

  证明数列 $\{a_n\}$，$\{b_n\}$ 收敛于同一极限.

+ 设 $x_n = 1 + 1/sqrt(2) + dots.c + 1/sqrt(n) - 2 sqrt(n)$（$forall n in ZZ_(> 0)$），证明 $\{x_n\}$ 收敛.

+ 设数列 $\{x_n\}$ 满足：

  $ x_1 = 3/2, quad x_(n+1) = (x_n^3 + 6)/7 quad (n = 1, 2, dots.c). $

  证明 $\{x_n\}$ 收敛并求其极限.

+ 设 $x_1 = 1$，$x_(n+1) = 1/(1 + x_n)$（$forall n in ZZ_(> 0)$），证明 $\{x_n\}$ 收敛并求其极限.

+ 设 $\{x_n\}$ 为正数列，且 $x_(n+1) + 1/x_n < 2$（$forall n in ZZ_(> 0)$），证明 $\{x_n\}$ 收敛并求其极限.

+ 用 $x_n$ 表示方程 $x + x^2 + dots.c + x^n = 1$ 在区间 $[0, 1]$ 中的根，证明 $\{x_n\}$ 收敛并求其极限.

+ 设 $f(x)$ 是定义在区间 $[0, 1]$ 上的函数，满足 $f(x) in [0, 1]$（$forall x in [0, 1]$）及

  $ |f(x) - f(y)| <= |x - y|/2, quad forall x, y in [0, 1]. $

  又设数列 $\{x_n\}$ 满足 $x_1 = 1/2$ 及

  $ x_(n+1) = (2 f(x_n) + x_n)/3, quad forall n in ZZ_(> 0). $

  证明 $\{x_n\}$ 收敛.

+ 设 $\{x_n\}$ 是一个正无穷大量，证明：$lim_(n -> oo) (1 + 1/x_n)^(x_n) = upright(e)$.

+ 计算 $lim_(n -> oo) (1/(n+1) + 1/(n+2) + dots.c + 1/(2n))$.

+ 计算 $lim_(n -> oo) (1 + 1/3 + dots.c + 1/(2n-1))/(log n)$.

+ 设 $\{x_n\}$ 单调递增，如果它不收敛，证明它必是正无穷大量.

+ 设 $r in (0, 1)$ 是一个给定的实数，$x_n = (1 + r)(1 + r^2) dots.c (1 + r^n)$，证明 $\{x_n\}$ 收敛.

+ 如果将闭区间套定理中的每个闭区间的端点 $a_n, b_n$ 均限定为有理数，结论还成立吗？

+ 在闭区间套定理中，把每个闭区间都换成开区间，结论还成立吗？

+ 证明：每个有界闭区间都可写成一列递减的开区间的交，每个有界开区间都可写成一列递增的闭区间的并.

+ 如果无界数列 $\{x_n\}$ 不是无穷大量，证明其必有收敛子列.

+ 设数列 $\{x_n\}$ 满足 $x_(m+n) <= x_m + x_n$（$forall m, n$），并且 $\{x_n/n\}$ 有下界，证明 $\{x_n/n\}$ 收敛.

+ 利用闭区间套定理证明确界原理.

+ （1）证明任一数列必有单调子列；\
  （2）利用单调有界收敛原理证明波尔查诺-魏尔斯特拉斯定理.

+ 利用波尔查诺-魏尔斯特拉斯定理证明单调有界收敛原理.

+ 利用戴德金定理证明波尔查诺-魏尔斯特拉斯定理.

+ 利用闭区间套定理证明有限覆盖定理.

+ 利用有限覆盖定理证明波尔查诺-魏尔斯特拉斯定理.


#pagebreak(weak: true)


#v(0em)
== 习题 3.4

+ 设 $\{x_n\}$ 是一个柯西列，证明其任意子列也都是柯西列.

+ 当 $\{x_n\}$ 满足下面某一个条件时，$\{x_n\}$ 是否一定是柯西列？\
  （1）对任意的 $n, p in ZZ_(> 0)$ 有 $|x_(n+p) - x_n| <= p/n$；\
  （2）对任意的 $n, p in ZZ_(> 0)$ 有 $|x_(n+p) - x_n| <= p/n^2$.

+ 设 $x_1 > 0$，$x_(n+1) = frac(c(1 + x_n), c + x_n)$ $(c > 1)$，证明 $\{x_n\}$ 收敛并求其极限.

+ 设数列 $\{a_n\}, \{b_n\}$ 满足 $a_1 = b_1 = 1$，且

  $ a_(n+1) = a_n + 2b_n, quad b_(n+1) = a_n + b_n, quad forall n in ZZ_(> 0). $

  证明极限 $lim_(n -> oo) a_n/b_n$ 存在并求其值.

+ 设 $r in (0, 1)$，数列 $\{x_n\}$ 满足

  $ x_(n+2) = x_(n+1) + r^n x_n, quad forall n in ZZ_(> 0). $

  证明 $\{x_n\}$ 收敛.

+ （压缩映像原理）设 $I$ 是一个闭区间，$f: I -> I$，我们记 $f_1 = f$ 以及 $f_(n+1) = f compose f_n$. 现设存在正整数 $k$ 和常数 $theta in (0, 1)$，使得对任意的 $x, y in I$ 有

  $ |f_k (x) - f_k (y)| <= theta |x - y|, $

  证明存在唯一的 $a in I$ 使得 $f(a) = a$.

+ 利用有限覆盖定理证明柯西收敛准则.

设 $\{x_n\}$ 是由有理数组成的数列，如果对任意的 $epsilon in QQ_(> 0)$，均存在正整数 $n_epsilon$，使得

$ |x_m - x_n| < epsilon, quad forall m, n >= n_epsilon, $

那么称 $\{x_n\}$ 是一个 $QQ$ 上的柯西列. 从第 8 题到第 20 题是一组题，介绍如何利用 $QQ$ 上的柯西列来定义实数，以及如何定义实数的运算.

#[
  #set enum(numbering: n => numbering("1.", n + 7))

  + 以 $X$ 表示 $QQ$ 上的全体柯西列所成之集，设 $R$ 是从 $X$ 到 $X$ 的一个关系，满足：$(\{a_n\}, \{a'_n\}) in R$ 当且仅当对任意的 $epsilon in QQ_(> 0)$，均存在正整数 $n_epsilon$，使得

    $ |a_n - a'_n| < epsilon, quad forall n >= n_epsilon. $

    证明 $R$ 是 $X$ 上的等价关系. 在接下来的诸题中我们将 $(\{a_n\}, \{a'_n\}) in R$ 简记为 $\{a_n\} tilde.op \{a'_n\}$，并且把由 $R$ 所确定的每个等价类称为一个实数，同时沿用习题 1.2 第 29 题中的记号，即将 $\{a_n\}$ 所在的等价类记作 $overline(\{a_n\})$.

  + 设 $\{a_n\}$ 和 $\{b_n\}$ 都是 $QQ$ 上的柯西列，证明 $\{a_n + b_n\}$ 与 $\{-a_n\}$ 也均是 $QQ$ 上的柯西列.

  + 设 $\{a_n\} tilde.op \{a'_n\}$，$\{b_n\} tilde.op \{b'_n\}$，证明

    $ \{a_n + b_n\} tilde.op \{a'_n + b'_n\}. $

    因此我们可以按如下方式来定义实数的加法：

    $ overline(\{a_n\}) + overline(\{b_n\}) = overline(\{a_n + b_n\}). $

  + 证明通项恒等于 $0$ 的数列所在的等价类是上述加法运算下的零元.

  + 设 $\{a_n\} tilde.op \{a'_n\}$，证明

    $ \{-a_n\} tilde.op \{-a'_n\}. $

    并说明 $overline(\{-a_n\})$ 是 $overline(\{a_n\})$ 的负元.

  + 如果 $\{a_n\}$ 是 $QQ$ 上的柯西列，那么 $\{a_n\}$ 有界.

  + 设 $\{a_n\}$ 和 $\{b_n\}$ 都是 $QQ$ 上的柯西列，证明 $\{a_n b_n\}$ 也是 $QQ$ 上的柯西列.

  + 设 $\{a_n\} tilde.op \{a'_n\}$，$\{b_n\} tilde.op \{b'_n\}$. 证明 $\{a_n b_n\} tilde.op \{a'_n b'_n\}$. 因此我们可以按如下方式来定义实数的乘法：

    $ overline(\{a_n\}) dot.c overline(\{b_n\}) = overline(\{a_n b_n\}). $

  + 证明通项恒等于 $1$ 的数列所在的等价类是上述乘法运算下的乘法幺元.

  + 设 $\{a_n\}$ 是 $QQ$ 上的柯西列，且它所在的等价类不是零元，证明：\
    （1）存在 $epsilon_0 in QQ_(> 0)$ 以及一个与 $\{a_n\}$ 等价的柯西列 $\{a'_n\}$，使得\
    $ |a'_n| >= epsilon_0, quad forall n in ZZ_(> 0); $\
    （2）$\{1/a'_n\}$ 是 $QQ$ 上的柯西列.

  + 设 $\{a_n\} tilde.op \{a'_n\}$，且它们所在的等价类不是零元. 又设存在 $epsilon_0 in QQ_(> 0)$ 使得

    $ |a_n| >= epsilon_0, quad |a'_n| >= epsilon_0, quad forall n in ZZ_(> 0). $

    证明 $\{1/a_n\} tilde.op \{1/a'_n\}$.

  + 设 $\{a_n\}$ 满足上题条件，证明 $overline(\{a_n\}) dot.c overline(\{frac(1, a_n)\})$ 等于乘法幺元.

  + 证明按上述方式定义的实数集是一个域.

]


#pagebreak(weak: true)


#v(0em)
== 习题 3.5

+ 计算 $underline(lim)_(n -> oo) x_n$ 和 $overline(lim)_(n -> oo) x_n$，其中：\
  （1）$x_n = frac((-1)^n, n) + frac(1 + (-1)^n, 2)$；\
  （2）$x_n = 1 + n(-1)^n$；\
  （3）$x_n = 2(-1)^([frac(n, 2)]) + (-1)^n$；\
  （4）$x_n = e^(n(-1)^n)$.

+ 证明：对任意有界数列 $\{x_n\}$ 有 $underline(lim)_(n -> oo) x_n = - overline(lim)_(n -> oo) (-x_n)$.

+ 设 $\{x_n\}, \{y_n\}$ 均是有界数列，证明：\
  （1）$underline(lim)_(n -> oo) x_n + underline(lim)_(n -> oo) y_n <= underline(lim)_(n -> oo) (x_n + y_n) <= underline(lim)_(n -> oo) x_n + overline(lim)_(n -> oo) y_n$；\
  （2）$underline(lim)_(n -> oo) x_n + overline(lim)_(n -> oo) y_n <= overline(lim)_(n -> oo) (x_n + y_n) <= overline(lim)_(n -> oo) x_n + overline(lim)_(n -> oo) y_n$.

+ 设 $\{x_n\}, \{y_n\}$ 均是有界数列，且 $x_n >= 0$，$y_n >= 0$（$forall n in ZZ_(> 0)$）. 证明：\
  （1）$underline(lim)_(n -> oo) x_n dot.c underline(lim)_(n -> oo) y_n <= underline(lim)_(n -> oo) (x_n dot.c y_n) <= underline(lim)_(n -> oo) x_n dot.c overline(lim)_(n -> oo) y_n$；\
  （2）$underline(lim)_(n -> oo) x_n dot.c overline(lim)_(n -> oo) y_n <= overline(lim)_(n -> oo) (x_n dot.c y_n) <= overline(lim)_(n -> oo) x_n dot.c overline(lim)_(n -> oo) y_n$.

+ 设数列 $\{x_n\}$ 有界，$\{y_n\}$ 收敛，证明：\
  （1）$underline(lim)_(n -> oo) (x_n + y_n) = underline(lim)_(n -> oo) x_n + lim_(n -> oo) y_n$；\
  （2）$overline(lim)_(n -> oo) (x_n + y_n) = overline(lim)_(n -> oo) x_n + lim_(n -> oo) y_n$；\
  （3）若 $y_n >= 0$（$forall n in ZZ_(> 0)$），则\
  $ underline(lim)_(n -> oo) (x_n dot.c y_n) = underline(lim)_(n -> oo) x_n dot.c lim_(n -> oo) y_n quad "且" quad overline(lim)_(n -> oo) (x_n dot.c y_n) = overline(lim)_(n -> oo) x_n dot.c lim_(n -> oo) y_n. $

+ 设 $\{x_n\}$ 是有上界的正数列，且 $overline(lim)_(n -> oo) x_n dot.c underline(lim)_(n -> oo) frac(1, x_n) = 1$，证明：$\{x_n\}$ 收敛.

+ 设 $\{x_n\}$ 是一个正数列，证明：

  $ underline(lim)_(n -> oo) frac(x_(n+1), x_n) <= underline(lim)_(n -> oo) root(n, x_n) <= overline(lim)_(n -> oo) root(n, x_n) <= overline(lim)_(n -> oo) frac(x_(n+1), x_n). $

+ 证明：$lim_(n -> oo) frac(n, root(n, n!)) = upright(e)$.

+ 假设对任意的正整数 $n$ 均有 $x_n >= 0$，证明 $overline(lim)_(n -> oo) root(n, x_n) <= 1$ 的充要条件是：对任意的实数 $ell > 1$ 均有

  $ lim_(n -> oo) frac(x_n, ell^n) = 0. $

+ 设 $\{x_n\}$ 是一个正数列，\
  （1）证明\
  $ overline(lim)_(n -> oo) n (frac(1 + x_(n+1), x_n) - 1) >= 1. $\
  （2）证明存在正数列 $\{x_n\}$ 满足\
  $ overline(lim)_(n -> oo) n (frac(1 + x_(n+1), x_n) - 1) = 1. $\
  这意味着（1）中的下界是最优的.

+ 设有界数列 $\{x_n\}$ 满足 $underline(lim)_(n -> oo) (x_(2n) + 2x_n) = 0$，证明 $lim_(n -> oo) x_n = 0$.

+ 设有界数列 $\{x_n\}$ 发散，记

  $ h = underline(lim)_(n -> oo) x_n quad "及" quad H = overline(lim)_(n -> oo) x_n. $

  证明：若 $underline(lim)_(n -> oo) (x_n - x_(n-1)) = 0$ 或 $overline(lim)_(n -> oo) (x_n - x_(n-1)) = 0$，那么 $\{x_n : n in ZZ_(> 0)\}$ 在区间 $[h, H]$ 上稠密（所谓稠密，是指 $[h, H]$ 的任意开子区间中都有 $\{x_n\}$ 中的元素）.

+ 对实数 $t$ 用 $[t]$ 表示不超过 $t$ 的最大整数，证明集合 $\{log n - [log n] : n in ZZ_(> 0)\}$ 在 $[0, 1]$ 上稠密.


#pagebreak(weak: true)


#v(0em)
== 习题 3.6

+ 计算 $lim_(n -> oo) frac(1^2 + 3^2 + dots.c + (2n - 1)^2, n^3)$.

+ 计算 $lim_(n -> oo) frac(1 + frac(1, sqrt(2)) + dots.c + frac(1, sqrt(n)), sqrt(n))$.

+ 设 $k$ 是正整数，计算 $lim_(n -> oo) frac(1^k + 2^k + dots.c + n^k, n^(k+1))$.

+ 设 $\{x_n\}$ 各项均不为 $0$ 且严格单调递增，满足 $2x_n < x_(n+1) + x_(n-1)$（$forall n >= 2$）. 证明数列 $\{frac(n, x_n)\}$ 收敛.

+ 设 $x_1 = 1$，$x_(n+1) = x_n + frac(1, x_n)$（$forall n in ZZ_(> 0)$），证明 $lim_(n -> oo) frac(x_n, sqrt(2n)) = 1$.

+ 设 $x_1 = 1$，$x_(n+1) = x_n (1 - frac(x_n, 2))$（$forall n in ZZ_(> 0)$），证明 $lim_(n -> oo) n x_n = 2$.

+ 设 $k$ 是一个正整数，且正数列 $\{x_n\}$ 满足 $lim_(n -> oo) x_n (x_1^k + x_2^k + dots.c + x_n^k) = 1$. 证明

  $ lim_(n -> oo) n x_n^(k+1) = frac(1, k + 1). $

+ 试举反例说明施托尔茨定理的逆命题未必成立.

+ 设 $lim_(n -> oo) x_n = a$，$lim_(n -> oo) y_n = b$，证明

  $ lim_(n -> oo) frac(x_1 y_n + x_2 y_(n-1) + dots.c + x_n y_1, n) = a b. $


#pagebreak(weak: true)


= 第四章 级数


#v(0em)
== 习题 4.1

+ 如果级数 $sum_(n=1)^oo u_n$ 与 $sum_(n=1)^oo v_n$ 均发散，那么 $sum_(n=1)^oo (u_n + v_n)$ 是否发散？

+ 如果级数 $sum_(n=1)^oo u_n$ 与 $sum_(n=1)^oo v_n$ 中一个收敛而另一个发散，那么 $sum_(n=1)^oo (u_n + v_n)$ 的敛散性如何？

+ 如果 $sum_(n=1)^oo u_(2n-1)$ 和 $sum_(n=1)^oo u_(2n)$ 均收敛，那么 $sum_(n=1)^oo u_n$ 是否收敛？

+ 由 $sum_(n=1)^oo (u_(2n-1) + u_(2n))$ 收敛能否推出 $sum_(n=1)^oo u_n$ 收敛？

+ 设级数 $sum_(n=1)^oo u_n$ 满足 $lim_(n -> oo) u_n = 0$ 且 $sum_(n=1)^oo (u_(2n-1) + u_(2n))$ 收敛，证明：$sum_(n=1)^oo u_n$ 收敛.

+ 判断下列级数的敛散性：\
  （1）$sum_(n=2)^oo 1/root(n, log n)$；\
  （2）$sum_(n=1)^oo 1/(n(n+1))$；\
  （3）$sum_(n=1)^oo n^3/(3^n - 1)$；\
  （4）$sum_(n=1)^oo log(1 + 1/n)$；\
  （5）$1 + 1/2 - 1/3 + 1/4 + 1/5 - 1/6 + dots.c$

+ 证明下列级数收敛并计算级数的和：\
  （1）$sum_(n=1)^oo (1/2^n + (-1)^n/3^n)$；\
  （2）$sum_(n=1)^oo (sqrt(n+2) - 2 sqrt(n+1) + sqrt(n))$；\
  （3）$sum_(n=1)^oo (-1)^(n-1)/n$；\
  （4）$sum_(n=2)^oo 1/(n^2 - 1)$；\
  （5）$sum_(n=1)^oo 1/((2n-1)2n(2n+1))$.

+ 设 $s > 0$，证明：级数 $sum_(n=1)^oo (-1)^n/n^s$ 收敛.

+ 设 $u_1 = 2$，$u_(n+1) = u_n^2 - u_n + 1$（$forall n >= 1$），证明级数 $sum_(n=1)^oo 1/u_n$ 收敛并求其和.

+ 把级数 $sum_(n=1)^oo 1/n$ 中分母含有数字 9 的项全部删去，证明：所得新级数收敛，且其和不超过 80.

+ 设 $A$ 是正整数集的一个无限子集. 对任意的正整数 $n$，以 $f(n)$ 表示集合 $A inter [1, n]$ 中的元素个数. 如果存在正常数 $c > 0$，使得 $lim_(n -> oo) f(n)/n = c$，证明：级数 $sum_(a in A) 1/a$ 发散，这里 $sum_(a in A)$ 表示将 $A$ 中元素从小到大排列后进行求和.


#pagebreak(weak: true)


#v(0em)
== 习题 4.2

+ 证明定理 2.7.

+ 判断下列级数的敛散性：\
  （1）$sum_(n=2)^oo log^beta n/n^alpha$；\
  （2）$sum_(n=1)^oo 2019^n/n!$；\
  （3）$sum_(n=2)^oo n^(log n)/log^n n$；\
  （4）$sum_(n=1)^oo n^(n + 1/n)/(n + 1/n)^n$；\
  （5）$sum_(n=1)^oo (root(3, n+1) - root(3, n-1))/n^alpha$；\
  （6）$sum_(n=1)^oo (a(a+1) dots.c (a+n-1))/n! dot 1/n^b$，$(a, b in QQ_(> 0))$.

+ 已知正项级数 $sum_(n=1)^oo u_n$ 与 $sum_(n=1)^oo v_n$ 均发散，试讨论下列级数的敛散性：\
  （1）$sum_(n=1)^oo max(u_n, v_n)$；\
  （2）$sum_(n=1)^oo min(u_n, v_n)$.

+ 设 $sum_(n=1)^oo u_n$ 是一个收敛的正项级数，证明：级数 $sum_(n=1)^oo u_n/(1 + u_n)$ 也收敛.

+ 设 $\{F_n\}$ 为斐波那契数列，即 $F_0 = F_1 = 1$，$F_(n+1) = F_n + F_(n-1)$（$forall n in ZZ_(> 0)$）. 证明：$sum_(n=1)^oo 1/F_n$ 收敛.

+ 设正项级数 $sum_(n=1)^oo u_n$ 收敛，证明：$sum_(n=1)^oo u_n^2$ 也收敛. 这一命题的逆命题成立吗？

+ 设级数 $sum_(n=1)^oo a_n$ 与 $sum_(n=1)^oo c_n$ 均收敛，且对任意的正整数 $n$ 有 $a_n <= b_n <= c_n$，证明：级数 $sum_(n=1)^oo b_n$ 也收敛.

+ 设正项级数 $sum_(n=1)^oo u_n$ 的通项单调递减，且 $sum_(n=1)^oo u_(2n)$ 收敛，证明：$sum_(n=1)^oo u_n$ 收敛.

+ 设正项级数 $sum_(n=1)^oo u_n$ 收敛且 $\{u_n\}$ 单调递减，证明当 $n -> oo$ 时 $u_n = o(1/n)$.

+ 试构造一个满足 $u_n != o(1/n)$（当 $n -> oo$ 时）的收敛的正项级数 $sum_(n=1)^oo u_n$.

+ 设 $sum_(n=1)^oo u_n$，$sum_(n=1)^oo v_n$ 是两个正项级数，$sum_(n=1)^oo u_n$ 收敛且 $sum_(n=1)^oo v_n$ 发散，问是否一定存在常数 $c$ 使得 $u_n <= c v_n$（$forall n >= 1$）？

+ 设 $\{u_n\}$ 是单调递减的正数列，证明：级数 $sum_(n=1)^oo u_n$ 与数列 $\{1/u_(n+1) - 1/u_n\}$ 不可能同时收敛.

+ （库默尔（Kummer）判别法）设 $u_n, v_n > 0$（$forall n in ZZ_(> 0)$）. 证明：\
  （1）若存在正实数 $kappa$，使得

  $ frac(v_n, v_(n+1)) u_n - u_(n+1) >= kappa, quad forall n in ZZ_(> 0), $

  则级数 $sum_(n=1)^oo v_n$ 收敛；\
  （2）若级数 $sum_(n=1)^oo 1/u_n$ 发散，且

  $ frac(v_n, v_(n+1)) u_n - u_(n+1) <= 0, quad forall n in ZZ_(> 0), $

  则级数 $sum_(n=1)^oo v_n$ 发散.

+ （罗巴切夫斯基（Лобачевский）判别法）设正项级数 $sum_(n=1)^oo u_n$ 的通项单调递减趋于 $0$，并记

  $ p_m = max {n in ZZ_(> 0) : u_n >= 1/2^m}, quad forall m in ZZ_(> 0). $

  证明：级数 $sum_(n=1)^oo u_n$ 与 $sum_(m=1)^oo p_m/2^m$ 具有相同的敛散性.

+ 设 $sum_(n=1)^oo u_n$ 是一个收敛的正项级数，记 $r_n = sum_(k=n+1)^oo u_k$ 为它的第 $n$ 个余和，并记

  $ v_n = sqrt(r_(n-1)) - sqrt(r_n), quad forall n in ZZ_(> 0). $

  证明：级数 $sum_(n=1)^oo v_n$ 也是一个收敛的正项级数，且有 $u_n = o(v_n)$.

+ 设 $sum_(n=1)^oo u_n$ 是一个发散的正项级数，记 $S_n = sum_(k=1)^n u_k$ 为其部分和，并记

  $ v_n = u_n/S_n, quad forall n in ZZ_(> 0). $

  证明：级数 $sum_(n=1)^oo v_n$ 也是一个发散的正项级数，且有 $v_n = o(u_n)$.

+ 设 $gamma - beta > 1$，证明 $F(1, beta, gamma, 1) = frac(gamma - 1, gamma - beta - 1)$，其中 $F$ 如例 2.14 所定义.


#pagebreak(weak: true)


#v(0em)
== 习题 4.3

+ 判断下列级数的敛散性：\
  （1）$sum_(n=1)^oo (-1)^n (log n)/n$；\
  （2）$sum_(n=1)^oo frac((-1)^n, sqrt(n)) (1 + 1/2 + dots.c + 1/n - log n)$；\
  （3）$sum_(n=2)^oo frac((-1)^n, log^2 n) (1 + 1/2 + dots.c + 1/n)$.

+ 如果级数 $sum_(n=1)^oo u_n$ 与 $sum_(n=1)^oo v_n$ 均收敛，那么 $sum_(n=1)^oo u_n v_n$ 是否一定收敛？

+ 设数列 $\{u_n\}$ 与 $\{v_n\}$ 满足 $lim_(n -> oo) u_n/v_n = 1$. 若级数 $sum_(n=1)^oo u_n$ 收敛，则是否能得出级数 $sum_(n=1)^oo v_n$ 也收敛？

+ 设级数 $sum_(n=1)^oo a_n$ 收敛，$\{b_n\}$ 为严格单调递增的正数列且 $lim_(n -> oo) b_n = +oo$. 证明：当 $n -> oo$ 时有

  $ sum_(k=1)^n a_k b_k = o(b_n). $

+ 设 $0 < u_n <= 1/log^2 n$（$forall n >= 2$），证明级数 $sum_(n=1)^oo (u_(n+1) - u_n) log n$ 收敛.

+ 对正整数 $N$ 证明：存在常数 $c$ 使得

  $ abs(sum_(n <= N) (-1)^n log n) >= c log N. $

  这意味着例 3.2 中的估计几乎是最好的.


#pagebreak(weak: true)


#v(0em)
== 习题 4.4

+ 讨论下列级数的绝对收敛性和条件收敛性：\
  （1）$sum_(n=2)^oo ((-1)^n)/(n log n)$；\
  （2）$sum_(n=1)^oo (-1)^n (n-1)/(n+1) dot.c 1/root(2019, n)$；\
  （3）$sum_(n=1)^oo ((-1)^n)/(n^(p + 1/n))$；\
  （4）$sum_(n=1)^oo (-1)^n (root(n, n) - 1)$.

+ 设 $sum_(n=1)^oo u_n$ 条件收敛，$sum_(n=1)^oo v_n$ 绝对收敛，证明：$sum_(n=1)^oo (u_n + v_n)$ 条件收敛.

+ （柯西－施瓦茨不等式）设级数 $sum_(n=1)^oo u_n^2$ 与 $sum_(n=1)^oo v_n^2$ 均收敛，证明 $sum_(n=1)^oo u_n v_n$ 绝对收敛，且有

  $ (sum_(n=1)^oo |u_n v_n|)^2 <= (sum_(n=1)^oo u_n^2)(sum_(n=1)^oo v_n^2). $

+ 设级数 $sum_(n=1)^oo u_n^2$ 收敛，证明 $sum_(n=1)^oo u_n/n$ 绝对收敛.

+ 设级数 $sum_(n=1)^oo u_n$ 条件收敛，记

  $ S_n^+ = sum_(k=1)^n u_k^+ quad "及" quad S_n^- = sum_(k=1)^n u_k^-. $

  证明 $lim_(n -> oo) (S_n^+)/(S_n^-) = 1$.

+ 研究级数 $1 - 1/(2^alpha) + 1/(3^beta) - 1/(4^alpha) + 1/(5^beta) - 1/(6^alpha) + dots.c$ 的敛散性，并在收敛时讨论其条件收敛和绝对收敛性.

+ 将级数 $sum_(n=1)^oo ((-1)^(n-1))/n^alpha$ 的项重排，依序先排 $p$ 个正项，接着依序排 $q$ 个负项，之后再依序排 $p$ 个正项和 $q$ 个负项，如此交替下去. 证明：\
  （1）若 $alpha > 1$，则重排级数的和与原级数的和相同；\
  （2）若 $alpha = 1$，则重排级数的和为 $log (2 sqrt(p/q))$；\
  （3）若 $0 < alpha < 1$，则重排级数仅在 $p = q$ 时收敛.

+ 假设对任意无穷小量 $\{x_n\}$ 而言级数 $sum_(n=1)^oo x_n u_n$ 均收敛，证明 $sum_(n=1)^oo u_n$ 绝对收敛.

+ 设级数 $sum_(n=1)^oo u_n$ 条件收敛，其和为 $S$，又设 $sigma: ZZ_(> 0) -> ZZ_(> 0)$ 是双射，且重排级数 $sum_(n=1)^oo u_(sigma(n))$ 收敛于 $S' != S$. 证明：对于任意的 $rho > 0$，均存在正整数 $n$，使得 $|sigma(n) - n| > rho$.

+ 设正项级数 $sum_(n=1)^oo 1/u_n$ 收敛. \
  （1）证明：若 $u_n$ 单调递增，则级数 $sum_(n=1)^oo n/(u_1 + u_2 + dots.c + u_n)$ 收敛；\
  （2）对一般情形证明级数 $sum_(n=1)^oo n/(u_1 + u_2 + dots.c + u_n)$ 收敛.


#pagebreak(weak: true)


#v(0em)
== 习题 4.5

+ 试求 $sum_(n=1)^oo a_n$ 与 $sum_(n=1)^oo b_n$ 的柯西乘积，并研究其敛散性：\
  （1）$a_n = b_n = q^n$，其中 $|q| < 1$；\
  （2）$a_n = x^n$，$b_n = (-x)^n$，其中 $|x| < 1$；\
  （3）$a_n = 1/n!$，$b_n = ((-1)^n)/n!$；\
  （4）$a_n = 1/n^alpha$，$b_n = 1/n^beta$，其中 $alpha, beta > 0$；

+ 记 $E(x) = sum_(n=0)^oo x^n/n!$，证明：这一级数对任意的 $x in RR$ 收敛且有

  $ E(x+y) = E(x)E(y), quad forall x, y in RR. $

+ 假设 $a_0 = b_0 = 1$，当 $n >= 1$ 时，

  $ a_n = -(3/2)^n, quad b_n = (3/2)^(n-1) (2^n + 1/(2^(n+1))). $

  证明：$sum_(n=0)^oo a_n$ 与 $sum_(n=0)^oo b_n$ 均发散，但是它们的柯西乘积绝对收敛.

+ 对给定的实数 $nu$ 记 $sigma_nu (n) = sum_(d divides n) d^nu$，证明：

  $ sum_(n=1)^oo (sigma_nu (n))/n^s = zeta(s) zeta(s - nu), quad forall s > max(1, nu + 1). $

  特别地，取 $nu = 0$ 可得 $sum_(n=1)^oo (tau(n))/n^s = zeta(s)^2$ $(forall s > 1)$，其中 $tau(n)$ 为除数函数.

从第 5 题到第 9 题是一组题，讨论狄利克雷级数的敛散性.

#[
  #set enum(numbering: n => numbering("1.", n + 4))

  + 证明：存在唯一的 $sigma_a$（可以是实数，$+oo$ 或 $-oo$），使得级数 $sum_(n=1)^oo |a_n|/n^s$ 当 $s > sigma_a$ 时收敛，当 $s < sigma_a$ 时发散. 我们称 $sigma_a$ 为狄利克雷级数 $sum_(n=1)^oo a_n/n^s$ 的绝对收敛横坐标 (abscissa of absolute convergence).

  + 证明：存在唯一的 $sigma_c$（可以是实数，$+oo$ 或 $-oo$），使得级数 $sum_(n=1)^oo a_n/n^s$ 当 $s > sigma_c$ 时收敛，当 $s < sigma_c$ 时发散. $sigma_c$ 被称为狄利克雷级数 $sum_(n=1)^oo a_n/n^s$ 的收敛横坐标 (abscissa of convergence).

  + 设 $sigma_a, sigma_c in RR$，证明 $0 <= sigma_a - sigma_c <= 1$，并举例说明这一不等式不能被改进.

  + 假设级数 $sum_(n=1)^oo a_n$ 发散，并记 $S_n = sum_(k=1)^n a_k$. 证明：

    $ sigma_c = limits(overline(lim))_(n -> oo) (log |S_n|)/(log n). $

  + 假设级数 $sum_(n=1)^oo a_n$ 收敛，并记 $r_n = sum_(k=n+1)^oo a_k$. 证明：

    $ sigma_c = limits(overline(lim))_(n -> oo) (log |r_n|)/(log n). $

]


#pagebreak(weak: true)


#v(0em)
== 习题 4.6

+ 函数 $f(x) = sin x^2$ 是否是 $RR$ 上的周期函数？请说明理由.

+ 设 $x_j in (0, pi/2)$ $(1 <= j <= n)$，证明：

  $ sin(x_1 + x_2 + dots.c + x_n) <= sin x_1 + sin x_2 + dots.c + sin x_n. $

+ 设 $x, y in (0, pi/2)$ 满足 $(cos x)/(sin y) + (cos y)/(sin x) = 2$，证明 $x + y = pi/2$.

+ （棣莫弗 (De Moivre)）证明：对任意的 $x in RR$ 及 $n in ZZ$ 有 $(e^(i x))^n = e^(i n x)$.

+ 设 $n$ 是正整数，$theta in RR$，证明：

  $ sum_(k=0)^n binom(n, k) cos k theta = 2^n cos^n (theta/2) cos ((n theta)/2). $

+ 设 $z$ 是非零复数，证明

  $ |z - 1| <= ||z| - 1| + |z| dot.c arg z, $

  并说明等号成立之条件.

+ 设 $z_1, z_2$ 是两个非零复数且存在 $delta in (0, 1)$ 使得 $|arg z_1 - arg z_2| <= delta$，证明：

  $ |z_1 + z_2| >= (1 - delta)(|z_1| + |z_2|). $

  注意将本题与第二章命题 8.5 (6) 做比较.

+ 证明：数列 $\{sin n\}$ 发散.

+ 在承认 $pi$ 是无理数的前提下证明：$limits(overline(lim))_(n -> oo) cos n = 1$.

+ 设 $f(x) = theta sin x + a$，其中 $0 < theta < 1$. 令 $x_(n+1) = f(x_n)$ $(forall n in ZZ_(>= 0))$，证明：数列 $\{x_n\}$ 收敛于开普勒 (Kepler) 方程 $x = theta sin x + a$ 的解.

+ 判断下列级数的敛散性：\
  （1）$sum_(n=1)^oo sin n$；\
  （2）$sum_(n=1)^oo ((-1)^n cos n)/n$；\
  （3）$sum_(n=1)^oo sin (pi sqrt(n^2 + 1))$；\
  （4）$sum_(n=1)^oo (sin n sin n^2)/n$.

+ 计算 $sum_(n=1)^oo arctan 1/(2n^2)$.

+ 设 $r in (-1, 1)$，证明：

  $ sum_(n=0)^oo r^n cos n x = (1 - r cos x)/(1 - 2r cos x + r^2), quad sum_(n=0)^oo r^n sin n x = (r sin x)/(1 - 2r cos x + r^2). $

+ 设 $x in (0, pi]$，$N in ZZ_(>= 2)$，在承认不等式 $sin theta/theta >= 2/pi$ $(0 < theta <= pi/2)$ 的前提下证明：存在常数 $c > 0$ 使得

  $ |sum_(n=1)^N (log n) sin n x| <= c(log N) dot.c min(N^2 x, 1/x). $

+ 设 $t in RR$，试对 $x in (0, 1)$ 讨论级数 $sum_(n=1)^oo (cos (t log n))/n^x$ 的敛散性.

+ 证明：平面上的直线方程的复数形式是 $bar(beta) z + beta bar(z) + gamma = 0$，其中 $beta in CC$ 且 $beta != 0, gamma in RR$.

+ 证明：平面上的圆的方程的复数形式是 $alpha z bar(z) + bar(beta) z + beta bar(z) + gamma = 0$，其中 $alpha != 0, alpha, gamma in RR$，$beta in CC$，$|beta|^2 - alpha gamma > 0$.


#pagebreak(weak: true)


= 第五章 函数的极限


#v(0em)
== 习题 5.1

+ 证明命题 1.3.

+ 证明 $lim_(x -> oo) f(x) = a$ 的充要条件是 $lim_(x -> +oo) f(x) = lim_(x -> -oo) f(x) = a$.

+ 设 $lim_(x -> x_0) f(x) = a$，证明 $lim_(x -> x_0) |f(x)| = |a|$.

+ 用严格的数学语言表述：\
  （1）$lim_(x -> x_0) f(x) = +oo$；\
  （2）$lim_(x -> +oo) f(x) = -oo$；\
  （3）当 $x -> -oo$ 时 $f(x)$ 不趋于 $A$；\
  （4）当 $x -> x_0$ 时 $f(x)$ 不趋于 $oo$.

+ 利用极限的定义证明：\
  （1）$lim_(x -> 2) x^2 = 4$；\
  （2）$lim_(x -> 1) frac(1, (1 - x)^2) = +oo$；\
  （3）$lim_(x -> 1^+) frac(x - 1, sqrt(x^2 - 1)) = 0$；\
  （4）$lim_(x -> +oo) frac(sin x, x - 2019) = 0$；\
  （5）$lim_(x -> 3^-) sqrt(x) dot [x]^2 = 4 sqrt(3)$，其中 $[x]$ 表示不超过 $x$ 的最大整数.

+ 利用定义证明：\
  （1）若 $lim_(x -> x_0) f(x) = a > 0$，则 $lim_(x -> x_0) sqrt(f(x)) = sqrt(a)$. \
  （2）若 $lim_(x -> 2) f(x) = a$，则 $lim_(x -> 1) f(x^3 + 1) = a$. \
  （3）若 $lim_(x -> +oo) f(x) = +oo$，$lim_(x -> +oo) g(x) = +oo$，则 $lim_(x -> +oo) f(g(x)) = +oo$.

+ 试给出极限 $lim_(x -> +oo) (a sin x + b cos x)$ 存在的充要条件.

+ 极限 $lim_(x -> oo) (1/x - [1/x])$ 是否存在？

+ 计算：\
  （1）$lim_(x -> +oo) frac(sqrt(1 + x^3), sqrt(x^2 + x^3 + x))$；\
  （2）$lim_(x -> +oo) frac(arctan x, sqrt(x))$；\
  （3）$lim_(x -> 0) frac(root(3, x^2) + sqrt(x), x + 2 sqrt(x + x^2))$；\
  （4）$lim_(x -> +oo) frac(log x, x)$.

+ 证明极限 $lim_(x -> +oo) f(x)$ 存在的充要条件是：对任意的单调递增趋于 $+oo$ 的数列 $\{x_n\}$，极限 $lim_(n -> oo) f(x_n)$ 均存在.

+ 设 $f: RR_(> 0) -> RR_(> 0)$ 是一个单调递增函数，且 $lim_(x -> +oo) frac(f(2x), f(x)) = 1$. 证明：对任意的 $a > 0$ 均有 $lim_(x -> +oo) frac(f(a x), f(x)) = 1$.


#pagebreak(weak: true)


#v(0em)
== 习题 5.2

+ 求下列极限：\
  （1）$lim_(x -> 0) frac(sin a x, sin b x)$ $(b != 0)$；\
  （2）$lim_(x -> 2) frac(sin x - sin 2, x - 2)$；\
  （3）$lim_(x -> 0) frac(1 + sin x - cos x, 1 + sin p x - cos p x)$ $(p != 0)$；\
  （4）$lim_(x -> pi/4) tan 2x dot tan(pi/4 - x)$；\
  （5）$lim_(x -> +oo) (sin sqrt(x + 1) - sin sqrt(x))$；\
  （6）$lim_(n -> oo) n^2 sin^2 (pi sqrt(n^2 + 1))$；\
  （7）$lim_(x -> oo) (frac(x^2 - 1, x^2 + 1))^(x^2)$；\
  （8）$lim_(x -> 0) (cos 2x)^(frac(1, sin^2 x))$.

+ 假设对任意的正整数 $n$ 有 $x_n in (0, 1)$，证明 $lim_(n -> oo) frac(sin x_n, x_n) = 1$ 成立当且仅当 $lim_(n -> oo) x_n = 0$.

+ 若对任意的 $x in (-1, 1)$，均有

  $ abs(sum_(k=1)^n a_k sin k x) <= abs(sin x). $

  证明：

  $ abs(sum_(k=1)^n k a_k) <= 1. $


#pagebreak(weak: true)


#v(0em)
== 习题 5.3

+ 计算下列上、下极限：\
  （1）$limsup_(x -> 0) sin frac(x + 2, x)$；\
  （2）$liminf_(x -> 0) (2 - x^2) cos frac(1, x)$；\
  （3）$limsup_(x -> +oo) frac(x, 1 + x^2 sin^2 x)$；\
  （4）$liminf_(x -> +oo) (-1)^([x/2019]) cos x$.

+ 设 $f(x)$ 在 $x_0$ 的某去心邻域内有界，证明 $liminf_(x -> x_0) f(x) = - limsup_(x -> x_0) (-f(x))$.

+ 设 $f(x)$ 与 $g(x)$ 均在 $x_0$ 的某去心邻域内有界，证明：

  #[
    #set par(justify: false, first-line-indent: 0em)
    （1）$liminf_(x -> x_0) f(x) + liminf_(x -> x_0) g(x) <= liminf_(x -> x_0) (f(x) + g(x)) <= liminf_(x -> x_0) f(x) + limsup_(x -> x_0) g(x)$；\
    （2）$liminf_(x -> x_0) f(x) + limsup_(x -> x_0) g(x) <= limsup_(x -> x_0) (f(x) + g(x)) <= limsup_(x -> x_0) f(x) + limsup_(x -> x_0) g(x)$.
  ]

+ 设 $f(x)$ 与 $g(x)$ 均在 $x_0$ 的某去心邻域内非负且有界，证明：

  #[
    #set par(justify: false, first-line-indent: 0em)
    （1）$liminf_(x -> x_0) f(x) dot liminf_(x -> x_0) g(x) <= liminf_(x -> x_0) (f(x) dot g(x)) <= liminf_(x -> x_0) f(x) dot limsup_(x -> x_0) g(x)$；\
    （2）$liminf_(x -> x_0) f(x) dot limsup_(x -> x_0) g(x) <= limsup_(x -> x_0) (f(x) dot g(x)) <= limsup_(x -> x_0) f(x) dot limsup_(x -> x_0) g(x)$.
  ]

+ 设 $f(x)$ 在 $x_0$ 的某去心邻域内有界，且 $lim_(x -> x_0) g(x)$ 存在，证明\
  （1）$liminf_(x -> x_0) (f(x) + g(x)) = liminf_(x -> x_0) f(x) + lim_(x -> x_0) g(x)$.\
  （2）$limsup_(x -> x_0) (f(x) + g(x)) = limsup_(x -> x_0) f(x) + lim_(x -> x_0) g(x)$.\
  （3）若 $g(x)$ 在 $x_0$ 的某去心邻域内非负，则

  $ liminf_(x -> x_0) f(x) g(x) = liminf_(x -> x_0) f(x) dot lim_(x -> x_0) g(x) $

  且

  $ limsup_(x -> x_0) f(x) g(x) = limsup_(x -> x_0) f(x) dot lim_(x -> x_0) g(x). $


#pagebreak(weak: true)


#v(0em)
== 习题 5.4

+ 计算下列无穷小量或无穷大量的阶：\
  （1）$sqrt(x) + 3x - 2x^4 quad (x -> 0^+)$；\
  （2）$sqrt(x) + 3x - 2x^4 quad (x -> +oo)$；\
  （3）$sqrt(x + sqrt(x + root(3, x))) quad (x -> 0^+)$；\
  （4）$sqrt(x + sqrt(x + root(3, x))) quad (x -> +oo)$；\
  （5）$sqrt(1 + tan x) - sqrt(1 - sin x) quad (x -> 0)$.

+ 证明下列命题：\
  （1）设 $n$ 为正整数，则当 $x -> 0$ 时有 $(1 + x)^n = 1 + n x + O(x^2)$. \
  （2）当 $x -> 0$ 时有 $frac(1, 1 + x) = 1 - x + O(x^2)$. \
  （3）当 $x -> 0$ 时有 $sqrt(1 + x) = 1 + x/2 + O(x^2)$. \
  （4）当 $x -> 0$ 时有 $tan x = sin x + O(x^3)$. \
  （5）当 $x -> +oo$ 时，有 $sqrt(x^2 + p x + q) = x + p/2 + O(1/x)$.

+ 利用等价无穷小量替换计算下列极限：\
  （1）$lim_(x -> 0) frac(sin 2x tan^2 x, x(1 - cos x))$；\
  （2）$lim_(x -> +oo) (sqrt(x^2 + x + 1) - 100) tan frac(1, 2x)$；\
  （3）$lim_(x -> 0) frac(sin 5x, sqrt(1 + x) - 1)$；\
  （4）$lim_(x -> 0) frac(tan x - sin x, x^3)$.

+ 证明：\
  （1）$O(f(x)) + O(g(x)) = O(f(x) + g(x))$. \
  （2）$O(f(x)) dot O(g(x)) = O(f(x) g(x))$. \
  （3）$o(f(x)) + o(g(x)) = o(|f(x)| + |g(x)|)$. \
  （4）$o(f(x)) dot O(g(x)) = o(f(x) g(x))$. \
  （5）若 $f(x) = o(g(x))$，$g(x) tilde.op h(x)$，则 $g(x) tilde.op h(x) + f(x)$. \
  （6）若 $f(x) = o(1)$，则 $frac(1, 1 - f(x)) = 1 + f(x) + o(f(x))$.

+ 用 $X$ 表示当 $x -> 0$ 时的全部无穷小量所成之集，证明由 $f tilde.op g$ $(f, g in X)$ 所定义的关系是 $X$ 上的等价关系.

+ 设 $f$ 和 $g$ 在 $x_0$ 的某去心邻域内有定义，且在该去心邻域内 $g(x) > 0$. 证明：当 $x -> x_0$ 时 $f(x) = o(g(x))$ 不成立的充要条件是

  $ overline(lim)_(x -> x_0) frac(|f(x)|, g(x)) > 0. $

+ 用 $pi(x)$ 表示不超过 $x$ 的素数的个数，若已知

  $ pi(x) tilde.op frac(x, log x), quad x -> +oo. $

  证明：第 $n$ 个素数 $p_n$ 满足 $p_n tilde.op n log n$（当 $n -> oo$ 时）.

+ 证明对任意的 $x > 1$ 有

  $ sum_(n=0)^oo frac(1, x + 2^n) = frac(log x, x log 2) + O(1/x). $


#pagebreak(weak: true)


#v(0em)
== 习题 5.5

+ 判定下列函数的连续点：\
  （1）$f(x) = frac(tan x, x)$；\
  （2）$f(x) = cos frac(1, x)$；\
  （3）$f(x) = [x]$；\
  （4）$f(x) = cases(e^(1/x) & quad x != 0, 0 & quad x = 0)$.

+ 设数列 $\{x_n\}$ 满足 $x_1 = 2019$，$x_(n+1) = sin x_n$ $(forall n >= 1)$，证明 $\{x_n\}$ 收敛并求其极限.

+ 计算：\
  （1）$lim_(x -> 0^+) x^x$；\
  （2）$lim_(x -> 0^+) (x + a^x)^(1/x) quad (a > 0)$；\
  （3）$lim_(x -> 0) frac(log cos a x, log cos b x) quad (a b != 0)$；\
  （4）$lim_(n -> oo) ((a - 1 + root(n, b))/a)^n quad (a, b > 0)$；\
  （5）$lim_(x -> 0) frac((1 + alpha x)^beta - 1, x)$；\
  （6）$lim_(x -> 0) frac(root(n, 1 + alpha x) dot sqrt(1 + beta x) - 1, x) quad (m, n in ZZ_(> 0))$；\
  （7）$lim_(x -> 0^+) (cos sqrt(x))^(1/x)$；\
  （8）$lim_(x -> 0) ((a^(x+1) + b^(x+1))/(a + b))^(1/x) quad (a, b > 0)$.

+ 设 $f(x)$ 与 $g(x)$ 均在 $x_0$ 处间断，问 $f(x) + g(x)$ 与 $f(x) g(x)$ 是否一定在 $x_0$ 处间断？

+ 设 $f(x)$ 在 $x_0$ 处间断，$g(t)$ 在 $t_0$ 处间断，且 $g(t_0) = x_0$，那么 $f(g(t))$ 是否一定在 $t_0$ 处间断？

+ 设

  $ f(x) = cases(e^x & quad x < 0, a + x & quad x >= 0) $

  是 $RR$ 上的连续函数，求 $a$ 的值.

+ 设 $f(x) = lim_(n -> oo) frac(x^(2n-1) + a x^2 + b x, x^(2n) + 1)$ 是 $RR$ 上的连续函数，求 $a$ 和 $b$ 的值.

+ 设数列 $\{x_n\}$ 满足 $x_(n+1) = x_n sin x_n$ $(forall n >= 1)$，证明 $\{x_n\}$ 收敛.

+ 设 $f(x)$ 和 $g(x)$ 均在区间 $I$ 上连续，证明 $max(f(x), g(x))$ 及 $min(f(x), g(x))$ 也均在 $I$ 上连续.

+ 设 $f(x)$ 在 $RR$ 上连续. \
  （1）如果对任意的 $x_1, x_2 in QQ$，只要 $x_1 <= x_2$ 就有 $f(x_1) <= f(x_2)$，证明 $f$ 在 $RR$ 上单调递增；\
  （2）如果对任意的 $x_1, x_2 in QQ$，只要 $x_1 < x_2$ 就有 $f(x_1) < f(x_2)$，问 $f(x)$ 是否在 $RR$ 上严格单调递增？

+ 设 $f(x)$ 在 $x = 0$ 处连续，且对任意的 $x in RR$ 有 $f(x) = f(2x)$，证明 $f$ 为常值函数.

+ 设 $f(x)$ 在 $RR$ 上连续，且满足 $f(x + y) = f(x) + f(y)$ $(forall x, y in RR)$. 证明：$f(x) = f(1) x$ $(forall x in RR)$.

+ 设 $f(x)$ 在 $RR$ 上连续且不恒等于 $0$，并满足 $f(x + y) = f(x) f(y)$ $(forall x, y in RR)$. 证明：\
  （1）$f(1) > 0$；\
  （2）$f(x) = (f(1))^x$ $(forall x in RR)$.

+ 设 $f(x)$ 是定义在 $RR_(> 0)$ 上的不恒等于 $0$ 的连续函数，并且对任意的正实数 $x, y$ 有 $f(x y) = f(x) + f(y)$，证明存在正实数 $a$ 使得对任意的 $x in RR_(> 0)$ 均有

  $ f(x) = log_a x. $

+ 证明：定义在 $RR$ 上的非常值的连续周期函数必有最小正周期.

+ 设 $f$ 是定义在 $(a, b)$ 上的有界函数，记 $alpha(x) = inf_(t in (a, x)) f(t)$，$beta(x) = sup_(t in (a, x)) f(t)$. \
  （1）证明 $alpha, beta$ 均在 $(a, b)$ 内左连续. \
  （2）举例说明 $alpha, beta$ 未必在 $(a, b)$ 内右连续. \
  （3）若 $f in C((a, b))$，证明 $alpha, beta in C((a, b))$.

+ 把全体有理数排成一列，记作 $r_1, r_2, dots.c, r_n, dots.c$，并令

  $ f(x) = sum_(r_n < x) frac(1, 2^n), quad forall x in RR. $

  证明 $f(x)$ 是在无理点连续、在有理点间断的严格单调递增函数.


#pagebreak(weak: true)


#v(0em)
== 习题 5.6

+ 讨论下列函数的连续性，并判定间断点的类型：\
  #v(0.7em)（1）$display(f(x) = cases(frac(x, (1 - x)^2) & quad x != 1, 1 & quad x = 1))$；\
  #v(0.7em)（2）$display(f(x) = frac(log |x|, x - 1))$；\
  #v(0.7em)（3）$display(f(x) = "sgn"(sin x)) quad x in (-1, 2 pi)$；\
  #v(0.7em)（4）$display(f(x) = cases(x floor(1/x) & quad x in (-2, 0) union (0, 2), 1 & quad x = 0))$；\
  #v(0.7em)（5）$display(f(x) = cases(frac(log(1 + frac(1, 2) sin x), x) & quad x != 0, 2 & quad x = 0))$；\
  #v(0.7em)（6）$display(f(x) = cases(e^(-1/x^2) & quad x != 0, 0 & quad x = 0))$；\
  #v(0.7em)（7）$display(f(x) = lim_(n -> oo) frac(1, 1 + x^n)) quad x in (0, +oo)$；\
  #v(0.7em)（8）$display(f(x) = lim_(t -> +oo) frac(log(1 + e^(x t)), log(1 + e^t))) quad x in RR$.


#pagebreak(weak: true)


#v(0em)
== 习题 5.7

+ 设 $f(x)$ 在 $[a, b]$ 上有定义且无第二类间断点，那么是否可得出 $f(x)$ 在 $[a, b]$ 上有界？

+ 设 $f(x)$ 在 $RR$ 上连续，且把开区间映为开区间，证明 $f(x)$ 是 $RR$ 上的严格单调函数.

+ 设 $a_1, a_2, a_3 > 0$，$b_1 < b_2 < b_3$. 证明：方程

  $ frac(a_1, x - b_1) + frac(a_2, x - b_2) + frac(a_3, x - b_3) = 0 $

  在区间 $(b_1, b_2)$ 和 $(b_2, b_3)$ 内恰好各有一个根.

+ 设 $f$ 在 $[a, b]$ 上连续且 $x_1, x_2, dots.c, x_n in [a, b]$，证明存在 $xi in [a, b]$ 使得

  $ f(xi) = frac(f(x_1) + f(x_2) + dots.c + f(x_n), n). $

+ 设 $f(x)$ 是 $[0, 1]$ 上的连续函数，且 $f(0) = f(1)$. 证明：对任意的 $n in ZZ_(> 0)$，均存在 $xi_n in [0, 1]$ 使得 $f(xi_n + frac(1, n)) = f(xi_n)$.

+ 设 $f$ 是 $[a, b]$ 上的连续函数，且对任意的 $x in [a, b]$，均存在 $y in [a, b]$ 使得 $|f(y)| <= frac(1, 2) |f(x)|$. 证明：存在 $c in [a, b]$ 使得 $f(c) = 0$.

+ 证明：函数

  $ f(x) = cases(sin frac(1, x) & quad x != 0, 0 & quad x = 0) $

  在闭区间 $[0, 1]$ 上取介于 $f(0)$ 和 $f(1)$ 之间的一切中间值，但在 $[0, 1]$ 上不连续. 本题说明介值定理的逆命题不成立.

+ 设 $f(x)$ 在 $(a, b)$ 上连续，且

  $ m = liminf_(x -> a^+) f(x), quad quad M = limsup_(x -> a^+) f(x). $

  证明：对任意的 $lambda in [m, M]$，存在位于 $(a, b)$ 内的收敛于 $a$ 的数列 $\{x_n\}$ 使得 $lim_(n -> oo) f(x_n) = lambda$.

+ 利用有限覆盖定理证明命题 7.3.


#pagebreak(weak: true)


#v(0em)
== 习题 5.8

+ 研究下列函数在指定区间上是否一致连续：\
  #v(0.7em)（1）$display(f(x) = frac(sin x, x)) quad x in (0, pi)$；\
  #v(0.7em)（2）$display(f(x) = cos x^2) quad x in [1, +oo)$；\
  #v(0.7em)（3）$display(f(x) = frac(x, x + 1) sin frac(1, x)) quad x in (0, 2)$；\
  #v(0.7em)（4）$display(f(x) = frac(x, 1 + x^2 sin^2 x)) quad x in [0, +oo)$.

+ 证明函数 $norm(x) = min_(n in ZZ) |x - n|$ 在 $RR$ 上一致连续.

+ 设 $f$ 在区间 $I$ 上一致连续，$g$ 在区间 $J$ 上一致连续，且 $f(I) subset J$. 证明 $g compose f$ 在 $I$ 上一致连续.

+ 设函数 $f(x)$ 在 $[a, b)$ 上连续. 证明：$f(x)$ 在 $[a, b)$ 上一致连续的充要条件是 $lim_(x -> b^-) f(x)$ 存在.

+ 设函数 $f(x)$ 在 $(a, b)$ 上一致连续，证明 $f(x)$ 在 $(a, b)$ 上有界.

+ 设 $f(x)$ 在 $[a, +oo)$ 上连续. 证明：若 $lim_(x -> +oo) f(x)$ 存在，则 $f(x)$ 在 $[a, +oo)$ 上一致连续. 反过来是否成立？

+ 设 $f(x)$ 和 $g(x)$ 均在 $[a, +oo)$ 上一致连续. \
  #v(0.7em)（1）证明 $f(x) + g(x)$ 在 $[a, +oo)$ 上一致连续. \
  #v(0.7em)（2）举例说明 $f(x) g(x)$ 未必在 $[a, +oo)$ 上一致连续. \
  #v(0.7em)（3）如果还有 $lim_(x -> +oo) g(x) = 0$，那么 $f(x) g(x)$ 在 $[a, +oo)$ 上一致连续吗？

+ 利用波尔查诺－魏尔斯特拉斯定理证明定理 8.3.

+ 设 $f(x)$ 在 $[0, +oo)$ 上一致连续，证明当 $x -> +oo$ 时有 $f(x) = O(x)$.


#pagebreak(weak: true)


#v(0em)
== 习题 5.9

+ 证明命题 9.7.

+ 判断下列无穷乘积的敛散性：\
  #v(0.7em)（1）$limits(product)_(n=1)^oo display(frac(2 n - 1, n^2 + 1))$；\
  #v(0.7em)（2）$limits(product)_(n=1)^oo display(a^(((-1)^n)/n)) quad (a > 0)$；\
  #v(0.7em)（3）$limits(product)_(n=1)^oo display((1 + frac(x^n, 2 n)))$；\
  #v(0.7em)（4）$limits(product)_(n=1)^oo display(root(n, n^2))$；\
  #v(0.7em)（5）$limits(product)_(n=1)^oo display(root(n, 1 + frac(1, n)))$.

+ 计算 $limits(product)_(n=1)^oo root(n, e) (1 + frac(1, n))^(-1)$.

+ 假设 $limits(sum)_(n=1)^oo b_n$ 绝对收敛，且正数列 $\{a_n\}$ 满足 $frac(a_n, a_(n+1)) = 1 + frac(1, n) + O(|b_n|)$. 证明级数 $limits(sum)_(n=1)^oo a_n$ 发散.

+ 设 $A in (0, 1)$，证明存在由 $(0, 1)$ 内的实数组成的数列 $\{a_n\}$ 使得

  $ product_(n=1)^oo a_n = A. $

+ 证明对任意的 $x in (-1, 1)$ 有

  $ sum_(n=0)^oo x^n = product_(n=0)^oo (sum_(m=0)^9 x^(m dot 10^n)), $

  并说明其算术意义.

+ 设定又在正整数集上的函数 $mu(n)$ 满足

  $ mu(n) = cases(1 & quad n = 1, (-1)^k & quad n = p_1 p_2 dots.c p_k " 且 " p_1\, p_2\, dots.c\, p_k " 为两两不同的素数", 0 & quad "其他") $

  试对任意的 $s > 1$ 证明

  $ product_p (1 - 1/p^s) = sum_(n=1)^oo frac(mu(n), n^s), $

  进而证明当 $s > 1$ 时有

  $ (sum_(n=1)^oo frac(1, n^s)) (sum_(n=1)^oo frac(mu(n), n^s)) = 1. $

+ 设 $z in RR_(>= 2)$，用 $P(z)$ 表示小于 $z$ 的全部素数的乘积. 证明：当 $s > 1$ 时有

  $ sum_(n=1\, (n, P(z)) = 1)^oo frac(1, n^s) = zeta(s) product_(p < z) (1 - 1/p^s). $


#pagebreak(weak: true)


= 第六章 导数与微分


#v(0em)
== 习题 6.1

+ 计算下列函数的导数：\
  #v(0.7em)（1）$f(x) = frac(x^2 + 1, x - 1)$；\
  #v(0.7em)（2）$y = 2^x log x + x^(2/3) - 5$；\
  #v(0.7em)（3）$f(x) = frac(x^p (1 - x)^q, 1 + x)$；\
  #v(0.7em)（4）$f(x) = sin[sin(sin x)]$；\
  #v(0.7em)（5）$f(x) = (cos x) log tan x$；\
  #v(0.7em)（6）$f(x) = arcsin frac(1 - x^2, 1 + x^2)$；\
  #v(0.7em)（7）$f(x) = (sin x)^x$；\
  #v(0.7em)（8）$f(x) = root(m + n, (1 - x)^m (1 + x)^n)$；\
  #v(0.7em)（9）$f(x) = x^(x^x)$；\
  #v(0.7em)（10）$f(x) = (a/b)^x (b/x)^a (x/a)^b$（$a, b > 0$）.

+ 设 $y = f(x)$ 由参数方程表示，$a != 0$，求 $frac(dif y, dif x)$：\
  #v(0.7em)（1）$x = t^2$，$y = t^3$；\
  #v(0.7em)（2）$x = a cos^3 t$，$y = a sin^3 t$；\
  #v(0.7em)（3）$x = a(t - sin t)$，$y = a(1 - cos t)$；\
  （4）$x = arcsin frac(t, sqrt(1 + t^2))$，$y = arccos frac(1, sqrt(1 + t^2))$.#v(0.45em)

+ 设 $a > 0$，考虑在极坐标 $display(cases(x = r cos theta "，" , y = r sin theta))$ 下由方程 $r = a theta$ 所给出的阿基米德螺线，求 $frac(dif y, dif x)$.#v(0.55em)

+ 证明 $f(x) = [x] sin^2 pi x$ 在 $RR$ 上可导并求其导数，其中 $[x]$ 表示不超过 $x$ 的最大整数.

+ 设 $display(f(x) = cases(frac(x, 1 + e^(1/x)) & quad x != 0 "，" , 0 & quad x = 0 "."))$，试研究 $f(x)$ 的可导性.#v(0.5em)

+ 设 $display(f(x) = cases(x^2 & quad x <= x_0 "，" , a x + b & quad x > x_0 "."))$，试求 $a$，$b$，使得 $f(x)$ 在 $x_0$ 处可导.#v(0.5em)

+ 求常数 $a$，$b$，$c$，使得函数

  $ f(x) = cases(e^(a x) & quad x < 0 "，" , b & quad x = 0 "，" , log(1 + x) + c cos x & quad x > 0) $

  在 $x = 0$ 处可导，并求 $f'(0)$.

+ 设

  $ f(x) = cases(x & quad x in QQ "，" , x^2 - x + 1 & quad x in RR without QQ ".") $

  问 $f(x)$ 在何处可导？

+ 设 $f(x)$ 在 $RR$ 上可导，证明：若 $f$ 为偶函数，则 $f'$ 为奇函数；若 $f$ 为奇函数，则 $f'$ 为偶函数.

+ 设 $f(x)$ 和 $g(x)$ 均在 $x_0$ 处可导，问 $max(f(x), g(x))$ 和 $min(f(x), g(x))$ 是否在 $x_0$ 处可导？

+ 设 $x_0$ 是某个首项系数为 1 的多项式 $P(x)$ 之最大实根，证明 $P'(x_0) >= 0$.

+ 设函数 $f(x)$ 在 $[a, b]$ 上连续，$f(a) = f(b) = 0$，且 $f'_+ (a) dot f'_- (b) > 0$，证明存在 $c in (a, b)$ 使得 $f(c) = 0$.

+ 证明黎曼函数 $R(x)$ 处处不可导.

+ 设定义在 $RR$ 上的函数 $f$ 满足 $f(2x) = 2 f(x)$（$forall x in RR$），且 $f$ 在 $x = 0$ 处可导. 证明存在常数 $a$ 使得对任意的 $x$ 有 $f(x) = a x$.

+ 证明：曲线 $sqrt(x) + sqrt(y) = sqrt(a)$（$a > 0$）上任意一点的切线所截两坐标轴的截距之和恒等于 $a$.

+ 设 $u_(i j)(x)$（$i, j = 1, 2$）均为可导函数，若

  $ f(x) = mat(delim: "|", u_(11)(x), u_(12)(x); u_(21)(x), u_(22)(x)) "，" $

  证明：

  $ f'(x) = mat(delim: "|", u'_11 (x), u'_12 (x); u_(21)(x), u_(22)(x)) + mat(delim: "|", u_(11)(x), u_(12)(x); u'_21 (x), u'_22 (x)) "." $

  试将上述结果推广到 $n$ 阶行列式的情形.


#pagebreak(weak: true)


#v(0em)
== 习题 6.2

+ 求下列函数的微分：\
  （1）$arctan sqrt(x)$；\
  （2）$x^2 sin x$；\
  （3）$frac(log x, sqrt(x))$；\
  （4）$log(tan x)$；\
  （5）$e^(-tan frac(1, x))$；\
  （6）$log(x + sqrt(x^2 + 1))$.

+ 设 $u(x)$，$v(x)$ 和 $w(x)$ 均为 $x$ 的可微函数，求 $dif y$：\
  （1）$y = u v w$；\
  （2）$y = frac(u^2, v)$；\
  （3）$y = w sin(u + v)$；\
  （4）$y = sqrt(u^2 + v^2 + w^2)$；\
  （5）$y = arctan frac(u, v)$；\
  （6）$y = log frac(u^2 + v^2, w)$.

+ 对下列各式进行近似计算：\
  （1）$frac(1, 2.01)$；\
  （2）$sqrt(4.02)$；\
  （3）$cos 151 degree$；\
  （4）$arctan 1.05$；\
  （5）$e^(0.99)$；\
  （6）$log 2.02$.

+ 设 $y = frac(x - a, 1 - a x)$（$|a| < 1$）. 证明：当 $|x| < 1$ 时有 $frac(dif y, 1 - y^2) = frac(dif x, 1 - x^2)$.

+ 设 $x(t)$，$y(t)$ 均可微，且 $r = sqrt(x^2 + y^2)$，$theta = arctan frac(y, x)$. 证明：\
  （1）$dif r = frac(x dif x + y dif y, sqrt(x^2 + y^2))$，$dif theta = frac(x dif y - y dif x, x^2 + y^2)$；\
  （2）$(dif x)^2 + (dif y)^2 = (r dif theta)^2 + (dif r)^2$.


#pagebreak(weak: true)


#v(0em)
== 习题 6.3

+ 计算高阶导数：\
  （1）$f(x) = frac(x^2, 1 - x)$，求 $f^((8))(x)$；\
  （2）$f(x) = x log x$，求 $f^((10))(x)$；\
  （3）$f(x) = x^2 sin^2 x$，求 $f^((40))(x)$；\
  （4）$f(x) = x^3 e^x$，求 $f^((100))(x)$.

+ 计算下列函数的 $n$ 阶导数：\
  （1）$y = frac(x^n, x + 1)$；\
  （2）$y = frac(1, sqrt(1 - 2x))$；\
  （3）$y = frac(e^x, x)$；\
  （4）$y = log frac(a x - b, a x + b)$；\
  （5）$y = cos^2 x$.

+ 设 $f(x)$ 在 $x = 0$ 处 $n$ 阶可导，证明：\
  （1）若 $f(x)$ 是奇函数，则对于任意的偶数 $k in [1, n]$ 有 $f^((k))(0) = 0$；\
  （2）若 $f(x)$ 是偶函数，则对于任意的奇数 $k in [1, n]$ 有 $f^((k))(0) = 0$.

+ 设 $c_1$，$c_2$，$lambda_1$ 及 $lambda_2$ 均为常数. 证明：函数 $y = c_1 e^(lambda_1 x) + c_2 e^(lambda_2 x)$ 满足方程

  $ y'' - (lambda_1 + lambda_2) y' + lambda_1 lambda_2 y = 0. $

+ 设 $x_1, x_2, dots.c, x_n$ 是 $n$ 个实数，$f(x) = (x - x_1)(x - x_2) dots.c (x - x_n)$，证明对任意的实数 $x$ 有 $[f'(x)]^2 >= f(x) f''(x)$. 这个不等式对一般的多项式成立吗？

+ 试将莱布尼茨公式推广到 $k$ 个函数相乘的情形（$k >= 2$）.

+ 设 $n$ 是正整数，

  $ f(x) = cases(x^(2n) sin frac(1, x) & quad x != 0 "," , 0 & quad x = 0 ".") $

  证明 $f(x)$ 在 $x = 0$ 处有 $n$ 阶导数，但没有 $n + 1$ 阶导数.

+ 设 $f(x) = cases(e^(-frac(1, x^2)) & quad x != 0 "," , 0 & quad x = 0 ".")$，证明：$f^((n))(0) = 0$（$forall n in ZZ_(> 0)$）.

+ 设 $c_i$（$i = 1, 2, 3, 4$）为常数. 试证函数

  $ y = e^(frac(x, sqrt(2))) (c_1 cos frac(x, sqrt(2)) + c_2 sin frac(x, sqrt(2))) + e^(-frac(x, sqrt(2))) (c_3 cos frac(x, sqrt(2)) + c_4 sin frac(x, sqrt(2))) $

  满足方程 $y^((4)) + y = 0$.

+ 证明：切比雪夫（Чебышев）多项式

  $ T_n (x) = frac(1, 2^(n - 1)) cos(n arccos x), quad quad n in ZZ_(> 0) $

  满足方程

  $ (1 - x^2) T''_n (x) - x T'_n (x) + n^2 T_n (x) = 0. $

+ 勒让德多项式 $P_n (x)$ 由下式给出：

  $ P_n (x) = frac(1, 2^n n!) [(x^2 - 1)^n]^((n)), quad quad n in ZZ_(> 0). $

  证明它满足方程

  $ (1 - x^2) P''_n (x) - 2 x P'_n (x) + n(n + 1) P_n (x) = 0. $

+ 设 $f(x)$ 如习题 6.1 第 16 题所定义，又设 $u_(i j)(x)$（$i, j = 1, 2$）均为 $n$ 阶可导函数. 试计算 $f^((n))(x)$，并将这一结果推广到 $k$ 阶行列式的情形.


#pagebreak(weak: true)


= 第七章 微分中值定理及应用


#v(0em)
== 习题 7.1

+ 求下列函数在指定区间上的最大值和最小值：\
  （1）$f(x) = x^4 - 2x^3 + x^2 + 3$，$x in [-2, 2]$；\
  （2）$f(x) = |2x^2 + 5x - 3|$，$x in [-2, 4]$；\
  （3）$f(x) = x^2 e^(|x - 1|)$，$x in [0, 3]$.

+ 试举例说明：\
  （1）罗尔定理的三个条件缺少任何一个均不能保证结论成立；\
  （2）相对于罗尔定理的结论而言，三个条件中的每一个都不是必要的.

+ 证明：对任意的 $a in RR$，方程 $x^3 - 3x + a = 0$ 在 $[0, 1]$ 上至多有一个根.

+ 设 $0 < a < b$，证明：$frac(b - a, b) < log frac(b, a) < frac(b - a, a)$.

+ 设 $0 < a < b$，证明：$(a e)^(b - a) < frac(b^b, a^a) < (b e)^(b - a)$.

+ 设 $alpha > 0$，证明：$frac(n^(alpha + 1), alpha + 1) < sum_(k=1)^n k^alpha < frac((n + 1)^(alpha + 1), alpha + 1)$.

+ 证明：方程 $2^x + 5^x = 3^x + 4^x$ 的仅有的根为 0 和 1.

+ 证明：对任意的 $x >= 1$ 有 $2 arctan x + arcsin frac(2x, 1 + x^2) = pi$.

+ 设 $f$ 在 $(a, +oo)$ 上可导，且 $lim_(x -> a^+) f(x) = lim_(x -> +oo) f(x) = A$. 证明：存在 $xi in (a, +oo)$ 使得 $f'(xi) = 0$.

+ 设 $f$ 在 $[a, b]$ 上连续，$x_0$ 是 $f$ 在 $(a, b)$ 内唯一的极值点. 证明：若 $x_0$ 是极大（小）值点，则 $x_0$ 是 $f$ 在 $[a, b]$ 上的最大（小）值点.

+ 设 $f$ 在区间 $I$ 上可导，证明：$f'$ 在 $I$ 上无第一类间断点.

从第 12 题到第 14 题是一组题，介绍有限增量定理及其应用.

12. （有限增量定理）设函数 $f(x)$ 在 $[a, b]$ 上连续，在 $(a, b)$ 内可导，且存在常数 $M > 0$，使得对任意的 $x in (a, b)$ 有 $|f'(x)| <= M$. 证明：

    $ |f(x) - f(y)| <= M|x - y|, quad forall x, y in [a, b]. $

13. 设 $f: [a, b] -> [a, b]$ 满足上题的条件，其中 $M in (0, 1)$，证明：由 $x_1 in [a, b]$ 及递推表达式 $x_(n+1) = f(x_n)$ $(forall n in ZZ_(> 0))$ 所定义的数列 $\{x_n\}$ 收敛.

14. 设 $x_1 = 1$，$x_(n+1) = log(x_n + sqrt(4 + x_n^2))$ $(forall n in ZZ_(> 0))$，证明：$\{x_n\}$ 收敛.


#pagebreak(weak: true)


#v(0em)
== 习题 7.2

+ 写出下列函数直到给定次数的带佩亚诺余项的麦克劳林展开式：\
  （1）$frac(1, sqrt(1 - 2x))$ 到含 $x^4$ 的项；#h(3em)（2）$sin^2 x$ 到含 $x^6$ 的项；\
  （3）$tan x$ 到含 $x^5$ 的项；#h(3em)（4）$e^(sin x)$ 到含 $x^4$ 的项；\
  （5）$frac(x, e^x - 1)$ 到含 $x^4$ 的项；#h(3em)（6）$log(1 + x sin x)$ 到含 $x^5$ 的项.

+ 试确定常数 $a$ 和 $b$，使得当 $x -> 0$ 时 $e^x - frac(1 + a x, 1 + b x)$ 为 $x$ 的三阶无穷小量.

+ 写出下列函数在 $x_0$ 处带佩亚诺余项的泰勒展开式：\
  （1）$f(x) = log x$，$x_0 = 1$；#h(3em)（2）$f(x) = sqrt(x)$，$x_0 = 1$；\
  （3）$f(x) = sin x$，$x_0 = pi/2$；#h(3em)（4）$f(x) = frac(x, 1 + x)$，$x_0 = 2$.

+ 计算下列极限：\
  （1）$lim_(x -> 0) frac(e^(a x) - e^(b x), sin a x - sin b x)$ $(a != b)$；#h(2em)（2）$lim_(x -> 0) (1/x - 1/(sin x))$；\
  （3）$lim_(x -> +oo) x^(3/2)(sqrt(x + 1) + sqrt(x - 1) - 2 sqrt(x))$；#h(2em)（4）$lim_(x -> oo) (x - x^2 log(1 + 1/x))$；\
  （5）$lim_(x -> 0) frac(e^x sin x - x(1 + x), x^3)$；#h(2em)（6）$lim_(x -> 0) frac(log(cos x), sqrt(cos x) - root(3, cos x))$.

+ 求极限

  $ lim_(n -> oo) (sin frac(1, n^2) + sin frac(3, n^2) + dots.c + sin frac(2n - 1, n^2)). $

+ 求极限

  $ lim_(n -> oo) cos frac(1, n sqrt(n)) cos frac(2, n sqrt(n)) dots.c cos frac(n, n sqrt(n)). $

+ 证明：当 $n -> oo$ 时有

  $ (1 + 1/n)^n = e(1 - frac(1, 2n) + frac(11, 24 n^2) + O(frac(1, n^3))). $

+ 设函数 $f(x)$ 在 $RR$ 上二阶可导，且对任意的 $x$ 和 $h$，有

  $ f(x) <= frac(f(x + h) + f(x - h), 2). $

  证明在 $RR$ 上有 $f''(x) >= 0$.

+ 设函数 $f(x)$ 在区间 $[0, 1]$ 上二阶可导，且有

  $ f(0) = f(1) = 0, quad min_(x in [0, 1]) f(x) = -1. $

  证明存在 $xi in (0, 1)$ 使得 $f''(xi) >= 8$.

+ 设 $f(x)$ 在 $RR$ 上二阶可导，记 $M_n = sup_(x in RR) |f^((n))(x)|$ $(n = 0, 1, 2)$. 如果 $M_0$ 和 $M_2$ 均是有限数，证明 $M_1$ 也是有限数且 $M_1 <= sqrt(2 M_0 M_2)$.

+ 设 $f(x)$ 在 $x_0$ 的某邻域内 $n + 1$ 阶连续可导，$f^((n+1))(x_0) != 0$，且对每个充分小的 $h$，均存在 $theta_h in (0, 1)$，使得

  $ f(x_0 + h) = f(x_0) + f'(x_0) h + dots.c + frac(f^((n))(x_0 + theta_h h), n!) h^n. $

  证明：$lim_(h -> 0) theta_h = frac(1, n + 1)$.

+ 设函数 $f(x)$ 和 $g(x)$ 均在 $(-1, 1)$ 内任意阶可导，并且对任意的 $x in (-1, 1)$ 和 $n in ZZ_(>= 0)$ 有

  $ |f^((n))(x) - g^((n))(x)| <= n! |x|. $

  证明 $f = g$.

+ 证明：$sin 1$ 是无理数.

+ 计算 $e$ 的值至小数点后四位.

+ 证明 $e^2$ 是无理数.

+ （1）设 $n$ 是一个正整数，证明：方程 $x tan x = 1$ 在 $(n pi, n pi + pi/2)$ 内有且仅有一个根，我们把它记作 $x_n$；\
  （2）证明：当 $n -> oo$ 时有

  $ x_n = n pi + frac(1, n pi) + O(frac(1, n^3)). $

+ 设正项级数 $sum_(n=1)^oo u_n$ 满足

  $ lim_(n -> oo) n log frac(u_n, u_(n+1)) = r. $

  证明：当 $r > 1$ 时 $sum_(n=1)^oo u_n$ 收敛，当 $r < 1$ 时 $sum_(n=1)^oo u_n$ 发散.

+ 判断下列级数的敛散性：

  （1）$sum_(n=2)^oo frac((-1)^n, (n + (-1)^n)^p)$；

  #block(height: 0.3em)

  （2）$sum_(n=1)^oo frac((-1)^floor(sqrt(n)), n^p)$；

  #block(height: 0.3em)

  （3）$sum_(n=1)^oo frac(n! e^n, n^(n+p))$；

  #block(height: 0.3em)

  （4）$sum_(n=1)^oo frac(1, n^a) (cos sqrt(frac(b log n, n)))^n$ $(a, b > 0)$.

+ 假设对任意的正整数 $n$ 有 $u_n in (0, 1)$，证明：无穷乘积 $product_(n=1)^oo frac(sin u_n, u_n)$ 与级数 $sum_(n=1)^oo u_n^2$ 同敛散.

+ 设对任意的正整数 $n$ 有 $a_n in (0, 1)$ 且 $sum_(n=1)^oo a_n^2$ 收敛，证明：无穷乘积 $product_(n=1)^oo (1 + a_n)$ 与级数 $sum_(n=1)^oo a_n$ 同敛散.

+ 研究无穷乘积 $product_(n=1)^oo (1 + frac(sin n, n^s))$ 在 $s > 0$ 时的敛散性.


#pagebreak(weak: true)


#v(0em)
== 习题 7.3

+ 试给出下列函数在其定义域上的严格单调性区间，并求函数的极值：\
  （1）$f(x) = x^3 - 2x^2 + x + 5$；#h(3em)（2）$f(x) = sqrt(x) log x$；\
  （3）$f(x) = frac(x - 1, x^2 + 1)$；#h(3em)（4）$f(x) = 3 sin x + cos^2 x$；\
  （5）$f(x) = e^x sin x$.

+ 证明下列不等式：\
  （1）$sin x > x - frac(x^3, 6)$，$x in RR_(> 0)$；#h(2em)（2）$log x > frac(2(x - 1), x + 1)$，$x in RR_(> 1)$；\
  （3）$arctan x > x - frac(x^3, 3)$，$x in RR_(> 0)$；#h(2em)（4）$tan x > x + frac(x^3, 3)$，$x in (0, pi/2)$；\
  （5）$frac(tan x, x) > frac(x, sin x)$，$x in (0, pi/2)$.

+ 设 $x_0 = frac(1, 2)$，$x_(n+1) = x_n - log(1 + x_n^2)$，计算 $lim_(n -> oo) n x_n$.

+ 设正实数 $a$ 满足 $a log a = a + 1$，证明：$x^x >= e^(2x - a + 1)$ 对任意的 $x in [a, +oo)$ 成立.

+ 证明：函数 $f(x) = (1 + 1/x)^(x + p)$ 在 $(0, +oo)$ 内严格单调递减当且仅当 $p >= 1/2$.

+ 设 $f$ 在 $[a, +oo)$ 上连续，$f(a) < 0$，且当 $x > a$ 时有 $f'(x) > k > 0$（$k$ 为一常数），证明：$f(x)$ 在区间 $(a, a - frac(f(a), k))$ 内有且仅有一根.

+ 设 $a > 0$，现将它分成若干份，要求各部分的乘积达到最大，应该怎样分？

+ 设 $p, q$ 是实数，试给出方程 $x^3 + p x + q = 0$ 有三个不同实根的充要条件.

+ 设 $f(x)$ 在 $[0, +oo)$ 上连续，在 $(0, +oo)$ 内可导且 $f'(x)$ 严格单调递增，又设 $f(0) = 0$. 证明函数 $g(x) = frac(f(x), x)$ 在 $(0, +oo)$ 内严格单调递增.

+ 试举例说明注 3.10 中所述之事实.

+ 设函数 $f(x)$ 在 $x_0$ 处达到极大值，$f(x)$ 是否一定在 $x_0$ 的某一左邻域内单调递增，在 $x_0$ 的某一右邻域内单调递减？

+ 设函数 $f(x)$ 在开区间 $I$ 内二阶可导，在 $I$ 内无零点，且存在正实数 $L$ 使得

  $ f(x) f''(x) < L f'(x)^2, quad forall x in I. $

  证明 $|f(x)|$ 在 $I$ 内无极小值点.


#pagebreak(weak: true)


#v(0em)
== 习题 7.4

+ 研究下列函数在其定义域上的凸凹性区间：\
  （1）$f(x) = 2x^3 - 4x^2 + x + 10$；\
  （2）$f(x) = x^2 log x$；\
  （3）$f(x) = x + sin x$；\
  （4）$f(x) = frac(1, sqrt(1 + x))$；\
  （5）$f(x) = e^(-x^2)$；\
  （6）$f(x) = x sin(log x)$.

+ 设 $f(x)$ 与 $g(x)$ 均是区间 $I$ 上的凸函数，证明 $f(x) + g(x)$ 也是 $I$ 上的凸函数. $f(x) g(x)$ 是 $I$ 上的凸函数吗？

+ 设 $P(x)$ 是一个 $n$ 次多项式，$n$ 为奇数. 证明：$P(x)$ 是 $RR$ 上的凸函数当且仅当 $n = 1$.

+ 证明：$f$ 是区间 $I$ 上的凸函数当且仅当集合

  $ S_f = {(x, y) : x in I, y >= f(x)} $

  是凸集.

+ 证明：对任意的正实数 $x, y$ 有 $arctan x + arctan y <= 2 arctan frac(x + y, 2)$.

+ 证明：对任意的正实数 $x, y$ 有 $frac(x log x + y log y, x + y) >= log frac(x + y, 2)$.

+ （杨（Young）不等式）设 $a, b > 0$，$p > 1$ 且 $1/p + 1/q = 1$，证明 $a b <= frac(a^p, p) + frac(b^q, q)$.

+ （赫尔德（Hölder）不等式）设 $a_k, b_k > 0$（$1 <= k <= n$），$p > 1$ 且 $1/p + 1/q = 1$，利用上题结论证明

  $ sum_(k=1)^n a_k b_k <= (sum_(k=1)^n a_k^p)^(1/p) (sum_(k=1)^n b_k^q)^(1/q) . $

+ 设 $x_k$（$1 <= k <= n$）均为正数. 证明

  $ frac(x_1 x_2 dots.c x_n, (x_1 + x_2 + dots.c + x_n)^n) <= frac((1 + x_1)(1 + x_2) dots.c (1 + x_n), (n + x_1 + x_2 + dots.c + x_n)^n) . $

+ 设 $x in RR$ 且 $t in [-1, 1]$，证明

  $ e^(x t) <= cosh x + t sinh x . $

+ 设 $f(x)$ 是 $[a, b]$ 上的凸函数，若 $c in (a, b)$ 是 $f(x)$ 的极小值点，证明：其必为 $f(x)$ 在 $[a, b]$ 上的最小值点.

+ 设 $f(x)$ 是 $[a, b]$ 上的严格凸函数，且 $x_0 in (a, b)$ 为其一个极小值点，证明：$x_0$ 是 $f$ 在 $[a, b]$ 上的唯一极小值点.

+ 设 $f(x)$ 是区间 $I$ 上的凸函数，证明：$f(x)$ 在 $I$ 的任意有界闭子区间上有界.

+ 设 $f(x)$ 是 $(a, b)$ 内的凸函数，证明：$f(x)$ 在 $(a, b)$ 内连续.

+ 设 $f(x)$ 是开区间 $I$ 上的凸函数，$[a, b] subset.eq I$. 如果 $f(a) f(b) < 0$，证明：$f(x)$ 在 $[a, b]$ 上有且仅有一个零点.

+ 设 $f(x)$ 是 $(a, b)$ 内的凸函数，证明：$f(x)$ 在 $(a, b)$ 内每一点处均存在左导数和右导数.

+ 设 $f(x)$ 在 $RR$ 上有界且二阶可导. 证明：存在 $x_0 in RR$，使得 $f''(x_0) = 0$.


#pagebreak(weak: true)


#v(0em)
== 习题 7.5

+ 计算下列极限：\
  （1）$lim_(x -> 0) (frac(1, x^2) - frac(1, sin^2 x))$；\
  （2）$lim_(x -> 1) (frac(1, x - 1) - frac(1, log x))$；\
  （3）$lim_(x -> a) frac(a^x - x^a, x - a) quad (a > 0)$；\
  （4）$lim_(x -> 0) frac(log(cos 2x), x sin x)$；\
  （5）$lim_(x -> 0) frac(arcsin 2x - 2 arcsin x, x^3)$；\
  （6）$lim_(x -> 0^+) (sin x)^x$；\
  （7）$lim_(x -> pi/4) (tan x)^(tan 2x)$；\
  （8）$lim_(x -> +oo) (x + sqrt(1 + x^2))^(1/log x)$；\
  （9）$lim_(x -> 0) frac((1 + x)^(1/x) - e, x)$；\
  （10）$lim_(x -> +oo) (frac(2, pi) arctan x)^x$.

+ 设 $f(x)$ 在 $x = 0$ 的某邻域内连续可导，且 $f(0) = 1$. 证明 $lim_(x -> 0) f(x)^(1/x) = e^(f'(0))$.

+ 设 $f(x)$ 在 $(a, +oo)$ 内可导，且

  $ lim_(x -> +oo) (f(x) + x f'(x) log x) = ell . $

  证明 $lim_(x -> +oo) f(x) = ell$.

+ 设 $f: RR -> RR$ 可导，且 $lim_(x -> +oo) (f'(x) + 2f(x)) = 0$，证明

  $ lim_(x -> +oo) f'(x) = 0 . $


#pagebreak(weak: true)


= 第八章 不定积分


#v(0em)
== 习题 8.1

+ 计算下列不定积分：\
  （1）$integral (4x^3 + 2x - 1) dif x$；\
  （2）$integral (2x^2 + sqrt(x) + root(3, x)) dif x$；\
  （3）$integral frac(1, x^2 - 1) dif x$；\
  （4）$integral (frac(1, x^2 + 1) + 3 sinh x) dif x$；\
  （5）$integral (frac(2, sqrt(1 - x^2)) + sin x) dif x$；\
  （6）$integral (e^x + frac(5, cos^2 x)) dif x$.


#pagebreak(weak: true)


#v(0em)
== 习题 8.2

+ 利用凑微分法或换元法计算下列不定积分：\
  （1）$integral root(3, 3x - 2) dif x$；\
  （2）$integral x^2 sqrt(1 + x^3) dif x$；\
  （3）$integral frac(dif x, e^x + e^(-x))$；\
  （4）$integral frac(cos sqrt(x), sqrt(x)) dif x$；\
  （5）$integral frac(dif x, sqrt(x(1 - x)))$；\
  （6）$integral frac(dif x, sin x)$；\
  （7）$integral tan^3 x dif x$；\
  （8）$integral frac(dif x, a^2 sin^2 x + b^2 cos^2 x) quad (a, b != 0)$；\
  （9）$integral frac(dif x, sqrt((x + a)(x + b)))$；\
  （10）$integral frac(dif x, sqrt((x - a)(b - x))) quad (a < b)$；\
  （11）$integral frac(dif x, sqrt(1 + e^x))$；\
  （12）$integral frac(dif x, sqrt(x) + root(3, x))$.

+ 利用分部积分法计算下列不定积分：\
  （1）$integral sqrt(x) log x dif x$；\
  （2）$integral x^2 e^(-x) dif x$；\
  （3）$integral x sin^2 x dif x$；\
  （4）$integral arcsin x dif x$；\
  （5）$integral arctan sqrt(x) dif x$；\
  （6）$integral cos(log x) dif x$.

+ 计算下列不定积分：\
  （1）$integral e^(sqrt(x)) dif x$；\
  （2）$integral cos^2 sqrt(x) dif x$；\
  （3）$integral (arcsin x)^2 dif x$；\
  （4）$integral x log(x^4 + 1) dif x$；\
  （5）$integral sqrt(x) arctan sqrt(x) dif x$；\
  （6）$integral frac(1, (e^x + 1)^2) dif x$.


#pagebreak(weak: true)


#v(0em)
== 习题 8.3

+ 计算下列不定积分：\
  （1）$integral frac(2, x^2 + 4x + 3) dif x$；\
  （2）$integral frac(3x + 1, (x + 2)(x + 3)) dif x$；\
  （3）$integral frac(x^2, (x + 1)^2019) dif x$；\
  （4）$integral frac(x^2, (x + 1)(x - 2)) dif x$；\
  （5）$integral frac(x^2 + 1, (x - 1)(x + 1)^2) dif x$；\
  （6）$integral frac(1, (x + 1)(x^2 + 1)) dif x$；\
  （7）$integral frac(1, x(x + 1)(x^2 + x + 1)) dif x$；\
  （8）$integral frac(1, (x + 1)(x + 2)^2 (x + 3)^3) dif x$；\
  （9）$integral frac(1, x^4 + 1) dif x$；\
  （10）$integral frac(1, x^6 + 1) dif x$.


#pagebreak(weak: true)


#v(0em)
== 习题 8.4

+ 计算下列不定积分：\
  （1）$integral sqrt((x + 2)/(x + 1)) dif x$；\
  （2）$integral frac(dif x, sqrt((x - 1)^3 (x - 2)))$；\
  （3）$integral frac(1, x) sqrt((1 + x)/(1 - x)) dif x$；\
  （4）$integral frac(dif x, root(n, (x - a)^(n+1) (x - b)^(n-1))) quad (n in ZZ_(>= 2))$；\
  （5）$integral frac(x^2, sqrt(x^2 + x + 1)) dif x$；\
  （6）$integral frac(dif x, (1 - x)^2 sqrt(1 - x^2))$；\
  （7）$integral frac(x dif x, (x - 1)^2 sqrt(1 + 2x - x^2))$；\
  （8）$integral frac(dif x, x + sqrt(x^2 + x + 1))$；\
  （9）$integral sin^2 x cos^4 x dif x$；\
  （10）$integral frac(dif x, sin^3 x)$；\
  （11）$integral frac(dif x, 1 + sin 2x)$；\
  （12）$integral frac(dif x, 5 - 3 cos x)$；\
  （13）$integral frac(dif x, 2 sin x - cos x + 5)$；\
  （14）$integral frac(dif x, (2 + cos x) sin x)$.

从第 2 题到第 7 题是一组题，利用反证法证明在一般情况下椭圆曲线 $y^2 = a x^3 + b x^2 + c x + d$ $(a != 0)$ 不能被有理函数参数化. 为方便起见，我们用 $CC[t]$ 表示关于变量 $t$ 的全体复系数多项式所成之集.

2. 在方程 $a x^3 + b x^2 + c x + d = 0$ 无重根的前提下利用线性的变量替换将椭圆曲线 $y^2 = a x^3 + b x^2 + c x + d$ 化为 $y^2 = x(x - 1)(x - omega)$ 的形式，其中 $omega in CC without {0, 1}$.

3. 设 $omega != 0, 1$，又设 $x = frac(p(t), q(t))$ 与 $y = frac(r(t), s(t))$ 满足方程 $y^2 = x(x - 1)(x - omega)$，其中 $p, q, r, s in CC[t]$，且 $p(t)$ 与 $q(t)$ 互素，$r(t)$ 与 $s(t)$ 互素：证明存在 $eta in CC$ 使得 $s(t)^2 = eta q(t)^3$.

4. 在上题条件下证明 $p(t)$，$q(t)$，$p(t) - q(t)$ 以及 $p(t) - omega q(t)$ 均是复系数多项式的平方.

5. 记

   $ S = {(p, q) : p, q in CC[t] " 互素，且存在不同时为" 0 "的 " lambda_j, mu_j (1 <= j <= 4) " 使得" \
     frac(lambda_j, mu_j) "（可以是" thin oo "）两两不同且 " lambda_j p + mu_j q " 均是复系数多项式的平方" }. $

   对 $max("deg" p, "deg" q)$ 使用无穷递降法证明 $S = CC^2$.

6. 设 $omega in CC without {0, 1}$，证明 $y^2 = x(x - 1)(x - omega)$ 不能被有理函数参数化.

7. 当 $omega in {0, 1}$ 时，试给出 $y^2 = x(x - 1)(x - omega)$ 的有理函数参数化表达式.


#pagebreak(weak: true)


= 第九章 定积分


#v(0em)
== 习题 9.1

+ 设 $[a, b] subset [c, d]$，$chi_([a, b])$ 是区间 $[a, b]$ 的特征函数. 利用定义证明 $chi_([a, b])$ 在 $[c, d]$ 上可积且

  $ integral_c^d chi_([a, b])(x) dif x = b - a. $

+ 利用定义证明狄利克雷函数

  $ D(x) = cases(1 "," & x in QQ, 0 "," & x in.not QQ) $

  在 $[0, 1]$ 上不可积.

+ 设 $f(x)$ 在 $[a, b]$ 上有定义，令 $x_i = a + frac((b - a) i, n)$ $(0 <= i <= n)$，如果极限

  $ lim_(n -> oo) frac(1, n) sum_(i=1)^n f(x_i) $

  存在，是否能说明 $f(x)$ 在 $[a, b]$ 上可积？

+ 设 $f(x)$ 在 $[a, b]$ 上非负可积且不恒等于 $0$，是否有 $integral_a^b f(x) dif x > 0$？

+ 设 $f(x)$ 在 $[a, b]$ 上可积且 $integral_a^b f(x) dif x > 0$，证明存在 $[a, b]$ 的开子区间 $I$，使得对任意的 $x in I$ 有 $f(x) > 0$.


#pagebreak(weak: true)


#v(0em)
== 习题 9.2

+ 设 $f(x)$ 在 $[a, b]$ 上有界，记 $alpha(x) = inf_(t in [a, x]) f(t)$，$beta(x) = sup_(t in [a, x]) f(t)$. 证明 $alpha(x)$ 和 $beta(x)$ 均在 $[a, b]$ 上可积.

+ 设 $f(x)$ 是定义在 $[a, b]$ 上的函数，且存在常数 $M$，使得对于 $[a, b]$ 的任意一组分点 $a = x_0 < x_1 < dots.c < x_n = b$ 均有

  $ sum_(i=1)^n |f(x_i) - f(x_(i-1))| <= M. $

  证明 $f(x)$ 在 $[a, b]$ 上可积.

+ （黎曼）设 $f(x)$ 在 $[a, b]$ 上有界. 证明 $f(x)$ 在 $[a, b]$ 上可积的充要条件是：对任意的 $epsilon > 0$ 及 $eta > 0$，存在 $[a, b]$ 的分点 $a = x_0 < x_1 < dots.c < x_n = b$，使得满足 $omega_i >= epsilon$ 的子区间 $[x_(i-1), x_i]$ 的长度之和小于 $eta$，这里 $omega_i$ 表示 $f(x)$ 在 $[x_(i-1), x_i]$ 上的振幅.

+ 证明黎曼函数

  $ R(x) = cases(frac(1, q) #sym.comma quad & x = frac(p, q) #sym.comma quad q > 0 " 且 " p #sym.comma thin q " 互素" #sym.comma, 0 #sym.comma quad & x " 为无理数") $

  在 $[0, 1]$ 上可积.


#pagebreak(weak: true)


#v(0em)
== 习题 9.3

+ 设 $a < b$，证明以 $a, b$ 为端点的区间不是勒贝格零测集.

+ 证明 $[0, 1] without QQ$ 不是勒贝格零测集.

+ 设 $S$ 是 $RR$ 的一个非空子集. 证明 $S$ 是勒贝格零测集的充要条件是：存在开区间列 $\{I_n\}$ 使得 $sum_(n=1)^oo |I_n|$ 收敛（$|I_n|$ 表示区间 $I_n$ 的长度）且 $S$ 中每个元素均含于无穷多个 $I_n$ 内.

+ 设 $f$ 是定义在 $[a, b]$ 上的有界函数，证明 $|f|$ 在 $[a, b]$ 上可积当且仅当 $f^2$ 在 $[a, b]$ 上可积.

+ 设 $f$ 和 $g$ 均在 $[a, b]$ 上可积，证明函数 $max(f, g)$ 和 $min(f, g)$ 也在 $[a, b]$ 上可积.

+ 设 $f$ 在 $[a, b]$ 上可积，$g$ 在 $[c, d]$ 上连续，且 $f([a, b]) subset.eq [c, d]$，证明 $g compose f$ 在 $[a, b]$ 上可积.

+ 设 $f$ 在 $[a, b]$ 上可积，$g$ 在 $[c, d]$ 上可积，且 $f([a, b]) subset.eq [c, d]$，举例说明 $g compose f$ 未必在 $[a, b]$ 上可积.

+ 设 $f$ 在 $[a, b]$ 上不可积，$g$ 在 $[c, d]$ 上不可积，且 $f([a, b]) subset.eq [c, d]$，举例说明 $g compose f$ 可以在 $[a, b]$ 上可积，也可以在 $[a, b]$ 上不可积.

+ 设定义在 $[a, b]$ 上的函数 $f(x)$ 与 $g(x)$ 仅在有限多个点处函数值不同，如果 $f(x)$ 在 $[a, b]$ 上可积，证明 $g(x)$ 也在 $[a, b]$ 上可积，并且

  $ integral_a^b g(x) dif x = integral_a^b f(x) dif x . $

  如果把条件改为“$f(x)$ 与 $g(x)$ 仅在可数多个点处函数值不同”，结论还成立吗？

+ 设 $f(x)$ 是定义在 $[-1, 1]$ 上的凸函数，证明

  $ f(0) <= 1/2 integral_(-1)^1 f(x) dif x . $

+ （柯西－施瓦茨不等式）设 $f(x)$ 与 $g(x)$ 均在 $[a, b]$ 上可积，证明

  $ (integral_a^b f(x) g(x) dif x)^2 <= (integral_a^b f(x)^2 dif x)(integral_a^b g(x)^2 dif x) . $

+ （闵可夫斯基不等式）设 $f(x)$ 与 $g(x)$ 均在 $[a, b]$ 上可积，证明

  $ (integral_a^b (f(x) + g(x))^2 dif x)^(1/2) <= (integral_a^b f(x)^2 dif x)^(1/2) + (integral_a^b g(x)^2 dif x)^(1/2) . $

+ （琴生不等式）设 $g(x)$ 是 $[a, b]$ 上的连续的凸函数，$f(x)$ 在 $[0, 1]$ 上可积且 $f([0, 1]) subset.eq [a, b]$，证明

  $ g(integral_0^1 f(x) dif x) <= integral_0^1 g(f(x)) dif x . $


#pagebreak(weak: true)


#v(0em)
== 习题 9.4

+ 求极限：\
  （1）$lim_(x -> 0) frac(integral_0^x cos t^2 dif t, x)$；\
  （2）$lim_(x -> oo) frac(x integral_0^x e^(t^2) dif t, e^(x^2))$；\
  （3）$lim_(x -> 0) frac(integral_0^(x^2) log(t^(3/2) + 1) dif t, sin x - x + 1/6 x^3)$.

+ 设 $f(x)$ 在 $[0, 1]$ 上可微，且

  $ 2 integral_(1/2)^1 f(x) dif x = f(0) . $

  证明存在 $xi in (0, 1)$ 使得 $f'(xi) = 0$.

+ 设 $f(x)$ 在 $[a, b]$ 上连续，且对满足 $integral_a^b phi(x) dif x = 0$ 的任意连续函数 $phi(x)$ 均有

  $ integral_a^b f(x) phi(x) dif x = 0 , $

  证明 $f$ 是 $[a, b]$ 上的常值函数.

+ 设 $f(x)$ 在 $[0, 1]$ 上连续，且对任意的 $x in [0, 1]$ 有

  $ 0 <= f(x) <= integral_0^x f(t) dif t . $

  证明对任意的 $x in [0, 1]$ 有 $f(x) = 0$.

+ 设 $f in C(RR)$，且对任意的 $x in RR$ 有 $f(x) = 1 + integral_0^x f(t) dif t$，证明 $f(x) = e^x$.

+ 设 $f(x)$ 在 $[0, +oo)$ 上可微，且满足 $f(x) = e^(-g(x))$，其中 $g(x) = integral_0^x f(t) dif t$，求 $f(x)$.

+ 设 $f(x)$ 是定义在 $[1, +oo)$ 上的连续函数，且存在正实数 $c$ 与 $alpha$ 使得当 $x -> +oo$ 时有 $f(x) tilde alpha c x^(alpha - 1)$. 证明

  $ integral_1^x f(t) dif t tilde c x^alpha , quad "当" x -> +oo "时" . $

+ （陶伯（Tauber）定理）设 $f(x)$ 是区间 $[1, +oo)$ 上的递增函数，且存在正实数 $c$ 与 $alpha$ 满足

  $ integral_1^x f(t) dif t tilde c x^alpha , quad "当" x -> +oo "时" . $

  证明当 $x -> +oo$ 时有 $f(x) tilde alpha c x^(alpha - 1)$.

+ 设 $f(x)$ 在 $[a, b]$ 上可积. 证明：对任意的 $epsilon > 0$，存在 $[a, b]$ 上的连续函数 $p(x), q(x)$，使得在该区间上有 $p(x) <= f(x) <= q(x)$ 以及

  $ integral_a^b (q(x) - p(x)) dif x < epsilon . $

+ 设 $f(x)$ 是定义在 $[a, b]$ 上的非负连续函数，证明

  $ lim_(n -> oo) (integral_a^b f(x)^n dif x)^(1/n) = max_(x in [a, b]) f(x) . $

+ 设 $f(x)$ 在区间 $[0, +oo)$ 上严格单调递增且连续，$f(0) = 0$，用 $f^(-1)$ 表示 $f$ 在 $[0, +oo)$ 上的反函数.\
  （1）对任意的 $x in [0, +oo)$ 证明

  $ integral_0^x f(t) dif t + integral_0^(f(x)) f^(-1)(t) dif t = x f(x) , $

  （2）（杨不等式）对任意的 $x, y in [0, +oo)$ 证明

  $ integral_0^x f(t) dif t + integral_0^y f^(-1)(t) dif t >= x y , $

  并给出这一不等式的几何解释.


#pagebreak(weak: true)


#v(0em)
== 习题 9.5

+ 计算下列定积分：\
  （1）$integral_1^2 sqrt(x + 1) dif x$；\
  （2）$integral_0^(2 pi) sin^2 x dif x$；\
  （3）$integral_0^2 |x - 1| dif x$；\
  （4）$integral_(-1)^1 frac(dif x, x^2 + 1)$；\
  （5）$integral_0^2 frac(dif x, sqrt(x^2 + 4))$；\
  （6）$integral_0^1 frac(x, (1 + x)^3) dif x$；\
  （7）$integral_0^(pi/2) sin^4 x cos x dif x$；\
  （8）$integral_0^pi (x sin x)^2 dif x$；\
  （9）$integral_1^9 x root(3, 1 - x) dif x$；\
  （10）$integral_0^(pi/2) frac(dif x, a^2 sin^2 x + b^2 cos^2 x) quad (a b != 0)$；\
  （11）$integral_1^e (x log x)^2 dif x$；\
  （12）$integral_0^3 arcsin sqrt(frac(x, 1 + x)) dif x$.

+ 利用定积分计算下列数列极限：\
  （1）$lim_(n -> oo) (frac(1, n + 1) + frac(1, n + 2) + dots.c + frac(1, n + n))$；\
  （2）$lim_(n -> oo) frac(1, n) (sin frac(pi, n) + sin frac(2 pi, n) + dots.c + sin frac(n - 1, n) pi)$；\
  （3）$lim_(n -> oo) frac(1, n) (sqrt(1 + frac(1, n)) + sqrt(1 + frac(2, n)) + dots.c + sqrt(1 + frac(n, n)))$；\
  （4）$lim_(n -> oo) (frac(2^(1/n), n + 1) + frac(2^(2/n), n + 1/2) + dots.c + frac(2^(n/n), n + 1/n))$.

+ 利用习题 9.4 第 11 题中的杨不等式证明

  $ log y >= x + 1 - frac(e^x, y), quad forall x >= 0, y >= 1 . $

+ 在 $f(x)$ 有连续的 $n + 1$ 阶导数以及 $psi(x)$ 连续可导的前提下利用定理 5.13 证明第七章定理 2.12.

+ 设 $m, n$ 是正整数，计算

  $ upright("B")(m, n) = integral_0^1 x^(m - 1) (1 - x)^(n - 1) dif x . $

+ 求极限 $lim_(x -> +oo) (integral_0^x e^(t^2/x^3) dif t - x)$.

+ 证明：当 $x >= 2$ 时有

  $ integral_2^x frac(dif t, log t) = frac(x, log x) + upright(O)(frac(x, log^2 x)) . $

+ 证明：当 $x >= 2$ 时有

  $ integral_1^x e^(t^2) dif t = frac(e^(x^2), 2x) + upright(O)(frac(e^(x^2), x^3)) . $

+ （高斯）设 $0 < a < b$，利用变量替换

  $ sin x = frac(2 b sin t, (a + b) + (b - a) sin^2 t) $

  证明

  $ integral_0^(pi/2) frac(dif x, sqrt(a^2 sin^2 x + b^2 cos^2 x)) = integral_0^(pi/2) frac(dif t, sqrt(a b sin^2 t + ((a + b)/2)^2 cos^2 t)) . $

  并由此证明习题 3.3 第 2 题中数列 $\{a_n\}$ 和 $\{b_n\}$ 的公共极限为

  $ frac(pi, 2) (integral_0^(pi/2) frac(dif x, sqrt(a_1^2 sin^2 x + b_1^2 cos^2 x)))^(-1) . $

+ （沃利斯（Wallis）公式）利用例 5.12 证明

  $ product_(n=1)^oo (1 - frac(1, (2n + 1)^2)) = frac(pi, 4) quad "与" quad product_(n=1)^oo (1 - frac(1, 4n^2)) = frac(2, pi) . $

+ 设 $f(x)$ 在 $[a, b]$ 上连续，$g(x)$ 在 $[a, b]$ 上可导且 $g'(x) >= 0$，又设 $g'(x)$ 在 $[a, b]$ 上可积. 试从分部积分公式出发证明积分第二中值定理.

+ 假设函数 $g(x)$ 在 $[a, b]$ 上连续，$f(x)$ 在 $[a, b]$ 上连续可导，$frac(g(x), f'(x))$ 在 $[a, b]$ 上单调且 $abs(frac(f'(x), g(x))) >= m > 0$. 证明

  $ abs(integral_a^b g(x) cos f(x) dif x) <= frac(2, m) . $

+ 证明：对任意的实数 $a_1, a_2, dots.c, a_n$ 有

  $ sum_(j=1)^n sum_(k=1)^n frac(a_j a_k, j + k - 1) >= 0 , $

  其中等号成立当且仅当 $a_j$ $(1 <= j <= n)$ 全等于 $0$.

+ 勒让德多项式 $P_n(x)$ 由下式给出：

  $ P_n(x) = frac(1, 2^n n!) [(x^2 - 1)^n]^((n)), quad n in ZZ_(> 0) . $

  证明

  $ integral_(-1)^1 P_m(x) P_n(x) dif x = cases(frac(2, 2n + 1) & quad m = n "," , 0 & quad m != n ".") $

+ 设 $f(x)$ 在 $[-1, 1]$ 上连续，证明

  $ lim_(h -> 0^+) integral_(-1)^1 frac(h, h^2 + x^2) f(x) dif x = pi f(0) . $

从第 16 题到第 21 题是一组题，利用反证法证明 e 是超越数，这里所用的方法源于希尔伯特（D. Hilbert）[29].

#[
  #set enum(numbering: n => numbering("1.", n + 15))

  + 证明：若 e 是代数数（即是某个有理系数多项式的根），则存在正整数 $n$ 以及整数 $q_0 (q_0 != 0), q_1, q_2, dots.c, q_n$ 使得 $q_0 + q_1 e + dots.c + q_n e^n = 0$.

  + 设整数 $n$ 和 $q_i$ $(0 <= i <= n)$ 如上题，又设 $p$ 是一个素数. 记

    $ f(x) = x^(p - 1) (x - 1)^p dots.c (x - n)^p quad "以及" quad I(y) = integral_0^y e^(y - x) f(x) dif x . $

    证明

    $ I(y) = e^y sum_(j=0)^((n + 1)p - 1) f^((j))(0) - sum_(j=0)^((n + 1)p - 1) f^((j))(y) . $

  + 记 $J = sum_(k=0)^n q_k I(k)$，利用 $I$ 的定义及平凡估计证明 $|J| <= c^p$，其中 $c$ 是某个与 $p$ 无关的大于 $1$ 的实数.

  + 利用第 16, 17 两题结论证明

    $ J = - sum_(j=0)^((n + 1)p - 1) sum_(k=0)^n q_k f^((j))(k) . $

  + 任取素数 $p > max(abs(q_0), n)$，又设 $0 <= j <= (n + 1)p - 1$，$0 <= k <= n$. 证明当 $(j, k) != (p - 1, 0)$ 时有 $p! divides f^((j))(k)$，当 $(j, k) = (p - 1, 0)$ 时有 $(p - 1)! divides f^((j))(k)$ 及 $p! divides.not f^((j))(k)$. 进而证明 $|J| >= (p - 1)!$.

  + 证明当 $p$ 充分大时第 18, 20 两题中关于 $|J|$ 的估计是不相容的，从而得出矛盾.
]


#pagebreak(weak: true)


= 第十章 函数列与函数项级数


#v(0em)
== 习题 10.1

+ 求函数项级数 $sum_(n=2)^oo log(1 + (-1)^n/n^x)$ 的收敛集.

+ 记 $f_n(x) = lim_(k -> oo) cos^(2k)(n! pi x)$，证明 $\{f_n(x)\}$ 在 $RR$ 上逐点收敛于狄利克雷函数

  $ D(x) = cases(1 & quad x in QQ, 0 & quad x in.not QQ) $

+ 设 $\{f_n(x)\}$ 在 $E$ 上逐点收敛于 $f(x)$，且对任意的 $n in ZZ_(> 0)$ 而言，$f_n(x)$ 均在 $E$ 上有界，
  问 $f(x)$ 是否在 $E$ 上有界？

+ 设 $\{f_n(x)\}$ 在有限闭区间 $[a, b]$ 上逐点收敛于 $f(x)$，且对任意的 $n in ZZ_(> 0)$ 而言，$f_n(x)$ 均
  是 $[a, b]$ 上的连续函数，问 $f(x)$ 是否在 $[a, b]$ 上有界？

+ 设 $\{f_n(x)\}$ 在 $E$ 上逐点收敛于 $f(x)$. 若对任意的 $M > 0$，均存在 $n in ZZ_(>= 1)$ 及 $x in E$ 使
  得 $|f_n(x)| > M$，问 $f(x)$ 是否在 $E$ 上无界？

+ （德 · 拉 · 瓦莱 — 布桑）证明当 $s > 1$ 时有

  $ sum_(n=1)^oo 1/n^s = 1/(s - 1) + sum_(n=1)^oo [1/n^s + 1/(s - 1) (1/(n + 1)^(s - 1) - 1/n^(s - 1))]. $

  并证明上式右边的级数在 $0 < s < 1$ 时也收敛，这意味着我们可以把 $zeta(s)$ 延拓为 $(0, 1) union
  (1, +oo)$ 上的函数.


#pagebreak(weak: true)


#v(0em)
== 习题 10.2

+ 证明命题 2.4.

+ 研究下述函数列 $\{f_n(x)\}$ 在指定集合上的一致收敛性及内闭一致收敛性：\
  （1）$f_n(x) = frac(1, x + n)$，$x in RR_(> 0)$；\
  （2）$f_n(x) = frac(sin n x, n)$，$x in RR$；\
  （3）$f_n(x) = frac(x^n, 1 + x^n)$，$x in [0, 1)$；\
  （4）$f_n(x) = sqrt(x^2 + 1/n^2)$，$x in RR$；\
  （5）$f_n(x) = frac(x, n) log frac(x, n)$，$x in (0, 1]$；\
  （6）$f_n(x) = (frac(sin x, x))^n$，$x in (0, 1)$；\
  （7）$f_n(x) = frac(log(1 + e^(n x)), n)$，$x in RR_(> 0)$；\
  （8）$f_n(x) = (1 + x/n)^n$，$x in RR$；\
  （9）$f_n(x) = n(root(n, x) - 1)$，$x in RR_(>= 1)$.

+ 研究下述函数项级数在指定集合上的一致收敛性及内闭一致收敛性：\
  （1）$sum_(n=1)^oo frac(n^2 x, 1 + n^4 x^2)$，$x in (0, 1)$；\
  （2）$sum_(n=1)^oo frac(1, (x + n)(x + n + 1))$，$x in RR_(> 0)$；\
  （3）$sum_(n=1)^oo frac(sin n x, x^2 + n^2)$，$x in RR$；\
  （4）$sum_(n=1)^oo 2^n sin frac(1, 3^n x)$，$x in RR_(> 0)$；\
  （5）$sum_(n=1)^oo x^2 e^(-n x)$，$x in RR_(> 0)$；\
  （6）$sum_(n=1)^oo frac(1, n^x)$，$x in RR_(> 1)$；\
  （7）$sum_(n=1)^oo frac(sin x sin n x, sqrt(x + n))$，$x in RR_(>= 0)$；\
  （8）$sum_(n=1)^oo frac((-1)^n, sqrt(n + x)) (1 + frac(1, n + x))^n$，$x in RR_(> 0)$.

+ 设 $f$ 是定义在集合 $E$ 上的一个函数，记 $f_n(x) = frac([n f(x)], n)$，其中 $[t]$ 表示不超过 $t$ 的最大整
  数. 证明：函数列 $\{f_n(x)\}$ 在 $E$ 上一致收敛.

+ 设 $\{f_n(x)\}$ 与 $\{g_n(x)\}$ 均在 $E$ 上一致收敛，证明：对任意的 $alpha, beta in RR$，函数列 $\{alpha f_n(x) +
  beta g_n(x)\}$ 也在 $E$ 上一致收敛.

+ 设 $\{f_n(x)\}$ 在 $E$ 上一致收敛，且每个 $f_n(x)$ 在 $E$ 上均有界，证明：$\{f_n(x)\}$ 在 $E$ 上一致
  有界.

+ 设 $\{f_n(x)\}$ 与 $\{g_n(x)\}$ 均在 $E$ 上一致收敛. \
  （1）举例说明 $\{f_n(x) g_n(x)\}$ 未必在 $E$ 上一致收敛；\
  （2）如果对每个给定的 $n$，$f_n(x)$ 与 $g_n(x)$ 均在 $E$ 上有界，证明：$\{f_n(x) g_n(x)\}$ 在 $E$ 上一
  致收敛.

+ 记 $u_n(x) = (-1)^n (1 - x) x^n$，证明：$sum_(n=1)^oo u_n(x)$ 在 $[0, 1]$ 上绝对收敛且一致收敛，但 $sum_(n=1)^oo |u_n(x)|$
  在 $[0, 1]$ 上不一致收敛.

+ 设 $sum_(n=1)^oo u_n(x)$ 在 $[a, b)$ 上一致收敛，且 $sum_(n=1)^oo u_n(b)$ 收敛，证明：$sum_(n=1)^oo u_n(x)$ 在 $[a, b]$ 上一致
  收敛.

+ 设 $f$ 在 $RR$ 上连续. 对任意的正整数 $n$，记

  $ f_n(x) = 1/n sum_(i=0)^(n-1) f(x + i/n). $

  证明：$\{f_n(x)\}$ 在任一有界闭区间上一致收敛.

+ 设级数 $sum_(n=1)^oo frac(1, |a_n|)$ 收敛. 证明：函数项级数

  $ sum_(n=1)^oo frac(1, x - a_n) $

  在不包含 $a_n$（$n = 1, 2, dots.c$）的任一有界闭区间上绝对收敛且一致收敛.

+ 设 $\{a_n\}$ 是单调递减的非负数列，证明：$sum_(n=1)^oo a_n sin n x$ 在 $RR$ 上一致收敛的充要条件是

  $ lim_(n -> oo) n a_n = 0. $


#pagebreak(weak: true)


#v(0em)
== 习题 10.3

+ 计算极限：\
  （1）$lim_(x -> 0) sum_(n=1)^oo frac(cos n x, (2 + x)^n)$；\
  （2）$lim_(x -> 1) sum_(n=1)^oo frac(1, (x + n)(x + n + 1))$；\
  （3）$lim_(n -> oo) integral_0^1 frac(sqrt(x) log n, e^(n x^2)) dif x$；\
  （4）$lim_(n -> oo) integral_0^(pi/2) (1 + x/n)^n sin x dif x$.

+ 证明 $sum_(n=0)^oo frac(x^2, (1 + x^2)^n)$ 在不包含原点的任一有界闭区间上一致收敛.

+ （黎曼）对任意的 $x in RR$，用 $[x]$ 表示不超过 $x$ 的最大整数，并记

  $ g(x) = cases(x - [x] & x - [x] < 1/2, 0 & x - [x] = 1/2, x - [x] - 1 & x - [x] > 1/2.) $

  证明函数 $f(x) = sum_(n=1)^oo frac(g(n x), n^2)$ 在任一有界闭区间上可积.

+ 证明函数项级数 $sum_(n=0)^oo e^(-pi n^2 x)$ 在 $(0, +oo)$ 上收敛，若将其和函数记作 $f(x)$，证明 $f(x)$ 在
  $(0, +oo)$ 上任意阶可导.

+ 证明零阶贝塞尔（Bessel）函数

  $ J_0(x) = sum_(n=0)^oo frac((-1)^n, [(2n)!!]^2) x^(2n) $

  在 $RR$ 上满足微分方程 $x J_0''(x) + J_0'(x) + x J_0(x) = 0$.

+ 试举例说明：由在区间 $I$ 上处处不连续的函数所构成的函数列可以一致收敛于某个在 $I$ 上
  连续的函数.

+ 设函数列 $\{f_n(x)\}$ 在区间 $I$ 上一致收敛于 $f(x)$，并且每个 $f_n(x)$ 均在 $I$ 上一致连续，证
  明 $f(x)$ 也在 $I$ 上一致连续.

+ 设 $\{f_n(x)\}$ 在 $[a, b]$ 上一致收敛于 $f(x)$，且对任意的正整数 $n$ 而言 $f_n(x)$ 均在 $[a, b]$ 上可
  积. 证明 $f(x)$ 在 $[a, b]$ 上可积，且有

  $ lim_(n -> oo) integral_a^b f_n(x) dif x = integral_a^b f(x) dif x. $

+ 把 $(0, 1)$ 内的全体有理数排成一列，记作 $r_1, r_2, dots.c, r_n, dots.c$，并令

  $ f(x) = sum_(n=1)^oo frac(|x - r_n|, 2^n), quad forall x in (0, 1). $

  证明 $f(x)$ 在 $(0, 1)$ 上连续，并且在无理点处可导、在有理点处不可导.


#pagebreak(weak: true)


#v(0em)
== 习题 10.4

+ 求下列函数项级数的收敛区间：\
  （1）$sum_(n=1)^oo frac(3^n + (-2)^n, n) x^n$；\
  （2）$sum_(n=1)^oo (1 + 1/n)^(n^2) x^n$；\
  （3）$sum_(n=1)^oo (1 + 1/2 + dots.c + 1/n) x^n$；\
  （4）$sum_(n=1)^oo frac(2 - cos n, n) x^n$；\
  （5）$sum_(n=1)^oo frac(x^(n^2), 2^n)$；\
  （6）$sum_(n=1)^oo frac(1, 2n + 1) (frac(1 - x, 1 + x))^n$.

+ 在下列级数的收敛区间内求它们的和：\
  （1）$sum_(n=0)^oo frac(x^(2n+1), 2n + 1)$；\
  （2）$sum_(n=1)^oo frac(x^n, n(n + 1))$；\
  （3）$sum_(n=0)^oo (-1)^n n^2 x^n$；\
  （4）$sum_(n=1)^oo n(n + 2) x^n$.

+ 求幂级数 $1 + sum_(n=1)^oo frac((2n - 1)!!, (2n)!!) x^n$ 的收敛区间以及它的和.

+ 试求幂级数 $sum_(n=0)^oo binom(alpha, n) x^n$ 的收敛区间.

+ 令

  $ f(x) = cases(frac(log(1 + x), x) & quad x > 0, 1 & quad x = 0), $

  证明 $integral_0^1 f(x) dif x = frac(zeta(2), 2)$.

+ 设幂级数 $sum_(n=0)^oo a_n x^n$ 在 $(-1, 1)$ 上收敛，证明对任意的 $x in (-1, 1)$ 有

  $ sum_(n=0)^oo a_n x^n = frac(a_0, 1 - x) + frac(x, 1 - x) sum_(n=0)^oo (a_(n+1) - a_n) x^n. $

+ 证明当 $x -> 1^-$ 时有

  $ sum_(n=1)^oo (log n) x^n = frac(1, 1 - x) log frac(1, 1 - x) + O(frac(1, 1 - x)). $

+ 举例说明极限 $lim_(x -> R^-) (sum_(n=0)^oo a_n x^n)$ 的存在性无法保证级数 $sum_(n=0)^oo a_n R^n$ 收敛.

+ 设幂级数 $sum_(n=0)^oo a_n x^n$ 在 $(-R, R)$ 上收敛，且 $a_n >= 0$（$forall n >= 1$）. 又设

  $ lim_(x -> R^-) sum_(n=0)^oo a_n x^n = S, $

  证明 $sum_(n=0)^oo a_n R^n$ 收敛于 $S$.

+ （陶伯定理）设幂级数 $sum_(n=0)^oo a_n x^n$ 在 $(-1, 1)$ 上收敛，且 $lim_(n -> oo) n a_n = 0$. 如果 $lim_(x -> 1^-) (sum_(n=0)^oo a_n x^n) = S$，证明 $sum_(n=0)^oo a_n$ 收敛于 $S$.


#pagebreak(weak: true)


#v(0em)
== 习题 10.5

+ 设 $f(x)$ 在 $(-R, R)$ 上有幂级数展开式 $f(x) = sum_(n=0)^oo a_n x^n$，证明：\
  （1）若 $f$ 是奇函数，则对任意的非负整数 $n$ 有 $a_(2n) = 0$；\
  （2）若 $f$ 是偶函数，则对任意的非负整数 $n$ 有 $a_(2n+1) = 0$.

+ 设 $a$ 是一个实数，证明 $f(x) = frac(1, x - a)$ 在 $RR without {a}$ 上实解析.

+ 设
  $ f(t) = cases((sin t)/t & quad t != 0, 1 & quad t = 0.), $
  证明：对任意的 $x in RR$ 有
  $ integral_0^x f(t) dif t = sum_(n=0)^oo frac((-1)^n, (2n+1)!(2n+1)) x^(2n+1). $

+ 求 $f(x) = arcsin x$ 的麦克劳林展开式，并对正整数 $n$ 求 $f^((n))(0)$.

+ 求 $f(x) = log(x + sqrt(1 + x^2))$ 的麦克劳林展开式.

+ 求使得 $cosh x <= e^(lambda x^2)$ 对任意的实数 $x$ 均成立的 $lambda$ 的值.

+ 设
  $ F(alpha, beta, gamma, x) = 1 + sum_(n=1)^oo (alpha(alpha+1) dots.c (alpha+n-1) dot.op beta(beta+1) dots.c (beta+n-1)) / (n! gamma(gamma+1) dots.c (gamma+n-1)) x^n $
  是第四章例 2.14 中所定义的超几何级数. 证明：\
  （1）当 $|x| < 1$ 时有
  $ log frac(1+x, 1-x) = 2x F(1/2, 1, 3/2, x^2). $
  （2）对任意的 $x in RR$ 有
  $ e^x = lim_(lambda -> +oo) F(1, lambda, 1, x/lambda). $


#pagebreak(weak: true)


#v(0em)
== 习题 10.6

+ 求下列函数的麦克劳林展开式：\
  （1）$e^(-x^2)$；\
  （2）$sin^2 x$；\
  （3）$frac(x^3, (1 - x)^2)$；\
  （4）$frac(12 - 5x, 6 - 5x - x^2)$.

+ 写出下列函数的麦克劳林展开式至少到 $x^6$ 项：\
  （1）$x^2 sqrt(1 - x) + frac(1, 1 - x)$；\
  （2）$e^x log(1 - x)$；\
  （3）$log cos x$.

+ 设 $s > 2$，证明
  $ sum_(n=1)^oo (zeta(s) - frac(1, 1^s) - frac(1, 2^s) - dots.c - frac(1, n^s)) = zeta(s - 1) - zeta(s). $

+ 证明 $sum_(n=2)^oo (-1)^n frac(zeta(n), n) = gamma$，其中 $gamma$ 是欧拉常数.

+ 设 $frac(1, 1 - x - x^2)$ 的麦克劳林展开式为 $sum_(n=0)^oo a_n x^n$，证明
  $ sum_(n=0)^oo frac(a_(n+1), a_n a_(n+2)) = 2. $

+ 设 $B_n$ 由下式所定义：
  $ frac(x, e^x - 1) = sum_(n=0)^oo frac(B_n, n!) x^n, quad x in (-delta, 0) union (0, delta), $
  其中 $delta$ 是某个充分小的正数. 我们称 $B_n$ 为伯努利数（Bernoulli number）. \
  （1）证明：当 $n >= 2$ 时有 $B_n = sum_(j=0)^n binom(n, j) B_j$；\
  （2）计算 $B_n$ $(0 <= n <= 10)$ 的值；\
  （3）证明对任意的正整数 $n$ 有 $B_(2n+1) = 0$.

+ 设 $A subset.eq ZZ_(>= 0)$. 对 $x in (-1, 1)$，记
  $ f(x) = sum_(a in A) x^a. $
  现设 $n$ 和 $k$ 是正整数，并用 $R_k (n)$ 表示方程
  $ x_1 + x_2 + dots.c + x_k = n, quad x_j in A quad (1 <= j <= k) $
  的解数，证明
  $ R_k (n) = frac(1, n!) (frac(dif^n, dif x^n) f(x)^k) |_(x = 0), $
  并由此推出方程
  $ x_1 + x_2 + dots.c + x_k = n, quad x_j in ZZ_(>= 0) quad (1 <= j <= k) $
  的解数为 $binom(k + n - 1, n)$.


#pagebreak(weak: true)


#v(0em)
== 习题 10.7

+ 证明 (10.18).

+ 求函数 $f(x) = x^2$ $(0 <= x <= 1)$ 的 $n$ 阶伯恩斯坦多项式.

+ 求函数 $f(x) = e^x$ $(0 <= x <= 1)$ 的 $n$ 阶伯恩斯坦多项式.

+ 设 $f(x)$ 是定义在 $[-1, 1]$ 上的连续的偶函数，证明存在由只含偶数次幂的多项式构成的多项式列 $\{P_n (x)\}$，其在 $[-1, 1]$ 上一致收敛于 $f(x)$.

+ 设 $f in C([a, b])$ 且对任意的非负整数 $n$ 有
  $ integral_a^b f(x) x^n dif x = 0. $
  证明 $f$ 在 $[a, b]$ 上恒等于 $0$.

+ 设多项式序列 $\{P_n (x)\}$ 在 $RR$ 上一致收敛于 $f(x)$，证明 $f(x)$ 是多项式.

+ 设 $0 < a < b < 1$ 且 $f in C([a, b])$. 证明存在在 $[a, b]$ 上一致收敛于 $f$ 的整系数多项式序列.

从第 8 题到第 10 题是一组题，给出了与伯恩斯坦多项式相关的一些结果.

8. 对任意的 $n in ZZ_(>= 1)$ 及 $k in ZZ_(>= 0)$ 记
  $ P_(n,k)(x) = sum_(j=0)^n (j - n x)^k binom(n, j) x^j (1 - x)^(n-j), quad x in [0, 1]. $
  证明
  $ P_(n,k+2)(x) = x(1 - x) [P'_(n,k+1)(x) + n(k+1) P_(n,k)(x)]. $

9. 设 $P_(n,k)(x)$ 如上题所设，证明
  $ P_(n,k)(x) lt.double n^(floor(k/2)), quad forall x in [0, 1], $
  其中 $lt.double$ 常数仅与 $k$ 有关.

10. 设 $f$ 在 $[0, 1]$ 上有界，$x_0 in (0, 1)$，且 $f$ 在 $x_0$ 处二阶可导，证明
  $ B_n (f, x_0) = f(x_0) + frac(f''(x_0), 2n) x_0 (1 - x_0) + o(1/n). $


#pagebreak(weak: true)


#v(0em)
== 习题 10.8

+ 证明对任意的 $x in.not ZZ_(< 0)$ 有 $Pi(x+1) = (x+1) Pi(x)$，进而对 $x in.not ZZ_(<= 0)$ 得到 $Gamma(x+1) = x Gamma(x)$.

+ 设 $alpha > 0$，证明对任意的 $x in (-1, 1)$ 有
  $ frac(1, (1 - x)^alpha) = sum_(n=0)^oo frac(Gamma(n + alpha), n! Gamma(alpha)) x^n. $

+ 设 $x in.not ZZ_(<= 0)$，证明
  $ frac(1, Gamma(x)) = x e^(gamma x) product_(n=1)^oo (1 + x/n) e^(-x/n), $
  其中 $gamma$ 是欧拉常数.

+ 证明在 $RR_(> 0)$ 上有
  $ -frac(Gamma'(x), Gamma(x)) = frac(1, x) + gamma - sum_(n=1)^oo (frac(1, n) - frac(1, n + x)), $
  并由此得到 $Gamma'(1) = -gamma$.

+ 证明 $log Gamma(x)$ 是 $RR_(> 0)$ 上的凸函数.

+ 设 $x in.not ZZ_(<= 0)$，证明勒让德的倍元公式（duplication formula）
  $ Gamma(1/2) Gamma(2x) = 2^(2x-1) Gamma(x) Gamma(x + 1/2). $

+ 提前使用本书下册习题 18.3 第 9 题证明余元公式（reflection formula）
  $ Gamma(x) Gamma(1 - x) = frac(pi, sin pi x), quad forall x in.not ZZ. $

+ 证明范德瓦尔登所构造的连续函数 (10.22) 在 $RR$ 的任一子区间上均不单调.

利用函数项级数我们可以构造出一条覆盖整个正方形的连续曲线，因为这种类型的曲线最早是由佩亚诺于 1890 年提出的，所以也被称为佩亚诺曲线（Peano curve）. 从第 9 题到第 11 题是一组题，介绍由肖恩伯格（I. J. Schoenberg）于 1938 年所给出的佩亚诺曲线的例子.

9. 设 $f$ 是定义在 $RR$ 上的以 $2$ 为周期的偶函数，且
  $ f(t) = cases(0 & quad t in [0, 1/3), 3t - 1 & quad t in [1/3, 2/3), 1 & quad t in [2/3, 1].) $
  对任意的 $t in [0, 1]$，令
  $ x(t) = sum_(n=1)^oo frac(f(3^(2n-2) t), 2^n), quad y(t) = sum_(n=1)^oo frac(f(3^(2n-1) t), 2^n). $
  证明由参数方程 $t |-> (x(t), y(t))$ 所给出的曲线 $C$ 是位于正方形 $[0, 1]^2$ 内的连续曲线.

10. 对任意的点 $(a, b) in [0, 1]^2$，设 $a$ 与 $b$ 的二进制表示分别为
  $ a = sum_(n=1)^oo frac(a_n, 2^n), quad b = sum_(n=1)^oo frac(b_n, 2^n), $
  其中 $a_n, b_n in {0, 1}$ $(forall n >= 1)$. 证明：
  $ t_0 = frac(2a_1, 3) + frac(2b_1, 3^2) + frac(2a_2, 3^3) + frac(2b_2, 3^4) + dots.c + frac(2a_n, 3^(2n-1)) + frac(2b_n, 3^(2n)) + dots.c $
  属于 $[0, 1]$.

11. 沿用上题中的记号，对任意的 $n >= 1$ 证明 $f(3^(2n-2) t_0) = a_n$ 与 $f(3^(2n-1) t_0) = b_n$，进而得到 $x(t_0) = a$, $y(t_0) = b$. 这样就说明了第 9 题中定义的曲线 $C$ 覆盖了正方形 $[0, 1]^2$.


#pagebreak(weak: true)


= 第十一章 反常积分


#v(0em)
== 习题 11.1

+ 证明推论 1.7.

+ （柯西积分判别法）设 $a$ 是一个正整数，$f(x)$ 是 $[a, +oo)$ 上的单调递减的非负函数，证明级数 $sum_(n=a)^oo f(n)$ 与反常积分 $integral_a^(+oo) f(x) dif x$ 同敛散.

+ 判断下列反常积分的敛散性：\
  （1）$integral_0^(+oo) frac(sqrt(x), x^2 + x + 2) dif x$；\
  （2）$integral_1^(+oo) frac(arctan x, x sqrt(1 + x^2)) dif x$；\
  （3）$integral_1^(+oo) frac(log(1 + x), x^alpha) dif x$；\
  （4）$integral_0^(+oo) x^alpha e^(-x) dif x quad (alpha >= 0)$；\
  （5）$integral_3^(+oo) frac(1, (log x)^(log log x)) dif x$；\
  （6）$integral_1^(+oo) (frac(1, sqrt(x)) - sqrt(log frac(1 + x, x))) dif x$；\
  （7）$integral_1^(+oo) log(sin frac(1, x) + cos frac(1, x)) dif x$；\
  （8）$integral_1^(+oo) frac(1, 1 + x^alpha abs(sin x)) dif x quad (alpha > 0)$；\
  （9）$integral_1^(+oo) frac(x - [x] - 1/2, sqrt(x)) dif x$；\
  （10）$integral_1^(+oo) frac(sin x, x^(1 - 1/x)) dif x$.

+ 求下列反常积分的柯西主值：\
  （1）$integral_(-oo)^(+oo) arctan x dif x$；\
  （2）$integral_(-oo)^(+oo) frac(1 + x, 1 + x^2) dif x$.

+ 设 $f$ 是定义在 $RR$ 上的非负函数，且柯西主值 $"P.V." integral_(-oo)^(+oo) f(x) dif x$ 存在，证明 $integral_(-oo)^(+oo) f(x) dif x$ 收敛且

  $ integral_(-oo)^(+oo) f(x) dif x = "P.V." integral_(-oo)^(+oo) f(x) dif x. $

+ 证明 $integral_1^(+oo) (frac(1, [x]) - frac(1, x)) dif x = gamma$，其中 $gamma$ 是欧拉常数.

+ 设 $f$ 是定义在 $[a, +oo)$ 上的函数，且对任意的 $A > a$，$f$ 在 $[a, A]$ 上可积. 若存在趋于 $+oo$ 且满足 $A_1 >= a$ 的单调递增数列 $\{A_n\}$ 使得级数

  $ sum_(n=1)^oo integral_(A_n)^(A_(n+1)) f(x) dif x $

  收敛，且对每个 $n in ZZ_(gt.eq.slant 1)$，函数 $f$ 在 $(A_n, A_(n+1))$ 内不变号. 证明 $integral_a^(+oo) f(x) dif x$ 收敛.

+ 证明 $integral_1^(+oo) frac((-1)^(floor sqrt(x)), x) dif x$ 收敛.

+ 设 $f(x)$ 在 $[a, +oo)$ 上非负且 $integral_a^(+oo) f(x) dif x$ 收敛，那么 $integral_a^(+oo) f(x)^2 dif x$ 是否一定收敛？

+ 设 $f$ 在 $[a, +oo)$ 上非负连续且 $integral_a^(+oo) f(x) dif x$ 收敛，举例说明 $lim_(x -> +oo) f(x) = 0$ 未必成立.

+ 设 $f$ 在 $[a, +oo)$ 上一致连续且 $integral_a^(+oo) f(x) dif x$ 收敛，证明 $lim_(x -> +oo) f(x) = 0$.

+ 设 $f$ 在 $[a, +oo)$ 上单调递减且非负，证明 $integral_a^(+oo) f(x) dif x$ 与 $integral_a^(+oo) f(x) sin^2 x dif x$ 同敛散.

+ 设 $f$ 在 $[a, +oo)$ 上单调且 $integral_a^(+oo) f(x) dif x$ 收敛，证明 $lim_(x -> +oo) x f(x) = 0$.

+ 设 $f$ 是定义在 $[a, +oo)$ 上的函数，且对任意的 $A > a$，$f$ 在 $[a, A]$ 上可积. 记

  $ f^+(x) = frac(abs(f(x)) + f(x), 2), quad f^-(x) = frac(abs(f(x)) - f(x), 2). $

  证明：\
  （1）若 $integral_a^(+oo) f(x) dif x$ 绝对收敛，则 $integral_a^(+oo) f^+(x) dif x$ 与 $integral_a^(+oo) f^-(x) dif x$ 均收敛，且

  $ integral_a^(+oo) f(x) dif x = integral_a^(+oo) f^+(x) dif x - integral_a^(+oo) f^-(x) dif x. $

  （2）若 $integral_a^(+oo) f(x) dif x$ 条件收敛，则 $integral_a^(+oo) f^+(x) dif x$ 与 $integral_a^(+oo) f^-(x) dif x$ 均发散于 $+oo$，且当 $x -> +oo$ 时有

  $ integral_a^x f^+(t) dif t ~ integral_a^x f^-(t) dif t. $


#pagebreak(weak: true)


#v(0em)
== 习题 11.2

+ 判断下列反常积分的敛散性：\
  （1）$integral_0^(1/2) frac(dif x, log x)$；\
  （2）$integral_0^1 x^p (log frac(1, x))^q dif x quad (p, q in RR)$；\
  （3）$integral_0^(+oo) x^(p-1) e^(-x) dif x quad (p in RR)$；\
  （4）$integral_0^(pi/2) frac(dif x, sin^p x cos^q x) quad (p > 0, q > 0)$；\
  （5）$integral_0^(+oo) frac(sin x, x^p) dif x quad (p > 0)$；\
  （6）$integral_0^(+oo) frac(dif x, abs(x - 1)^p dot.c abs(x - 2)^q) quad (p > 0, q > 0)$.

+ 求下列反常积分的柯西主值：\
  （1）$integral_0^3 frac(dif x, 1 - x^2)$；\
  （2）$integral_(1/2)^2 frac(dif x, x log x)$.

+ 设 $f(x)$ 是 $(0, 1]$ 上的单调函数，且 $x = 0$ 是 $f$ 唯一的奇点. 证明 $integral_0^1 f(x) dif x$ 收敛当且仅当极限 $lim_(n -> oo) frac(1, n) sum_(k=1)^n f(frac(k, n))$ 存在，并且当这一反常积分收敛时有

  $ lim_(n -> oo) frac(1, n) sum_(k=1)^n f(frac(k, n)) = integral_0^1 f(x) dif x. $

+ 令 $f(x) = frac(1, x) - frac(1, 1 - x)$，证明 $f(x)$ 在 $(0, 1)$ 上单调，且极限 $lim_(n -> oo) frac(1, n) sum_(k=1)^(n-1) f(frac(k, n))$ 存在，但是 $integral_0^1 f(x) dif x$ 发散. 注意将本题与上题做比较.

+ 设 $f(x)$ 是 $(0, 1]$ 上的单调函数，$x = 0$ 是 $f$ 唯一的奇点，且 $integral_0^1 f(x) dif x$ 收敛，那么是否对任意选取的 $xi_k in (frac(k - 1, n), frac(k, n)] (1 <= k <= n)$ 均有

  $ integral_0^1 f(x) dif x = lim_(n -> oo) frac(1, n) sum_(k=1)^n f(xi_k)? $


#pagebreak(weak: true)


#v(0em)
== 习题 11.3

+ 计算下列反常积分：\
  （1）$integral_(-1)^1 frac(dif x, sqrt(1 - x^2))$；\
  （2）$integral_0^(+oo) e^(-a x) cos b x dif x quad (a > 0)$；\
  （3）$integral_0^(+oo) x^2 e^(-x) dif x$；\
  （4）$integral_0^1 x log x dif x$；\
  （5）$integral_1^2 frac(dif x, x sqrt(x^2 - 1))$；\
  （6）$integral_0^(+oo) frac(sqrt(x), x^2 + 1) dif x$；\
  （7）$integral_0^(pi/2) frac(x, tan x) dif x$；\
  （8）$integral_0^(+oo) frac(arctan 10x - arctan x, x) dif x$.

+ 假设 $s > 0$，利用 (11.7) 证明 $Gamma(s + 1) = s Gamma(s)$，并由此对正整数 $n$ 得出 $Gamma(n) = (n - 1)!$.

+ 设 $alpha in RR$，计算 $integral_0^(+oo) frac(1, (1 + x^2)(1 + x^alpha)) dif x$.

+ 证明 $integral_0^(+oo) frac(sin (x - 1/x), x) dif x = 0$.

+ 设 $a, b > 0$，且反常积分 $integral_0^(+oo) f(a x + frac(b, x)) dif x$ 收敛，证明

  $ integral_0^(+oo) f(a x + frac(b, x)) dif x = frac(1, a) integral_0^(+oo) f(sqrt(x^2 + 4 a b)) dif x. $

+ 设 $p, q > 0$，讨论积分 $integral_0^(+oo) frac(sin x^p, x^q) dif x$ 的敛散性.

+ 设 $p > 0$，研究反常积分 $integral_0^(+oo) frac(sin (x + 1/x), x^p) dif x$ 的绝对收敛性和条件收敛性.

+ 设 $f(x)$ 在 $[0, +oo)$ 上连续，且反常积分 $integral_1^(+oo) frac(f(x), x) dif x$ 收敛，证明：对任意的正实数 $a, b$ 有

  $ integral_0^(+oo) frac(f(a x) - f(b x), x) dif x = f(0) log frac(b, a). $

  并利用这一结果计算 $integral_0^(+oo) frac(cos a x - cos b x, x) dif x$.

+ 证明 $integral_0^1 frac(log(1 - x), x) dif x = -zeta(2)$.

+ 证明 $integral_0^1 x^(-x) dif x = sum_(n=1)^oo frac(1, n^n)$.


#pagebreak(weak: true)


#v(0em)
== 习题 11.4

+ 利用命题 1.12 证明 (11.12).

+ 设 $\{a_n\}$ 是一个数列，$A(x) = sum_(n <= x) a_n$. 证明：对任意的 $x > 1$ 有

  $ sum_(n <= x) a_n log frac(x, n) = integral_1^x frac(A(t), t) dif t. $

+ 设 $x >= 2$，证明：

  $ sum_(n <= x) frac(log n, n) = frac(1, 2) log^2 x + A + O(frac(log x, x)), $

  其中 $A$ 是一个常数.

+ 证明

  $ sum_(n=1)^oo (-1)^n frac(log n, n) = gamma log 2 - frac(log^2 2, 2), $

  其中 $gamma$ 是欧拉常数.

+ （狄利克雷）设 $A >= 1$，利用习题 1.2 第 16 题证明双曲线 $x y = A (x > 0, y > 0)$ 下方（包含该双曲线）横、纵坐标均为正整数的整点的个数为

  $ A log A + (2 gamma - 1) A + O(sqrt(A)). $

+ （高斯）设 $r > 0$，证明圆 $x^2 + y^2 = r^2$ 内的整点个数为 $pi r^2 + O(r)$.

+ 证明：当 $s -> 1^+$ 时有

  $ log zeta(s) = -log(s - 1) + O(s - 1). $

+ 证明当 $x -> +oo$ 时有

  $ sum_(n=1)^oo frac(x, n^2 + x^2) = frac(pi, 2) + O(frac(1, x)). $

+ 证明：对任意的正整数 $n$ 有 $(2n - 1)!! = sqrt(2) (2n)^n e^(-n) (1 + O(frac(1, n)))$.

+ 利用上题结论计算无穷乘积 $product_(n=1)^oo (1 + frac((-1)^(n-1), 2n - 1))$.

+ （斯特林公式）证明：当 $x >= 1$ 时有

  $ log Gamma(x) = (x - frac(1, 2)) log x - x + frac(1, 2) log 2 pi + O(frac(1, x)). $

+ 设 $B_n (x)$ 是以 $1$ 为周期的函数，且满足

  $ B_0 (x) = 1, quad forall x in [0, 1), \
    B'_(n+1) (x) = (n + 1) B_n (x), quad forall x in [0, 1), n >= 0, \
    integral_0^1 B_n (x) dif x = 0, quad forall n >= 1. $

  证明 $B_n (x)$ 都是关于 $\{x\}$ 的多项式且

  $ B_1 (x) = \{x\} - frac(1, 2), \
    B_2 (x) = \{x\}^2 - \{x\} + frac(1, 6), \
    B_3 (x) = \{x\}^3 - frac(3, 2) \{x\}^2 + frac(1, 2) \{x\}, \
    B_4 (x) = \{x\}^4 - 2 \{x\}^3 + \{x\}^2 - frac(1, 30). $

  其中 $\{x\} = x - [x]$ 表示 $x$ 的小数部分. 我们称 $B_n (x)$ 为伯努利多项式.

+ 设 $x in [0, 1)$. 证明在 $t = 0$ 的某去心邻域内

  $ sum_(n=0)^oo frac(B_n (x), n!) t^n $

  收敛于 $frac(t e^(t x), e^t - 1)$，并由此推出 $B_n (0)$ 也即是习题 10.6 第 6 题中所定义的伯努利数 $B_n$.

+ （欧拉－麦克劳林求和公式）设 $a, b$ 均是整数，$f in C^(k+1)([a, b]) (k in ZZ_(gt.eq.slant 0))$，证明

  $ sum_(a < n <= b) f(n) = integral_a^b f(x) dif x + sum_(j=1)^(k+1) (-1)^j frac(B_j (0), j!) (f^((j-1))(b) - f^((j-1))(a)) \
    quad + frac((-1)^k, (k+1)!) integral_a^b B_(k+1)(x) f^((k+1))(x) dif x. $

+ 设 $N$ 是一个正整数，证明存在 $theta in [0, 1]$ 使得

  $ sum_(n <= N) frac(1, n) = log N + gamma + frac(1, 2N) - frac(1, 12 N^2) + frac(theta, 60 N^4). $

+ 利用上题结论计算欧拉常数 $gamma$ 至小数点后五位.

+ 设 $k$ 是一个正整数，证明：对任意的 $s > 1$ 有

  $ zeta(s) = frac(1, s - 1) + frac(1, 2) + sum_(j=2)^(k+1) frac(s(s+1) dots.c (s+j-2), j!) B_j (0) \
    quad - frac(s(s+1) dots.c (s+k), (k+1)!) integral_1^(+oo) frac(B_(k+1)(x), x^(s+k+1)) dif x. $

  并说明由此可将黎曼 $zeta$ 函数延拓为 $RR \\ {1}$ 上的函数，我们把延拓后的函数仍记作 $zeta(s)$.

+ 设 $zeta(s)$ 是如上题延拓后的函数，利用习题 10.6 第 6 题的结论证明 $zeta(0) = -frac(1, 2)$ 以及

  $ zeta(-2n) = 0, quad forall n in ZZ_(gt.eq.slant 1). $

