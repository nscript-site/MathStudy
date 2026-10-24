// ===== 页面与基础设置（与 chapter2.typ 保持一致）=====
#set document(title: "习题解答")

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

#set par(first-line-indent: 0em, leading: 0.75em)

#set math.equation(numbering: none)

// ===== 标题编号：二级 2.1、三级 2.1.1 =====
#set heading(numbering: "2.1.1")

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 2.6em,
  below: 2.2em,
  align(center, text(size: 15pt, weight: "bold", it.body)),
)

#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.9em,
  below: 1.1em,
  text(size: 11.5pt, weight: "bold", [#numbering("2.1", ..counter(heading).get().slice(1))#h(0.55em)#it.body]),
)

#show heading.where(level: 3): it => block(
  width: 100%,
  above: 1.7em,
  below: 1.05em,
  text(size: 10pt, weight: "bold", [#numbering("2.1.1", ..counter(heading).get().slice(1))#h(0.55em)#it.body]),
)

// 列表与枚举：不缩进
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

= 第二章 随机变量及其分布
== 导数与积分的计算

=== 练习题解答

#h(2em)以下为 2.1 节练习题的解答，题号与正文一致。

*（1）*

$ y = x^5 quad ==> quad y' = 5 x^4. $

$ y = 3 x^2 - 2 x + 1 quad ==> quad y' = 6 x - 2. $

$ y = 1/x + sqrt(x) = x^(-1) + x^(1\/2) quad ==> quad y' = -1/x^2 + 1/(2 sqrt(x)). $

*（2）*

$ y' = 2^x ln 2 + 1/(x ln 3). $

*（3）* 由乘积法则，

$ y' = cos x dot cos x + sin x dot (-sin x) = cos^2 x - sin^2 x = cos 2 x. $

*（4）* 写成商的形式 $tan x = (sin x)/(cos x)$，由商的法则

$ (tan x)' = (cos x dot cos x - sin x dot (-sin x))/(cos^2 x) = (cos^2 x + sin^2 x)/(cos^2 x) = 1/(cos^2 x). $

#h(2em)分子恰为 $cos^2 x + sin^2 x = 1$，故结果即 $sec^2 x$。

*（5）* 乘积法则：

$ y' = 2 x (x - 2) + (x^2 + 1) dot 1 = 2 x^2 - 4 x + x^2 + 1 = 3 x^2 - 4 x + 1. $

#h(2em)先展开：$y = x^3 - 2 x^2 + x - 2$，逐项求导同样得 $y' = 3 x^2 - 4 x + 1$，两法结果一致。

*（6）* 由商的法则

$ y' = (3 (x^2 + 1) - (3 x + 1) dot 2 x)/((x^2 + 1)^2) = (-3 x^2 - 2 x + 3)/((x^2 + 1)^2). $

*（7）*

$ y' = 1/(1 + x^2) + 1/sqrt(1 - x^2). $

*（8）* 由乘积法则

$ y' = e^x sin x + e^x cos x = e^x (sin x + cos x), $

#h(2em)故 $y'(0) = e^0 (0 + 1) = 1$。

*（9）* 由链式法则

$ y' = 1/(x^2 + 1) dot 2 x = (2 x)/(x^2 + 1). $

*（10）*

$ (e^(3 x))' = 3 e^(3 x), quad (sin 2 x)' = 2 cos 2 x. $

*（11）*

$ y' = 1/(2 sqrt(x^2 + 1)) dot 2 x = x/sqrt(x^2 + 1). $

*（12）* 三层复合，由外及里

$ y' = 3 cos^2 x dot (-sin x) = -3 sin x cos^2 x. $

*（13）*

$ y' = 1/(sin x) dot cos x = cot x. $

#h(2em)定义域要求 $sin x > 0$，即

$ x in (2 k pi, 2 k pi + pi), quad k in ZZ. $

*（14）*

$ y' = e^(-x^2\/2) dot (-x) = -x e^(-x^2\/2). $

#h(2em)因 $e^(-x^2\/2) > 0$ 恒成立，故 $y' = 0$ 当且仅当 $x = 0$。

*（15）*

$ y' = 10 (1 + x^2)^9 dot 2 x = 20 x (1 + x^2)^9. $

*（16）*

$ y' = 2 x e^(-x) - x^2 e^(-x) = x (2 - x) e^(-x). $

#h(2em)令 $y' = 0$ 得 $x = 0$ 或 $x = 2$。当 $x < 0$ 时 $y' < 0$，当 $0 < x < 2$ 时 $y' > 0$，当 $x > 2$ 时 $y' < 0$，故 $x = 0$ 为极小值点，$x = 2$ 为极大值点。

*（17）* 两边取对数得 $ln y = sin x ln x$，对 $x$ 求导

$ y'/y = cos x ln x + (sin x)/x, $

#h(2em)故

$ y' = x^(sin x) (cos x ln x + (sin x)/x). $

*（18）* 两边取对数得

$ ln y = 2 ln(x + 1) + 1/2 ln(x - 1), $

#h(2em)求导得

$ y'/y = 2/(x + 1) + 1/(2 (x - 1)), $

#h(2em)于是

$ y' = (x + 1)^2 sqrt(x - 1) [2/(x + 1) + 1/(2 (x - 1))]. $

*（19）*

$ integral_1^2 (x^2 + 1/x) dif x = [x^3/3 + ln x]_1^2 = 8/3 + ln 2 - 1/3 = 7/3 + ln 2. $

$ integral_0^(pi\/2) sin x dif x = [-cos x]_0^(pi\/2) = 0 - (-1) = 1. $

*（20）*

$ integral_0^1 (e^x + 2^x) dif x = [e^x + 2^x/(ln 2)]_0^1 = e - 1 + 1/(ln 2). $

*（21）*

$ integral_1^4 (1 + sqrt(x)) dif x = [x + 2/3 x^(3\/2)]_1^4 = (4 + 16/3) - (1 + 2/3) = 17/3. $

*（22）* 令 $u = 2 x + 1$，则 $dif u = 2 dif x$；$x: 0 -> 1$ 时 $u: 1 -> 3$，故

$ integral_0^1 (2 x + 1)^5 dif x = 1/2 integral_1^3 u^5 dif u = 1/12 [u^6]_1^3 = (729 - 1)/12 = 182/3. $

*（23）* 令 $u = sin x$，则 $dif u = cos x dif x$；$x: 0 -> pi\/2$ 时 $u: 0 -> 1$，故

$ integral_0^(pi\/2) sin^3 x cos x dif x = integral_0^1 u^3 dif u = 1/4. $

*（24）* 令 $u = ln x$，则 $dif u = dif x \/ x$；$x: 1 -> e$ 时 $u: 0 -> 1$，故

$ integral_1^e (ln x)/x dif x = integral_0^1 u dif u = 1/2. $

*（25）* 取 $u = x$，$dif v = e^(2 x) dif x$，即 $v = e^(2 x)\/2$，得

$ integral_0^1 x e^(2 x) dif x = [x e^(2 x)/2]_0^1 - 1/2 integral_0^1 e^(2 x) dif x $

$ = e^2/2 - 1/4 [e^(2 x)]_0^1 = e^2/2 - (e^2 - 1)/4 = (e^2 + 1)/4. $

*（26）* 取 $u = x$，$dif v = cos x dif x$，即 $v = sin x$，得

$ integral_0^(pi\/2) x cos x dif x = [x sin x]_0^(pi\/2) - integral_0^(pi\/2) sin x dif x $

$ = pi/2 + [cos x]_0^(pi\/2) = pi/2 - 1. $

*（27）*

$ f'(x) = 2 x ln x + x^2 dot 1/x = 2 x ln x + x, $

#h(2em)故 $f'(1) = 0 + 1 = 1$。

*（28）*

$ integral_0^1 (dif x)/(1 + x^2) = [arctan x]_0^1 = arctan 1 - arctan 0 = pi/4. $

#h(2em)几何意义：曲线 $y = 1\/(1 + x^2)$ 在 $[0, 1]$ 上与 $x$ 轴所围区域的面积为 $pi\/4$。

*（29）* 令 $x = sin t$（$0 <= t <= pi\/2$），$dif x = cos t dif t$，$sqrt(1 - x^2) = cos t$；$x: 0 -> 1$ 时 $t: 0 -> pi\/2$，故

$ integral_0^1 sqrt(1 - x^2) dif x = integral_0^(pi\/2) cos^2 t dif t = 1/2 integral_0^(pi\/2) (1 + cos 2 t) dif t = pi/4. $

#h(2em)结论与例 2.1.5.3 完全一致，说明换元路径不同但结果唯一。

*（30）* 连续两次分部积分。第一次取 $u = x^2$，$dif v = e^x dif x$：

$ integral_0^1 x^2 e^x dif x = [x^2 e^x]_0^1 - 2 integral_0^1 x e^x dif x = e - 2 integral_0^1 x e^x dif x. $

#h(2em)第二次取 $u = x$，$dif v = e^x dif x$：

$ integral_0^1 x e^x dif x = [x e^x]_0^1 - integral_0^1 e^x dif x = e - (e - 1) = 1. $

#h(2em)代回得 $integral_0^1 x^2 e^x dif x = e - 2$。

*（31）* 由变上限积分求导公式

$ F'(x) = e^(-x^2). $

#h(2em)再求导得

$ F''(x) = e^(-x^2) dot (-2 x) = -2 x e^(-x^2). $

*（32）* 先求 $y = x^x$ 的导数。由对数求导法（见例 2.1.3.2）

$ y' = x^x (ln x + 1). $

#h(2em)在 $x = 1$ 处，$y = 1^1 = 1$，$y'(1) = 1 dot (0 + 1) = 1$，故切线方程为

$ y - 1 = 1 dot (x - 1), quad "即" quad y = x. $

*（33）* 证明：令 $u = a + b - x$，则 $dif u = -dif x$；当 $x = a$ 时 $u = b$，当 $x = b$ 时 $u = a$。于是

$ integral_a^b f(a + b - x) dif x = integral_b^a f(u) dot (-dif u) = integral_a^b f(u) dif u, $

#h(2em)即得所证等式。

#h(2em)应用：取 $a = 0$，$b = pi$，$f(x) = (x sin x)/(1 + cos^2 x)$。记原积分为 $I$，由上述等式

$ I = integral_0^pi (x sin x)/(1 + cos^2 x) dif x = integral_0^pi ((pi - x) sin x)/(1 + cos^2 x) dif x. $

#h(2em)两式相加得

$ 2 I = pi integral_0^pi (sin x)/(1 + cos^2 x) dif x. $

#h(2em)令 $u = cos x$，则 $dif u = -sin x dif x$；$x: 0 -> pi$ 时 $u: 1 -> -1$，故

$ integral_0^pi (sin x)/(1 + cos^2 x) dif x = integral_(-1)^1 (dif u)/(1 + u^2) = [arctan u]_(-1)^1 = pi/2. $

#h(2em)于是 $2 I = pi^2/2$，即 $I = pi^2/4$。
