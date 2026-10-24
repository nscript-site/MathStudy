// ===== 页面与基础设置 =====
#set document(title: "导数与积分的计算")

// #set page(
//   paper: "iso-b5",
//   margin: (top: 15.5mm, bottom: 18.4mm, left: 18.7mm, right: 18.7mm),
//   numbering: "1",
//   number-align: center,
// )

#set page(
  width: 90mm,
  height: 180mm,
  margin: (x: 8mm, y: 10mm, top: 12mm, bottom: 12mm),
  fill: rgb(255, 255, 255),
  footer: context {
    let p = here().page()
    if p > 1 {
      align(center)[
        #text(size: 10pt, fill: rgb(90, 90, 90))[#str(p)]
      ]
    }
  },
)

#set text(
  font: ("New Computer Modern", "Noto Serif CJK SC", "SimSun"),
  size: 9pt,
  lang: "zh",
  region: "cn",
)

#set par(
  justify: true,
  leading: 0.72em,
)

// 段落首行缩进 2 字符（自动缩进对紧跟标题/块级公式的段落会失效，故统一手工补）
#set par(first-line-indent: 0em, leading: 0.75em)


#set math.equation(numbering: none)

// ===== 标题编号：二级 2.1、三级 2.1.1；一级为章名，不显示编号 =====
#set heading(numbering: "2.1.1")

// 一级标题：居中，上下空白远大于行间距
#show heading.where(level: 1): it => block(
  width: 100%,
  above: 2.6em,
  below: 2.2em,
  align(center, text(size: 15pt, weight: "bold", it.body)),
)

// 二级标题
#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.9em,
  below: 1.1em,
  text(size: 11.5pt, weight: "bold", [#numbering("2.1", ..counter(heading).get().slice(1))#h(0.55em)#it.body]),
)

// 三级标题：加粗小标题
#show heading.where(level: 3): it => block(
  width: 100%,
  above: 1.7em,
  below: 1.05em,
  text(size: 10pt, weight: "bold", [#numbering("2.1.1", ..counter(heading).get().slice(1))#h(0.55em)#it.body]),
)

// 列表与枚举：列表项内不再首行缩进
#set list(spacing: 0.9em, indent: 0em, body-indent: 0.6em, marker: [•])
#set enum(numbering: n => numbering("(1)", n), spacing: 1.0em, indent: 0em, body-indent: 0.6em)
#show list: set par(first-line-indent: 0em)
#show enum: set par(first-line-indent: 0em)

// ===== 块级公式：过宽时等比缩放防止溢出 =====
#show math.equation.where(block: true): it => layout(size => {
  let m = measure(it)
  if m.width > size.width {
    scale(x: size.width / m.width * 100%, y: 100%, origin: top + left, reflow: true, it)
  } else {
    it
  }
})

// ===== 表格统一样式：三线表、居中、公式保持正常字号、整表不跨页 =====
#let mt(x) = math.equation(block: true, x)
#let datatable(header, body) = align(center, block(above: 0.9em, below: 0.9em, breakable: false,
  table(
    columns: header.len(),
    align: center + horizon,
    inset: (x: 0.7em, y: 0.42em),
    stroke: none,
    table.hline(stroke: 0.8pt),
    table.header(..header.map(h => mt(h))),
    table.hline(stroke: 0.5pt),
    ..body.map(row => row.map(c => mt(c))).flatten(),
    table.hline(stroke: 0.8pt),
  ),
))

= 第二章 随机变量及其分布
== 导数与积分的计算

#h(2em + 0.01em)导数与积分是概率论中最基本的计算工具，贯穿了从随机变量描述到数字特征求解的各个环节。

#h(2em)在导数方面，连续型随机变量的密度函数 $p(x)$ 与其分布函数 $F(x)$ 之间由微积分基本定理联系：

$ F(x) = integral_(-oo)^x p(t) dif t, quad p(x) = F'(x). $

#h(2em)因此，已知其一便可由求导或积分得到另一个。此外，求密度函数的极值点（即众数）、利用导数研究分布函数的单调性与凹凸性、由特征函数求原点矩，以及在最大似然估计中对似然函数取对数再求导（求导后令其为零，得到似然方程）等，都离不开求导运算。

#h(2em)在积分方面，连续型随机变量的概率由密度函数的积分给出：

$ P(a < X <= b) = integral_a^b p(x) dif x, $

#h(2em)数学期望与方差则表现为

$ E(X) = integral_(-oo)^(+oo) x p(x) dif x, quad E(g(X)) = integral_(-oo)^(+oo) g(x) p(x) dif x, $

$ D(X) = integral_(-oo)^(+oo) (x - E(X))^2 p(x) dif x. $

#h(2em)许多重要分布（如正态分布、指数分布、$Gamma$ 分布）的概率与数字特征都归结为特定形式的积分，其中最常用的是概率积分 $integral_(-oo)^(+oo) e^(-x^2\/2) dif x = sqrt(2 pi)$ 与 $Gamma$ 函数 $Gamma(alpha) = integral_0^(+oo) x^(alpha-1) e^(-x) dif x$。

#h(2em)本节汇总概率论中常用的求导公式与求导法则，以便查阅。

=== 基本求导公式

#h(2em)设下列各式中的函数均在相应区间内可导，其中 $a > 0$ 且 $a != 1$，$alpha$ 为任意常数。

// 基本求导公式：手机版面较窄，改用单栏逐行排列
#let f(x) = math.equation(block: true, x)
#align(center, block(above: 1em, below: 1em, {
  let rows = (
    $(C)' = 0$,
    $(x^alpha)' = alpha x^(alpha-1)$,
    $(a^x)' = a^x ln a$,
    $(e^x)' = e^x$,
    $(log_a x)' = 1/(x ln a)$,
    $(ln x)' = 1/x$,
    $(sin x)' = cos x$,
    $(cos x)' = -sin x$,
    $(tan x)' = 1/(cos^2 x)$,
    $(cot x)' = -1/(sin^2 x)$,
    $(arcsin x)' = 1/sqrt(1 - x^2)$,
    $(arctan x)' = 1/(1 + x^2)$,
  )
  grid(columns: 1, row-gutter: 0.8em, align: center, ..rows.map(r => f(r)))
}))

*【例 2.1.1.1】* 设 $y = x^3 + 2^x + ln x + sin x$，求 $y'$。

*解* 逐项求导：

$ y' = 3 x^2 + 2^x ln 2 + 1/x + cos x. $

*【例 2.1.1.2】* 设 $y = sqrt(x) dot arctan x$，求 $y'$ 及 $y'|_(x=1)$。

*解* 由乘积法则

$ y' = (sqrt(x))' arctan x + sqrt(x) (arctan x)' $

$ = (arctan x)/(2 sqrt(x)) + sqrt(x)/(1 + x^2). $

#h(2em)代入 $x = 1$ 得

$ y'|_(x=1) = pi/8 + 1/2. $

=== 导数的四则运算法则

#h(2em)设 $u = u(x)$，$v = v(x)$ 在点 $x$ 处可导，则

+ *和差法则*：$ (u +- v)' = u' +- v'. $

+ *乘积法则*：$ (u v)' = u' v + u v', $ 特别地，当 $C$ 为常数时 $ (C u)' = C u'. $

+ *商的法则*：$ (u/v)' = (u' v - u v')/v^2 quad (v(x) != 0), $ 特别地，$ (1/v)' = -v'/v^2, quad (C/v)' = -(C v')/v^2. $

#h(2em)上述法则可推广到有限个函数之积的情形。例如，若 $u, v, w$ 均可导，则

$ (u v w)' = u' v w + u v' w + u v w'. $

*【例 2.1.2.1】* 设 $y = (x^2 + 1) e^x sin x$，求 $y'$。

*解* 对三个因式之积套用推广的乘积法则：

$ y' = 2 x e^x sin x + (x^2 + 1) e^x sin x + (x^2 + 1) e^x cos x $

$ = e^x [(x^2 + 2 x + 1) sin x + (x^2 + 1) cos x]. $

*【例 2.1.2.2】* 设 $y = (x^2 + 1)/(x - 1)$，求 $y'$。

*解* 由商的法则

$ y' = (2 x (x - 1) - (x^2 + 1) dot 1)/((x - 1)^2) = (x^2 - 2 x - 1)/((x - 1)^2). $

#h(2em)注意分母求导后的平方不能漏写。

=== 复合函数求导

*链式法则*

#h(2em)设 $y = f(u)$ 在点 $u$ 处可导，$u = g(x)$ 在点 $x$ 处可导，且 $u = g(x)$ 的值域落在 $f$ 的定义域内，则复合函数 $y = f(g(x))$ 在点 $x$ 处可导，且

$ y_x' = f'(u) dot g'(x) quad "即" quad (dif y)/(dif x) = (dif y)/(dif u) dot (dif u)/(dif x). $

#h(2em)对多层复合的情形，由外及里、逐层求导、逐层相乘：

$ y_x' = f'(u) dot g'(v) dot h'(x), quad y = f(u), quad u = g(v), quad v = h(x). $

*对数求导法*

#h(2em)对幂指函数 $y = u(x)^(v(x))$（$u(x) > 0$）以及若干个因式连乘、连除的函数，可先取对数再求导。由

$ ln y = v(x) ln u(x) $

#h(2em)两边对 $x$ 求导，得

$ y'/y = v'(x) ln u(x) + v(x) (u'(x))/(u(x)), $

#h(2em)从而

$ y' = u(x)^(v(x)) [v'(x) ln u(x) + v(x) (u'(x))/(u(x))]. $

*【例 2.1.3.1】* 设 $y = e^(sin^2 x)$，求 $y'$。

*解* 由外及里逐层求导：外层为 $e^u$，中间层为 $u = v^2$，内层为 $v = sin x$，故

$ y' = e^(sin^2 x) dot 2 sin x dot cos x = e^(sin^2 x) sin 2 x. $

*【例 2.1.3.2】* 设 $y = x^x$（$x > 0$），求 $y'$。

*解* 两边取对数，得 $ln y = x ln x$，两边对 $x$ 求导：

$ y'/y = ln x + 1, $

#h(2em)故

$ y' = x^x (ln x + 1). $

=== 基本积分公式

#h(2em)下列公式由牛顿-莱布尼茨公式直接得到：若 $F'(x) = f(x)$，则

$ integral_a^b f(x) dif x = F(b) - F(a) quad (a < b). $

#h(2em)下列各式给出被积函数在区间 $[a, b]$ 上的定积分结果。

// 基本积分公式：手机版面较窄，改用单栏逐行排列，避免长公式被压缩
#align(center, block(above: 1em, below: 1em, {
  set par(leading: 1.5em)
  let rows = (
    $integral_a^b 0 dif x = 0$,
    $integral_a^b 1 dif x = b - a$,
    $integral_a^b x^alpha dif x = (b^(alpha+1) - a^(alpha+1))/(alpha+1) quad (alpha != -1)$,
    $integral_a^b 1/x dif x = ln |b/a| quad (0 < a < b)$,
    $integral_a^b c^x dif x = (c^b - c^a)/(ln c) quad (c > 0, c != 1)$,
    $integral_a^b e^x dif x = e^b - e^a$,
    $integral_a^b sin x dif x = cos a - cos b$,
    $integral_a^b cos x dif x = sin b - sin a$,
    $integral_a^b (dif x)/(cos^2 x) = tan b - tan a$,
    $integral_a^b (dif x)/(sin^2 x) = cot a - cot b$,
    $integral_a^b (dif x)/(1 + x^2) = arctan b - arctan a$,
    $integral_a^b (dif x)/sqrt(1 - x^2) = arcsin b - arcsin a$,
  )
  grid(columns: 1, row-gutter: 0.8em, align: center, ..rows.map(r => f(r)))
}))

#h(2em)此外，以下几个形式特殊的定积分在概率论中经常出现：

$ integral_(-oo)^(+oo) e^(-x^2\/2) dif x = sqrt(2 pi), $

$ integral_0^(+oo) x^(alpha-1) e^(-x) dif x = Gamma(alpha) quad (alpha > 0), $

$ integral_0^(+oo) e^(-lambda x) dif x = 1/lambda, $

$ integral_0^(+oo) x e^(-lambda x) dif x = 1/lambda^2 quad (lambda > 0). $

*【例 2.1.4.1】* 求 $integral_0^1 (2 x^3 - 3 x^2 + 4 x - 5) dif x$。

*解* 先用牛顿-莱布尼茨公式求原函数，再代入上下限：

$ integral_0^1 (2 x^3 - 3 x^2 + 4 x - 5) dif x = [1/2 x^4 - x^3 + 2 x^2 - 5 x]_0^1 $

$ = 1/2 - 1 + 2 - 5 = -7/2. $

*【例 2.1.4.2】* 求 $integral_0^1 (3^x + e^x) dif x$。

*解* 逐项求原函数并代入上下限：

$ integral_0^1 (3^x + e^x) dif x = [3^x/(ln 3) + e^x]_0^1 $

$ = (3/(ln 3) + e) - (1/(ln 3) + 1) = 2/(ln 3) + e - 1. $

*【例 2.1.4.3】* 求 $integral_0^(pi\/2) (sin x + 2 cos x) dif x$。

*解*

$ integral_0^(pi\/2) (sin x + 2 cos x) dif x = [-cos x + 2 sin x]_0^(pi\/2) $

$ = (0 + 2) - (-1 + 0) = 3. $

#h(2em)定积分的结果是一个数，不带常数 $C$。

=== 换元法

#h(2em)设 $f(u)$ 具有原函数 $F(u)$，函数 $x = psi(t)$ 单调可导且 $psi'(t) != 0$，则

$ integral f(x) dif x = integral f(psi(t)) psi'(t) dif t. $

#h(2em)对定积分，换元时上下限必须随新变量一起改变：

$ integral_a^b f(x) dif x = integral_alpha^beta f(psi(t)) psi'(t) dif t, $

#h(2em)其中 $a = psi(alpha)$，$b = psi(beta)$。

#h(2em)第一类换元法（凑微分）是把被积表达式凑成 $f(phi(x)) dif phi(x)$ 的形式。以定积分写出，

$ integral_a^b f(phi(x)) phi'(x) dif x = integral_(phi(a))^(phi(b)) f(u) dif u. $

#h(2em)使用换元法时须注意：新上下限由 $u = phi(x)$ 在原上下限处的取值确定，不必再回代原变量，这是定积分换元与不定积分换元的主要差别。

#h(2em)第二类换元法常用于去掉根号，例如令 $x = sin t$、$x = tan t$ 等。此时须要求 $psi(t)$ 在所取区间上单调，以保证反函数存在。

*【例 2.1.5.1】* 求 $integral_0^1 x e^(x^2) dif x$。

*解* 令 $u = x^2$，则 $dif u = 2 x dif x$；当 $x: 0 -> 1$ 时 $u: 0 -> 1$，故

$ integral_0^1 x e^(x^2) dif x = 1/2 integral_0^1 e^u dif u = 1/2 (e - 1). $

*【例 2.1.5.2】* 求 $integral_0^1 (2 x + 1)/(x^2 + x + 1) dif x$。

*解* 注意分母求导恰为分子：$(x^2 + x + 1)' = 2 x + 1$，故可凑成 $dif (x^2 + x + 1)$：

$ integral_0^1 (2 x + 1)/(x^2 + x + 1) dif x = integral_0^1 (dif (x^2 + x + 1))/(x^2 + x + 1) $

$ = [ln(x^2 + x + 1)]_0^1 = ln 3 - ln 1 = ln 3. $

*【例 2.1.5.3】* 求 $integral_0^1 sqrt(1 - x^2) dif x$。

*解* 作三角代换 $x = sin t$，当 $x: 0 -> 1$ 时 $t: 0 -> pi\/2$，且 $dif x = cos t dif t$，$sqrt(1 - x^2) = cos t$，于是

$ integral_0^1 sqrt(1 - x^2) dif x = integral_0^(pi\/2) cos^2 t dif t $

$ = 1/2 integral_0^(pi\/2) (1 + cos 2 t) dif t $

$ = 1/2 [t + 1/2 sin 2 t]_0^(pi\/2) = pi/4. $

#h(2em)这一结果即单位圆四分之一区域的面积。

=== 分部积分法

#h(2em)设 $u = u(x)$，$v = v(x)$ 均具有连续导数，则由乘积求导公式可得不定积分的分部积分公式

$ integral u dif v = u v - integral v dif u. $

#h(2em)对定积分，分部积分公式为

$ integral_a^b u(x) v'(x) dif x = [u(x) v(x)]_a^b - integral_a^b u'(x) v(x) dif x. $

#h(2em)当被积函数是两类函数的乘积时，按“反对幂指三”的次序选取 $u$：反三角函数、对数函数、幂函数、指数函数、三角函数依次靠前者优先取为 $u$。例如

$ integral_1^e x ln x dif x = 1/2 [x^2 ln x]_1^e - 1/2 integral_1^e x dif x. $

#h(2em)对形如 $integral_0^(+oo) x^n e^(-lambda x) dif x$ 的积分，可反复套用分部积分得到递推式

$ integral_0^(+oo) x^n e^(-lambda x) dif x = n/lambda integral_0^(+oo) x^(n-1) e^(-lambda x) dif x quad (n >= 1), $

#h(2em)由此递推可得

$ integral_0^(+oo) x^n e^(-lambda x) dif x = n!/lambda^(n+1) quad (lambda > 0). $


*【例 2.1.6.1】* 求 $integral_1^e x ln x dif x$。

*解* 取 $u = ln x$，$dif v = x dif x$，即 $v = x^2\/2$，得

$ integral_1^e x ln x dif x = [1/2 x^2 ln x]_1^e - 1/2 integral_1^e x dif x $

$ = e^2/2 - 1/2 [x^2/2]_1^e = e^2/2 - (e^2 - 1)/4 = (e^2 + 1)/4. $

*【例 2.1.6.2】* 求 $integral_0^pi x sin x dif x$。

*解* 取 $u = x$，$dif v = sin x dif x$，即 $v = -cos x$，得

$ integral_0^pi x sin x dif x = [-x cos x]_0^pi + integral_0^pi cos x dif x $

$ = pi + [sin x]_0^pi = pi. $

*【例 2.1.6.3】* 求 $integral_0^1 x e^(-x) dif x$。

*解* 取 $u = x$，$dif v = e^(-x) dif x$，即 $v = -e^(-x)$，得

$ integral_0^1 x e^(-x) dif x = [-x e^(-x)]_0^1 + integral_0^1 e^(-x) dif x $

$ = -e^(-1) + [-e^(-x)]_0^1 = 1 - 2/e. $

=== 练习题

#h(2em)以下练习题覆盖本节的求导公式、求导法则、复合函数求导以及定积分的计算方法，难度由浅入深。

+ 求下列函数的导数：

  $ y = x^5, quad y = 3 x^2 - 2 x + 1, quad y = 1/x + sqrt(x). $

+ 求 $y = 2^x + log_3 x$ 的导数。

+ 求 $y = sin x dot cos x$ 的导数。

+ 求 $y = tan x$ 的导数，并说明为什么 $(tan x)' = 1/(cos^2 x)$。

+ 求 $y = (x^2 + 1)(x - 2)$ 的导数，分别用乘积法则与先展开再求导两种方法，比较结果。

+ 求 $y = (3 x + 1)/(x^2 + 1)$ 的导数。

+ 求 $y = arctan x + arcsin x$ 的导数。

+ 求 $y = e^x sin x$ 在 $x = 0$ 处的导数值。

+ 求 $y = ln(x^2 + 1)$ 的导数。

+ 求 $y = e^(3 x)$ 与 $y = sin(2 x)$ 的导数。

+ 求 $y = sqrt(x^2 + 1)$ 的导数。

+ 求 $y = cos^3 x$ 的导数。

+ 求 $y = ln(sin x)$ 的导数，并写出其定义域。

+ 求 $y = e^(-x^2\/2)$ 的导数，并求 $y' = 0$ 的点。

+ 求 $y = (1 + x^2)^(10)$ 的导数。

+ 求 $y = x^2 e^(-x)$ 的导数，并求其极值点。

+ 用对数求导法求 $y = x^(sin x)$（$x > 0$）的导数。

+ 用对数求导法求 $y = (x + 1)^2 sqrt(x - 1)$（$x > 1$）的导数。

+ 求下列定积分：

  $ integral_1^2 (x^2 + 1/x) dif x, quad integral_0^(pi\/2) sin x dif x. $

+ 求 $integral_0^1 (e^x + 2^x) dif x$。

+ 求 $integral_1^4 (1 + sqrt(x)) dif x$。

+ 用换元法求 $integral_0^1 (2 x + 1)^5 dif x$。

+ 用换元法求 $integral_0^(pi\/2) sin^3 x cos x dif x$。

+ 求 $integral_1^e (ln x)/x dif x$。

+ 用分部积分法求 $integral_0^1 x e^(2 x) dif x$。

+ 求 $integral_0^(pi\/2) x cos x dif x$。

+ 设 $f(x) = x^2 ln x$，求 $f'(1)$。

+ 求 $integral_0^1 (dif x)/(1 + x^2)$，并说明其结果 $pi/4$ 的几何意义。

+ 用换元法求 $integral_0^1 sqrt(1 - x^2) dif x$（提示：令 $x = sin t$），并与例 2.1.5.3 比较。

+ 求 $integral_0^1 x^2 e^x dif x$（提示：连续两次分部积分）。

+ 设 $F(x) = integral_0^x e^(-t^2) dif t$，求 $F'(x)$ 与 $F''(x)$。

+ 求 $y = x^x$ 在 $x = 1$ 处的切线方程。

+ 证明：若 $f(x)$ 在 $[a, b]$ 上连续，则 $integral_a^b f(x) dif x = integral_a^b f(a + b - x) dif x$，并用它计算 $integral_0^pi (x sin x)/(1 + cos^2 x) dif x$。

== 随机变量及其分布

=== 随机变量与分布函数的定义及性质

#h(2em)设随机试验的样本空间为 $Omega$，若对每个样本点 $omega in Omega$，都有唯一确定的实数 $X(omega)$ 与之对应，则称 $X = X(omega)$ 为*随机变量*。

#h(2em)设 $X$ 是随机变量，对任意实数 $x$，称函数

$ F(x) = P(X <= x) quad (-oo < x < +oo) $

#h(2em)为 $X$ 的*分布函数*。分布函数具有以下性质：

+ *单调不减*：若 $x_1 < x_2$，则 $F(x_1) <= F(x_2)$；

+ *规范性*：$F(-oo) = lim_(x -> -oo) F(x) = 0$，$F(+oo) = lim_(x -> +oo) F(x) = 1$；

+ *右连续*：$F(x + 0) = F(x)$。

#h(2em)由分布函数可以计算各种事件的概率：

$ P(a < X <= b) = F(b) - F(a), quad P(X > a) = 1 - F(a), $

$ P(X = a) = F(a) - F(a - 0). $

*【例 2.2.1.1】* 设随机变量 $X$ 的分布函数为

$
F(x) = cases(
  0 quad & x < 0,
  x/2 quad & 0 <= x < 1,
  1 quad & x >= 1.
)
$

#h(2em)试求 $P(X = 0)$、$P(0 < X < 1\/2)$、$P(X > 1\/2)$。

*解* 由 $P(X = a) = F(a) - F(a - 0)$，得

$ P(X = 0) = F(0) - F(0 - 0) = 0 - 0 = 0. $

#h(2em)由 $P(a < X <= b) = F(b) - F(a)$，得

$ P(0 < X < 1/2) = P(0 < X <= 1/2) - P(X = 1/2) = F(1/2) - F(0) - 0 = 1/4. $

#h(2em)由 $P(X > a) = 1 - F(a)$，得

$ P(X > 1/2) = 1 - F(1/2) = 1 - 1/4 = 3/4. $

=== 离散型随机变量及其分布列

#h(2em)若随机变量 $X$ 只取有限个或可列个值 $x_1, x_2, dots$，则称 $X$ 为*离散型随机变量*。称

$ P(X = x_k) = p_k quad (k = 1, 2, dots) $

#h(2em)为 $X$ 的*分布列*，它满足 $p_k >= 0$ 且 $sum_k p_k = 1$。

#h(2em)离散型随机变量的分布函数为阶梯函数

$ F(x) = sum_(x_k <= x) p_k, $

#h(2em)它在每个 $x_k$ 处有跳跃，跳跃高度恰为 $p_k$。

*【例 2.2.2.1】* 口袋中有 3 个白球、2 个黑球。从中不放回地逐个取球，以 $X$ 表示取到白球时已取出的球数，求 $X$ 的分布列。

*解* $X$ 的可能取值为 1, 2, 3。按乘法公式

$ P(X = 1) = 3/5, quad P(X = 2) = 2/5 dot 3/4 = 3/10, $

$ P(X = 3) = 2/5 dot 1/4 dot 3/3 = 1/10. $

#h(2em)故 $X$ 的分布列为（表中 $P$ 即 $P(X = k)$）

#datatable(
  ($X$, $1$, $2$, $3$),
  (
    ($P$, $3/5$, $3/10$, $1/10$),
  ),
)

#h(2em)验证 $3\/5 + 3\/10 + 1\/10 = 1$，三个概率之和确实为 1。

=== 连续型随机变量及其密度函数

#h(2em)若存在非负可积函数 $p(x)$，使随机变量 $X$ 的分布函数可表示为

$ F(x) = integral_(-oo)^x p(t) dif t quad (-oo < x < +oo), $

#h(2em)则称 $X$ 为*连续型随机变量*，$p(x)$ 称为 $X$ 的*密度函数*。密度函数满足

$ p(x) >= 0, quad integral_(-oo)^(+oo) p(x) dif x = 1. $

#h(2em)连续型随机变量的概率由密度函数的积分给出：

$ P(a < X <= b) = integral_a^b p(x) dif x, $

#h(2em)且对任意常数 $a$ 有 $P(X = a) = 0$。在 $p(x)$ 的连续点处有 $F'(x) = p(x)$。

*【例 2.2.3.1】* 设随机变量 $X$ 的密度函数为

$
p(x) = cases(
  A x^2 quad & 0 <= x <= 1,
  0 quad & "其他".
)
$

#h(2em)求常数 $A$，并求 $P(X < 1\/2)$ 与分布函数 $F(x)$。

*解* 由规范性 $integral_(-oo)^(+oo) p(x) dif x = 1$，得

$ integral_0^1 A x^2 dif x = A/3 = 1, $

#h(2em)故 $A = 3$，即 $p(x) = 3 x^2$（$0 <= x <= 1$）。于是

$ P(X < 1/2) = integral_0^(1\/2) 3 x^2 dif x = x^3 |_0^(1\/2) = 1/8. $

#h(2em)分布函数分段积分得

$
F(x) = cases(
  0 quad & x < 0,
  x^3 quad & 0 <= x < 1,
  1 quad & x >= 1.
)
$

== 随机变量的数学期望

=== 数学期望的定义与计算

#h(2em)设离散型随机变量 $X$ 的分布列为 $P(X = x_k) = p_k$，若级数 $sum_k x_k p_k$ 绝对收敛，则称其和为 $X$ 的*数学期望*，记作

$ E(X) = sum_k x_k p_k. $

#h(2em)设连续型随机变量 $X$ 的密度函数为 $p(x)$，若积分 $integral_(-oo)^(+oo) x p(x) dif x$ 绝对收敛，则

$ E(X) = integral_(-oo)^(+oo) x p(x) dif x. $

#h(2em)数学期望是随机变量取值的加权平均，反映其取值的集中位置。

*【例 2.3.1.1】* 设随机变量 $X$ 的分布列为 $P(X = k) = 1\/5$（$k = -2, -1, 0, 1, 2$），求 $E(X)$ 与 $E(X^2)$。

*解* 由定义

$ E(X) = sum_k k dot 1/5 = 1/5 (-2 - 1 + 0 + 1 + 2) = 0, $

$ E(X^2) = sum_k k^2 dot 1/5 = 1/5 (4 + 1 + 0 + 1 + 4) = 2. $

#h(2em)可见 $E(X) = 0$ 并不意味着 $X$ 恒为 0，它只说明取值关于 0 对称分布。

=== 数学期望的性质

#h(2em)设 $E(X)$、$E(Y)$ 均存在，则

+ $E(C) = C$，其中 $C$ 为常数；

+ $E(C X) = C E(X)$，$E(X + C) = E(X) + C$；

+ $E(X + Y) = E(X) + E(Y)$，可推广到有限个随机变量之和；

+ 若 $X$ 与 $Y$ 相互独立，则 $E(X Y) = E(X) E(Y)$，可推广到有限个独立随机变量之积。

#h(2em)注意：性质 (3)(4) 对任意随机变量之和成立，不需要独立性；而乘法性质需要独立性。

*【例 2.3.2.1】* 设 $X tilde B(n, p)$，利用期望的性质求 $E(X)$。

*解* 引入指示变量 $X_i$，当第 $i$ 次试验成功时 $X_i = 1$，否则 $X_i = 0$，则 $X_i tilde B(1, p)$，且

$ X = X_1 + X_2 + dots.c + X_n. $

#h(2em)由 $E(X_i) = p$，及期望的可加性（无需独立性），得

$ E(X) = sum_(i=1)^n E(X_i) = n p. $

#h(2em)这种“分解为指示变量之和”的方法在求期望时非常常用。

=== 随机变量函数的数学期望

#h(2em)设 $Y = g(X)$，$g$ 为连续函数，则无需先求 $Y$ 的分布，可直接由 $X$ 的分布计算：

$ E(g(X)) = sum_k g(x_k) p_k quad (X "为离散型"), $

$ E(g(X)) = integral_(-oo)^(+oo) g(x) p(x) dif x quad (X "为连续型"). $

#h(2em)对二维情形，若 $(X, Y)$ 的密度函数为 $p(x, y)$，则

$ E(g(X, Y)) = integral_(-oo)^(+oo) integral_(-oo)^(+oo) g(x, y) p(x, y) dif x dif y. $

*【例 2.3.3.1】* 设 $X tilde N(0, 1)$，求 $E(X^2)$ 与 $E(e^(a X))$。

*解* 由 $p(x) = 1\/sqrt(2 pi) e^(-x^2\/2)$，直接代入公式，并用分部积分（取 $x e^(-x^2\/2) dif x = -dif (e^(-x^2\/2))$）

$ E(X^2) = 1/sqrt(2 pi) integral_(-oo)^(+oo) x^2 e^(-x^2\/2) dif x $

$ = 1/sqrt(2 pi) integral_(-oo)^(+oo) e^(-x^2\/2) dif x = 1. $

#h(2em)再求 $E(e^(a X))$，配方得

$ E(e^(a X)) = 1/sqrt(2 pi) integral_(-oo)^(+oo) e^(a x - x^2\/2) dif x $

$ = e^(a^2\/2) 1/sqrt(2 pi) integral_(-oo)^(+oo) e^(-(x - a)^2\/2) dif x = e^(a^2\/2). $

#h(2em)后一个结果即标准正态分布矩母函数在 $t = a$ 处的值。

== 随机变量的方差与标准差

=== 方差的定义与计算

#h(2em)设 $E(X)$ 存在，若 $E[(X - E(X))^2]$ 存在，则称其为 $X$ 的*方差*，记作

$ D(X) = E[(X - E(X))^2], $

#h(2em)并称 $sqrt(D(X))$ 为 $X$ 的*标准差*。方差刻画随机变量取值相对于期望的分散程度。

#h(2em)计算方差常用简化公式

$ D(X) = E(X^2) - [E(X)]^2. $

#h(2em)由定义可直接写出：离散型情形 $D(X) = sum_k (x_k - E(X))^2 p_k$，连续型情形 $D(X) = integral_(-oo)^(+oo) (x - E(X))^2 p(x) dif x$。

*【例 2.4.1.1】* 设 $X tilde B(1, p)$，求 $D(X)$。

*解* $X$ 的分布列为 $P(X = 1) = p$，$P(X = 0) = 1 - p$，故

$ E(X) = p, quad E(X^2) = 1^2 dot p + 0^2 dot (1 - p) = p. $

#h(2em)于是

$ D(X) = E(X^2) - [E(X)]^2 = p - p^2 = p (1 - p). $

#h(2em)注意：由于 $X$ 只取 0 与 1，$X^2 = X$，故 $E(X^2) = E(X)$。

=== 方差的性质

#h(2em)设 $D(X)$、$D(Y)$ 均存在，则

+ $D(C) = 0$，其中 $C$ 为常数；

+ $D(C X) = C^2 D(X)$，$D(X + C) = D(X)$；

+ 若 $X$ 与 $Y$ 相互独立，则 $D(X +- Y) = D(X) + D(Y)$；

+ $D(X) = 0$ 的充要条件是 $X$ 以概率 1 取常数 $E(X)$。

#h(2em)注意：一般情形下 $D(X + Y) = D(X) + D(Y) + 2 "Cov"(X, Y)$，只有当 $X$ 与 $Y$ 不相关（如相互独立）时才有 $D(X + Y) = D(X) + D(Y)$。

*【例 2.4.2.1】* 设 $X tilde B(n, p)$，利用方差的性质求 $D(X)$。

*解* 仍按【例 2.3.2.1】把 $X$ 分解为 $n$ 个相互独立的指示变量之和 $X = X_1 + dots.c + X_n$。由【例 2.4.1.1】知 $D(X_i) = p(1 - p)$，再由独立情形下的可加性，得

$ D(X) = sum_(i=1)^n D(X_i) = n p (1 - p). $

#h(2em)这里必须用到独立性，否则 $D(X_1 + dots.c + X_n) != sum_i D(X_i)$。

=== 常见分布的方差

#h(2em)常见分布的期望与方差汇总如下：

#datatable(
  ($"分布"$, $"分布列或密度"$, $E(X)$, $D(X)$),
  (
    ($B(1, p)$, $p^k (1 - p)^(1-k)$, $p$, $p (1 - p)$),
    ($B(n, p)$, $binom(n, k) p^k (1 - p)^(n-k)$, $n p$, $n p (1 - p)$),
    ($P(lambda)$, $lambda^k/k! e^(-lambda)$, $lambda$, $lambda$),
    ($G(p)$, $(1 - p)^(k-1) p$, $1/p$, $(1 - p)/p^2$),
    ($U(a, b)$, $1/(b - a)$, $(a + b)/2$, $(b - a)^2/12$),
    ($E(lambda)$, $lambda e^(-lambda x)$, $1/lambda$, $1/lambda^2$),
    ($N(mu, sigma^2)$, $1/(sqrt(2 pi) sigma) e^(-(x - mu)^2\/(2 sigma^2))$, $mu$, $sigma^2$),
  ),
)

*【例 2.4.3.1】* 设 $X tilde B(10, 0.6)$，$Y tilde N(2, 4)$，且 $X$ 与 $Y$ 相互独立，求 $D(2 X - 3 Y + 1)$。

*解* 由 $D(X) = 10 dot 0.6 dot 0.4 = 2.4$，$D(Y) = 4$，结合方差的性质

$ D(2 X - 3 Y + 1) = 2^2 D(X) + (-3)^2 D(Y) = 4 dot 2.4 + 9 dot 4 = 45.6. $

#h(2em)注意常数项 $+1$ 不影响方差，而系数需平方后提出。

== 常用离散分布

=== 两点分布与二项分布

#h(2em)若 $X$ 只取 0 与 1 两个值，且

$ P(X = 1) = p, quad P(X = 0) = 1 - p quad (0 < p < 1), $

#h(2em)则称 $X$ 服从参数为 $p$ 的*两点分布*（0-1 分布），记作 $X tilde B(1, p)$。

#h(2em)在 $n$ 重伯努利试验中，若每次试验成功的概率为 $p$，以 $X$ 表示成功的次数，则

$ P(X = k) = binom(n, k) p^k (1 - p)^(n-k) quad (k = 0, 1, dots, n), $

#h(2em)称 $X$ 服从参数为 $n, p$ 的*二项分布*，记作 $X tilde B(n, p)$。其期望与方差为

$ E(X) = n p, quad D(X) = n p (1 - p). $

*【例 2.5.1.1】* 某人射击的命中率为 0.8，独立射击 5 次。求命中次数 $X$ 的分布列及 $P(X >= 3)$。

*解* $X tilde B(5, 0.8)$，故

$ P(X = k) = binom(5, k) 0.8^k 0.2^(5-k) quad (k = 0, 1, dots, 5). $

#h(2em)逐个计算得 $X$ 的分布列：

#datatable(
  ($X$, $0$, $1$, $2$, $3$, $4$, $5$),
  (
    ($P$, $0.0003$, $0.0064$, $0.0512$, $0.2048$, $0.4096$, $0.3277$),
  ),
)

#h(2em)于是

$ P(X >= 3) = 0.2048 + 0.4096 + 0.3277 = 0.9421. $

=== 泊松分布

#h(2em)若随机变量 $X$ 的分布列为

$ P(X = k) = lambda^k/k! e^(-lambda) quad (k = 0, 1, 2, dots), $

#h(2em)其中 $lambda > 0$ 为常数，则称 $X$ 服从参数为 $lambda$ 的*泊松分布*，记作 $X tilde P(lambda)$。其期望与方差相等：

$ E(X) = lambda, quad D(X) = lambda. $

#h(2em)泊松定理：当 $n$ 很大、$p$ 很小而 $n p -> lambda$ 时，二项分布 $B(n, p)$ 近似于泊松分布 $P(lambda)$，即

$ binom(n, k) p^k (1 - p)^(n-k) approx lambda^k/k! e^(-lambda). $

*【例 2.5.2.1】* 某设备在一天内发生故障的次数 $X tilde P(2)$。

(1) 求一天内无故障的概率；

(2) 若每天是否出故障相互独立，求连续 3 天内至少有一天无故障的概率。

*解* (1) 由 $X tilde P(2)$，先列出 $X$ 的部分分布列（表中 $P$ 即 $P(X = k)$）：

#datatable(
  ($k$, $0$, $1$, $2$, $3$, $4$, $5$),
  (
    ($P$, $0.1353$, $0.2707$, $0.2707$, $0.1804$, $0.0902$, $0.0361$),
  ),
)

#h(2em)故一天内无故障的概率为 $P(X = 0) = e^(-2) approx 0.1353$。

#h(2em)#[(2) 设 $A_i$ 表示第 $i$ 天无故障（$i = 1, 2, 3$），由独立性及 (1)，]

$ P(A_1 union A_2 union A_3) = 1 - P(overline(A_1)) P(overline(A_2)) P(overline(A_3)) $

$ = 1 - (1 - e^(-2))^3 approx 0.3535. $

=== 几何分布与超几何分布

#h(2em)在伯努利试验中，若以 $X$ 表示首次成功所需的试验次数，则

$ P(X = k) = (1 - p)^(k-1) p quad (k = 1, 2, dots), $

#h(2em)称 $X$ 服从参数为 $p$ 的*几何分布*，记作 $X tilde G(p)$。其期望与方差为

$ E(X) = 1/p, quad D(X) = (1 - p)/p^2. $

#h(2em)几何分布具有无记忆性：$P(X > m + n | X > m) = P(X > n)$。

#h(2em)设一批产品共 $N$ 件，其中 $M$ 件不合格。从中不放回地任取 $n$ 件，以 $X$ 表示其中的不合格品数，则

$ P(X = k) = (binom(M, k) binom(N - M, n - k))/(binom(N, n)), $

#h(2em)其中 $k = 0, 1, dots, min(n, M)$。

#h(2em)称 $X$ 服从*超几何分布*。其期望与方差为

$ E(X) = n M/N, quad D(X) = n M/N (1 - M/N) (N - n)/(N - 1). $

*【例 2.5.3.1】* 一批产品共 10 件，其中 3 件次品。不放回地任取 4 件，求取到的次品数 $X$ 的分布列。

*解* $X$ 服从超几何分布，$N = 10$，$M = 3$，$n = 4$，故

$ P(X = k) = (binom(3, k) binom(7, 4 - k))/(binom(10, 4)) quad (k = 0, 1, 2, 3). $

#h(2em)具体计算，并将有放回（$X tilde B(4, 0.3)$）的情形一并列入下表对照：

#datatable(
  ($X$, $0$, $1$, $2$, $3$),
  (
    ($"不放回"$, $35/210$, $105/210$, $63/210$, $7/210$),
    ($"有放回"$, $0.2401$, $0.4116$, $0.2646$, $0.0756$),
  ),
)

#h(2em)可见不放回时取到次品的概率略低于有放回情形，这是由于每取出一个正品后剩余产品中次品比例上升所致。

== 常用连续分布

=== 均匀分布

#h(2em)若随机变量 $X$ 的密度函数为

$
p(x) = cases(
  1/(b - a) quad & a <= x <= b,
  0 quad & "其他",
)
$

#h(2em)则称 $X$ 在区间 $[a, b]$ 上服从*均匀分布*，记作 $X tilde U(a, b)$。其分布函数为

$
F(x) = cases(
  0 quad & x < a,
  (x - a)/(b - a) quad & a <= x < b,
  1 quad & x >= b.
)
$

#h(2em)期望与方差为 $E(X) = (a + b)/2$，$D(X) = (b - a)^2/12$。

*【例 2.6.1.1】* 设 $X tilde U(0, 10)$，求 $P(3 < X < 7)$、$E(X)$ 与 $D(X)$。

*解* 由密度 $p(x) = 1\/10$（$0 <= x <= 10$），得

$ P(3 < X < 7) = integral_3^7 1/10 dif x = 4/10 = 0.4, $

$ E(X) = 5, quad D(X) = 100/12 = 25/3. $

=== 指数分布

#h(2em)若随机变量 $X$ 的密度函数为

$
p(x) = cases(
  lambda e^(-lambda x) quad & x >= 0,
  0 quad & x < 0,
)
$

#h(2em)其中 $lambda > 0$，则称 $X$ 服从参数为 $lambda$ 的*指数分布*，记作 $X tilde E(lambda)$。其分布函数为

$
F(x) = cases(
  1 - e^(-lambda x) quad & x >= 0,
  0 quad & x < 0.
)
$

#h(2em)期望与方差为 $E(X) = 1/lambda$，$D(X) = 1/lambda^2$。指数分布与几何分布一样具有无记忆性：

$ P(X > s + t | X > s) = P(X > t) quad (s, t > 0). $

*【例 2.6.2.1】* 某元件寿命 $X$（单位：小时）服从参数为 $lambda = 1/1000$ 的指数分布。

(1) 求元件寿命超过 1000 小时的概率；

(2) 已知元件已使用 1000 小时，求它还能再使用 1000 小时以上的概率。

*解* (1) 由 $P(X > t) = e^(-lambda t)$，得

$ P(X > 1000) = e^(-1) approx 0.368. $

#h(2em)#[(2) 由无记忆性，]

$ P(X > 2000 | X > 1000) = P(X > 1000) = e^(-1) approx 0.368. $

#h(2em)这说明指数分布的“剩余寿命”与已使用时间无关。

=== 正态分布

#h(2em)若随机变量 $X$ 的密度函数为

$ p(x) = 1/(sqrt(2 pi) sigma) e^(-(x - mu)^2/(2 sigma^2)) quad (-oo < x < +oo), $

#h(2em)其中 $mu$ 与 $sigma > 0$ 为常数，则称 $X$ 服从参数为 $mu, sigma^2$ 的*正态分布*，记作 $X tilde N(mu, sigma^2)$。

#h(2em)特别地，当 $mu = 0$、$sigma = 1$ 时称 $X$ 服从*标准正态分布* $N(0, 1)$，其密度函数与分布函数分别记作

$ phi(x) = 1/sqrt(2 pi) e^(-x^2\/2), quad Phi(x) = integral_(-oo)^x phi(t) dif t. $

#h(2em)标准正态分布函数满足 $Phi(-x) = 1 - Phi(x)$。一般正态分布可通过标准化转化为标准正态分布：若 $X tilde N(mu, sigma^2)$，则

$ (X - mu)/sigma tilde N(0, 1), quad F(x) = Phi((x - mu)/sigma). $

#h(2em)$3 sigma$ 原则：$P(|X - mu| < 3 sigma) approx 0.9973$。正态分布的期望与方差为 $E(X) = mu$，$D(X) = sigma^2$。

*【例 2.6.3.1】* 设 $X tilde N(1, 4)$，求 $P(0 < X < 3)$ 与 $P(X > 2)$。

*解* 标准化，令 $Z = (X - 1)/2$，则 $Z tilde N(0, 1)$，查表得 $Phi(1) approx 0.8413$、$Phi(0.5) approx 0.6915$。于是

$ P(0 < X < 3) = P((0 - 1)/2 < Z < (3 - 1)/2) $

$ = Phi(1) - Phi(-0.5) = Phi(1) + Phi(0.5) - 1 approx 0.5328, $

$ P(X > 2) = 1 - P(Z <= 0.5) = 1 - Phi(0.5) approx 0.3085. $

== 随机变量函数的分布

=== 离散型随机变量函数的分布

#h(2em)设 $X$ 为离散型随机变量，分布列为 $P(X = x_k) = p_k$，$Y = g(X)$。则 $Y$ 的可能取值为 $g(x_1), g(x_2), dots$，且

$ P(Y = y_j) = sum_(g(x_k) = y_j) p_k, $

#h(2em)即把使 $g(x_k)$ 相同的那些项的概率相加。

#h(2em)特别地，若 $g$ 是严格单调函数，则 $Y$ 的分布列可由 $X$ 的分布列直接得到：$Y$ 取各互不相同的值 $g(x_k)$ 的概率仍为相应的 $p_k$。

*【例 2.7.1.1】* 设 $X$ 的分布列为 $P(X = -1) = 1\/4$，$P(X = 0) = 1\/2$，$P(X = 1) = 1\/4$，求 $Y = X^2$ 的分布列。

*解* $Y$ 的可能取值为 0 与 1。由于 $(-1)^2 = 1^2 = 1$，需把 $X = -1$ 与 $X = 1$ 的概率合并：

$ P(Y = 0) = P(X = 0) = 1/2, $

$ P(Y = 1) = P(X = -1) + P(X = 1) = 1/4 + 1/4 = 1/2. $

#h(2em)可见 $g$ 不单调时，不同 $x_k$ 可能对应同一个 $g(x_k)$，概率必须相加。

=== 连续型随机变量函数的分布

#h(2em)设 $X$ 为连续型随机变量，密度函数为 $p_X (x)$，$Y = g(X)$。求 $Y$ 的分布一般采用分布函数法：先求

$ F_Y (y) = P(Y <= y) = P(g(X) <= y) $

$ = integral_(g(x) <= y) p_X (x) dif x, $

#h(2em)再对 $y$ 求导得 $p_Y (y) = F_Y'(y)$。

#h(2em)若 $y = g(x)$ 严格单调且可导，$g'(x) != 0$，记 $x = g^(-1)(y)$ 为其反函数，则 $Y$ 的密度函数为

$ p_Y(y) = p_X(g^(-1)(y)) |(dif x)/(dif y)| = p_X(g^(-1)(y)) 1/(|g'(x)|). $

*【例 2.7.2.1】* 设 $X tilde U(0, 1)$，求 $Y = -2 ln X$ 的密度函数。

*解* $y = -2 ln x$ 在 $(0, 1)$ 上严格单调递减，值域为 $(0, +oo)$，反函数为 $x = e^(-y\/2)$，且

$ |(dif x)/(dif y)| = 1/2 e^(-y\/2). $

#h(2em)由 $p_X (x) = 1$（$0 < x < 1$），得

$ p_Y(y) = 1/2 e^(-y/2) quad (y > 0), $

#h(2em)即 $Y$ 服从参数为 $1\/2$ 的指数分布。

== 分布的其他特征数

=== 矩与变异系数

#h(2em)设 $X$ 为随机变量，$k$ 为正整数，则称 $E(X^k)$ 为 $X$ 的 $k$ 阶*原点矩*，称 $E[(X - E(X))^k]$ 为 $X$ 的 $k$ 阶*中心矩*。一阶原点矩即期望，二阶中心矩即方差。

#h(2em)由于方差带有量纲，不便比较量纲不同的随机变量的分散程度，故引入*变异系数*

$ C_V (X) = sqrt(D(X))/(E(X)) quad (E(X) != 0). $

#h(2em)变异系数是无量纲的量，常用于比较不同量纲或不同水平下随机变量的相对离散程度。

*【例 2.8.1.1】* 甲、乙两台设备生产同类产品，产品长度分别服从 $N(100, 4)$ 与 $N(20, 0.25)$（单位：mm）。试比较两台设备产品的相对离散程度。

*解* 两台的变异系数分别为

$ C_V(X) = sqrt(4)/100 = 0.02, quad C_V(Y) = sqrt(0.25)/20 = 0.025. $

#h(2em)虽然乙的标准差 $0.5$ 远小于甲的 $2$，但乙的变异系数更大，说明乙的相对波动反而更明显。

=== 分位数

#h(2em)设 $X$ 的分布函数为 $F(x)$，$0 < p < 1$。若存在 $x_p$ 使

$ F(x_p) = p, $

#h(2em)则称 $x_p$ 为 $X$ 的 $p$ *分位数*（下侧分位数）。

#h(2em)概率论中最常用的是 $p = 1/2$ 的*中位数*，即满足 $F(x_(0.5)) = 1/2$ 的点。中位数与期望一样反映取值的集中位置，但它不受极端值影响，稳健性更好。

#h(2em)标准正态分布的 $p$ 分位数记作 $z_p$，有 $Phi(z_p) = p$。由对称性得 $z_p = -z_(1-p)$，且当 $p > 0.5$ 时 $z_p > 0$。

*【例 2.8.2.1】* 设 $X tilde N(mu, sigma^2)$，求 $X$ 的中位数。

*解* 设中位数为 $x_(0.5)$，则

$ F(x_(0.5)) = Phi((x_(0.5) - mu)/sigma) = 1/2. $

#h(2em)由 $Phi(0) = 1\/2$ 得 $(x_(0.5) - mu)\/sigma = 0$，故 $x_(0.5) = mu$。即正态分布的中位数等于期望，这正是其对称性的体现。

=== 偏度与峰度

#h(2em)偏度与峰度是由三阶、四阶中心矩构造的无量纲指标，用于描述分布形状与正态分布的偏离程度。$X$ 的*偏度*与*峰度*分别定义为

$ "Skew"(X) = (E[(X - E(X))^3])/([D(X)]^(3\/2)), quad "Kurt"(X) = (E[(X - E(X))^4])/([D(X)]^2). $

#h(2em)偏度刻画分布的对称性：$"Skew"(X) = 0$ 表示分布关于期望对称，$"Skew"(X) > 0$ 表示右偏（长尾在右），$"Skew"(X) < 0$ 表示左偏。正态分布的偏度为 0。

#h(2em)峰度刻画分布尾部的厚重程度与峰顶的尖峭程度，正态分布的峰度为 3。有时使用超额峰度 $"Kurt"(X) - 3$，此时正态分布的值为 0；超额峰度大于 0 表示比正态分布更尖峭（厚尾）。

*【例 2.8.3.1】* 设 $X tilde E(lambda)$，求 $X$ 的偏度与超额峰度。

*解* 由 $E(X) = 1\/lambda$、$D(X) = 1\/lambda^2$，及三阶、四阶中心矩

$ E[(X - E(X))^3] = 2/lambda^3, quad E[(X - E(X))^4] = 9/lambda^4, $

#h(2em)代入定义得

$ "Skew"(X) = (2\/lambda^3)/((1\/lambda^2)^(3\/2)) = 2, $

$ "Kurt"(X) = (9\/lambda^4)/((1\/lambda^2)^2) = 9. $

#h(2em)故超额峰度为 $9 - 3 = 6 > 0$。偏度 $2 > 0$ 表明指数分布右偏，超额峰度为正说明其尾部比正态分布更厚。
