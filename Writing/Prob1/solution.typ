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


=== 练习题第一组解答

#h(2em)以下为 2.2 节练习题第一组的解答。

*（1）* (1) 是，样本点（掷出的点数）到实数的对应；(2) 是，等待时间为非负实数；(3) 是，收盘价随行情波动；(4) 不是，常数不是随机变量（可视为退化随机变量，但通常不计入）。

*（2）* 定义：对任意实数 $x$，$F(x) = P(X <= x)$。

#h(2em)性质：单调不减；$F(-oo) = 0$，$F(+oo) = 1$；右连续，即 $F(x + 0) = F(x)$。

*（3）*

$ P(X < 1) = F(1 - 0) = lim_(x -> 1^-) x/3 = 1/3. $

$ P(0 < X <= 2) = F(2) - F(0) = 1 - 0 = 1. $

$ P(X = 1) = F(1) - F(1 - 0) = 2/3 - 1/3 = 1/3. $

*（4）*

$ F(x) = cases(
  0 quad & x < -1,
  0.2 quad & -1 <= x < 0,
  0.5 quad & 0 <= x < 1,
  0.9 quad & 1 <= x < 2,
  1 quad & x >= 2.
) $

#h(2em)在每个取值点处向上跳跃，跳跃高度等于该点的概率。

*（5）* 三者均非负，只需检验积分为 1：

$ integral_0^1 2 x dif x = [x^2]_0^1 = 1, $

$ integral_0^2 x/2 dif x = [x^2/4]_0^2 = 1, $

$ integral_0^1 3 x^2 dif x = [x^3]_0^1 = 1. $

#h(2em)三者在各自区间上均非负，且积分都等于 1，故都能作为某随机变量的密度函数。

*（6）* 由规范性

$ integral_(-1)^1 c (1 - x^2) dif x = c [x - x^3/3]_(-1)^1 = c dot 4/3 = 1, $

#h(2em)故 $c = 3/4$。

*（7）*

$ F(x) = cases(
  0 quad & x <= 0,
  x^2 quad & 0 < x < 1,
  1 quad & x >= 1.
) $

$ P(0.2 < X < 0.6) = F(0.6) - F(0.2) = 0.36 - 0.04 = 0.32. $

*（8）* 离散型把概率集中分配在可列个点上，$p_k$ 直接等于该点概率；连续型在单点处概率为零，概率由密度在区间上的积分给出。因 $P(X = a) = lim_(Delta x -> 0) integral_a^(a + Delta x) p(x) dif x = 0$，故连续型随机变量取任一指定值的概率为零。

*（9）*

$ R = (S_(t + Delta t) - S_t)/S_t, quad r = ln(S_(t + Delta t)/S_t) = ln(1 + R). $

#h(2em)二者由 $r = ln(1 + R)$ 与 $R = e^r - 1$ 一一对应且均单调递增。$R > -1$，$r$ 可取任意实数。

*（10）*

$ R = (22 - 20)/20 = 10%, quad r = ln(22/20) = ln 1.1 approx 0.0953. $

*（11）* 累计对数收益率

$ r = 0.02 - 0.01 + 0.03 = 0.04. $

#h(2em)累计简单收益率

$ R = e^0.04 - 1 approx 0.0408 = 4.08%. $

*（12）* 价格恒为正，若假设正态分布则 $P(S_t < 0) > 0$，与事实矛盾；且价格带趋势、不平稳。对数收益率可取负值，支撑集与正态分布相容，且实证上近似正态、近似平稳，更便于统计建模。

*（13）* (1) 错，简单收益率满足 $(1 + R) = product (1 + R_k)$，为乘积形式；(2) 对，对数收益率满足 $r = sum r_k$；(3) 对，$R_P = sum w_i R_i$。

*（14）*

$ R_P = 0.6 dot 8% + 0.4 dot (-3%) = 4.8% - 1.2% = 3.6%. $

=== 练习题第二组解答

#h(2em)以下为 2.2 节练习题第二组的解答。

*（1）*

$ P(R = 3%) = 0.55, quad P(R = -2%) = 0.45, quad P(R > 0) = 0.55. $

*（2）* 由规范性

$ integral_(-oo)^0 c e^(2 r) dif r + integral_0^(+oo) c e^(-r) dif r = c/2 + c = 1, $

#h(2em)故 $c = 2/3$。收益率为负的概率

$ P(r < 0) = integral_(-oo)^0 2/3 e^(2 r) dif r = 1/3. $

*（3）* 一年后净值 $S_1 = e^r$，故

$ P(S_1 > 1.1) = P(r > ln 1.1) = P((r - 0.07)/0.15 > (ln 1.1 - 0.07)/0.15). $

#h(2em)因 $ln 1.1 approx 0.0953$，$(0.0953 - 0.07)\/0.15 approx 0.1687$，故

$ P(S_1 > 1.1) = 1 - Phi(0.1687) approx 0.433. $

*（4）* $X$ 的分布列为 $P(X = 10) = 0.45$，$P(X = -10) = 0.55$。于是

$ E(X) = 10 dot 0.45 - 10 dot 0.55 = -1, quad E(X^2) = 100, $

$ D(X) = 100 - 1 = 99. $

#h(2em)$E(X) = -1 < 0$，长期平均每局亏损 1 元，对赌徒不利。

*（5）* 连续输 5 局的累计投入为

$ 10 + 20 + 40 + 80 + 160 = 310 "（元）". $

#h(2em)该策略并不改变单局的负期望：每次赢只赚回起始注额 10 元，而一次连输就要承担 $2^n - 1$ 倍的损失，且资金有限、赌桌上限也会限制下注，长期必亏。

*（6）* 净收益 $X$ 为奖金减票价，故

$ E(X) = 10^6 dot 10^(-7) + 10^4 dot 10^(-5) + 10 dot 10^(-2) - 2 $

$ = 0.1 + 0.1 + 0.1 - 2 = -1.7. $

#h(2em)即每买一张平均亏 1.7 元。

*（7）* 组合收益率 $R_P = 0.5 R_1 + 0.5 R_2$，则

$ E(R_P) = 0.5 dot 8% + 0.5 dot 4% = 6%, $

$ D(R_P) = 0.5^2 dot 0.04 + 0.5^2 dot 0.01 = 0.0125. $

#h(2em)全部投第一只时 $E = 8%$、$D = 0.04$。分散后期望从 8% 降到 6%，但方差从 0.04 降到 0.0125，风险显著降低。

*（8）* $R tilde U(-0.1, 0.1)$，故密度为 $p(r) = 1\/0.2 = 5$。触发止损即 $R <= -0.05$，

$ P(R <= -0.05) = integral_(-0.1)^(-0.05) 5 dif r = 0.25. $

#h(2em)未触发条件下 $R$ 在 $[-0.05, 0.1]$ 上均匀分布，条件期望为

$ E(R | R > -0.05) = (-0.05 + 0.1)/2 = 0.025 = 2.5%. $

*（9）* 标准化得 $Z = (R - 0.10)\/0.2 tilde N(0, 1)$，于是

$ P(R > 0) = P(Z > -0.5) = Phi(0.5) approx 0.6915, $

$ P(-0.1 < R < 0.3) = P(-1 < Z < 1) = 2 Phi(1) - 1 approx 0.6826. $

#h(2em)即该股票约 69% 的年份不亏钱，约 68% 的年份收益率落在 $-10%$ 到 $30%$ 之间。

*（10）* 累计净值倍数

$ product (1 + R_k) = 1.5 dot 0.5 dot 1.2 = 0.9. $

#h(2em)三年后反而亏损 10%。年均几何收益率为

$ (0.9)^(1\/3) - 1 approx -0.0345 = -3.45%. $

#h(2em)而算术平均为 $(50% - 50% + 20%)\/3 = 6.67%$，明显高估，因算术平均未考虑波动带来的复利损失（波动拖累）。

*（11）* 公平条件为 $E = p a - (1 - p) b = 0$，即

$ p = b/(a + b). $

#h(2em)若记赔率为 $a : b$（赢时得 $a$、输时失 $b$），则公平胜率恰为 $b\/(a + b)$，赔率越高要求的胜率越低。

*（12）* 分布函数

$ F(r) = integral_0^r 3 e^(-3 t) dif t = 1 - e^(-3 r) quad (r > 0). $

#h(2em)于是

$ P(r > 1) = 1 - F(1) = e^(-3) approx 0.0498. $

#h(2em)中位数满足 $F(m) = 1\/2$，即 $1 - e^(-3 m) = 1\/2$，得 $m = (ln 2)\/3 approx 0.231$。