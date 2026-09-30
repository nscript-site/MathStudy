= 0.1 逻辑与集合

练习 0.1.1 画出下面所有集合运算律的 Venn 图.

给定命题 $A, B$ 和集合 $S$，令

$
X = {s in S | s "满足条件" A}, quad Y = {s in S | s "满足条件" B}.
$

1. $X inter Y = {s in S | s "满足条件" A and B}$.
2. $X union Y = {s in S | s "满足条件" A or B}$.
3. $S \\ X = {s in S | s "满足条件" not A}$.
4. $X subset.eq Y$ 和 $A arrow.r B$ 等价.
设 $X, Y, Z$ 是集合 $S$ 的子集，容易验证以下运算律：
1. 交满足交换律和结合律，即 $X inter Y = Y inter X, (X inter Y) inter Z = X inter (Y inter Z)$；
2. 并满足交换律和结合律，即 $X union Y = Y union X, (X union Y) union Z = X union (Y union Z)$；
3. 交对并满足分配律，即 $(X union Y) inter Z = (X inter Z) union (Y inter Z)$；
4. 并对交满足分配律，即 $(X inter Y) union Z = (X union Z) inter (Y union Z)$；
5. De Morgan 定律，即 $S \\ (X inter Y) = (S \\ X) union (S \\ Y), S \\ (X union Y) = (S \\ X) inter (S \\ Y)$；
6. 包含关系具有传递性，即如果 $X subset.eq Y, Y subset.eq Z$，那么 $X subset.eq Z$.

类似地，对命题 $A, B, C$，有以下运算律：
1. 且满足交换律和结合律，即 $A and B <=> B and A, (A and B) and C <=> A and (B and C)$；
2. 或满足交换律和结合律，即 $A or B <=> B or A, (A or B) or C <=> A or (B or C)$；
3. 且对或满足分配律，即 $(A or B) and C <=> (A and C) or (B and C)$；
4. 或对且满足分配律，即 $(A and B) or C <=> (A or C) and (B or C)$；
5. De Morgan 定律，即 $not (A and B) <=> (not A) or (not B), not (A or B) <=> (not A) and (not B)$.
6. 蕴涵关系具有传递性，即如果 $A arrow.r B, B arrow.r C$，那么 $A arrow.r C$.
练习 0.1.2 对任意两个命题 $A, B$，$A arrow.r B$ 可以定义为 $B or (not A)$. 直观上可以如此理解：$B or (not A)$ 成立等价于 $A$ 不成立或 $B$ 成立，于是当 $A$ 成立时必有 $B$ 成立. 运用例 0.1.1 中的逻辑运算律，证明 $(A arrow.r B) <=> ((not B) arrow.r (not A))$.

练习 0.1.3 对任意三个命题 $A, B, C$，运用例 0.1.1 中的逻辑运算律，证明逻辑运算符合模律，即当 $A$ 是 $C$ 的必要条件时，$(A and B) or C <=> A and (B or C)$.

练习 0.1.4 对任意两个命题 $A, B$，我们定义运算异或 $A xor B$ 为 $(A and (not B)) or (B and (not A))$.
1. 画出 $A xor B$ 对应的 Venn 图.
2. 证明异或满足交换律和结合律.

= 0.2 间接证明法

练习 0.2.1 请用反证法证明以下命题.
1. 若 $p > 2$ 是素数，则 $p$ 是奇数.
2. 对正整数 $n$，若 $n^2$ 是奇数，则 $n$ 是奇数.
3. 不存在最小的正有理数.

练习 0.2.2 经典逻辑的基本公理之一是排中律，即对任意命题 $A$，$A$ 不能既不真又不假. 反证法可以看作排中律的推论，即如果我们发现 $A$ 不能是错的，那么 $A$ 就只能是对的. 因此，想要证明命题 $A$ 真，不妨挑一个命题 $B$，先证明 $B arrow.r A$，再证明 $(not B) arrow.r A$. 那么 $A$ 就必须是真的了. 给定命题：存在两个无理数 $a, b$，满足 $a^b$ 是一个有理数. 请先假设 $sqrt(2)^sqrt(2)$ 是有理数，再假设 $sqrt(2)^sqrt(2)$ 是无理数，针对两种情形讨论来证明这个命题.

练习 0.2.3 证明 $2^(2^n - 1) - 1$ 必然至少有互异的 $n - 1$ 个奇素因数.（因此第 $n$ 个素数 $p_n$ 一定小于等于 $2^(2^n - 1)$ .）

提示：运用因式分解 $x^2 - 1 = (x + 1)(x - 1)$；并注意对任意 $m != n, 2^(2^m) + 1$ 与 $2^(2^n) + 1$ 互素.

练习 0.2.4 假设有一个 $a times b$ 的巧克力排块，我们需要将它掰成 $1 times 1$ 的小块，在掰的同时会被打分. 假设掰一次将 $x + y$ 块掰成了 $x$ 块和 $y$ 块，则得分 $x y$. 证明：当巧克力被完全掰成 $1 times 1$ 的小块时，总得分永远为 $1\/2 a b (a b - 1)$.

= 0.3 映射

练习 0.3.1 判断下列映射是否为单射、满射、双射，并写出双射的逆映射：

1. $f: bb(R) arrow.r bb(R), quad x |-> x + 1$.
2. $f: bb(R) arrow.r bb(R), quad x |-> 2x$.
3. $f: bb(R) arrow.r bb(R), quad x |-> 3$.
4. $f: bb(R) arrow.r bb(R), quad x |-> x^2$.
5. $f: (-oo, 0] arrow.r bb(R), quad x |-> x^2$.
6. $f: bb(R) arrow.r (0, oo), quad x |-> e^x$.
7. $f: [-3pi\/2, -pi\/2] arrow.r [-1, 1], quad x |-> sin x$.

练习 0.3.2 对复合映射 $f = g compose h$，证明或举出反例.

1. $g, h$ 都是满射，则 $f$ 是满射.
2. $g, h$ 都是单射，则 $f$ 是单射.
3. $h$ 不是满射，则 $f$ 不是满射.
4. $g$ 不是满射，则 $f$ 不是满射.
5. $g$ 不是单射，则 $f$ 不是单射.
6. $h$ 不是单射，则 $f$ 不是单射.
7. $g, h$ 都不是双射，则 $f$ 不是双射.

练习 0.3.3

1. 在不改变对应法则和定义域的前提下，$bb(R)$ 上的变换 $f(x) = x^2 + 2x + 3$，把陪域换成哪个集合，得到的映射是满射？
2. 证明映射 $f: [0, 1] arrow.r bb(R), f(x) = x$ 是单射.

练习 0.3.4 下列 $bb(R)$ 上的变换，哪些满足交换律 $f compose g = g compose f$？

1. $f(x) = x + 1, g(x) = 2x$.
2. $f(x) = x^2, g(x) = x^3$.
3. $f(x) = 2^x, g(x) = 3^x$.
4. $f(x) = 2x + 1, g(x) = 3x + 2$.
5. $f(x) = 2x + 1, g(x) = 3x + 1$.
6. $f(x) = sin x, g(x) = cos x$.

练习 0.3.5 对 $bb(R)$ 上的变换 $f(x) = 2x + 1$ 和 $g(x) = op("ax") + b$，求实数 $a, b$，使得 $f compose g = g compose f$.

练习 0.3.6 在化简函数 $arccos compose sin: [-pi\/2, pi\/2] arrow.r [0, pi]$ 的下列步骤中，分别利用了映射的哪些性质？

1. 如果 $y = (arccos compose sin)(x)$，则 $cos y = (cos compose (arccos compose sin))(x)$.
2. $cos compose (arccos compose sin) = (cos compose arccos) compose sin$.
3. $(cos compose arccos) compose sin = op("id")_[0, 1] compose sin$.
4. $op("id")_[0, 1] compose sin = sin$.

综上得 $sin x = cos y$，由此推断化简结果.

练习 0.3.7 用数学归纳法证明，任取有限个映射 $f_1, f_2, dots.h, f_n$，如果对 $1 <= i <= n-1$，$f_(i+1)$ 的定义域都等于 $f_i$ 的陪域，则复合映射 $f_n compose dots.h compose f_2 compose f_1$ 不因映射复合的计算次序而改变.

练习 0.3.8 证明，任意映射 $f$ 都存在分解 $f = g compose h$，其中 $h$ 是满射，$g$ 是单射.

练习 0.3.9 给定映射 $h, g$ 和 $f = g compose h$，证明，若 $f$ 是双射，则 $h$ 是单射，$g$ 是满射.

练习 0.3.10 证明命题: 对映射 $f: X arrow.r Y$，若 $X != emptyset$，则有

1. $f$ 是单射当且仅当存在另一个映射 $g: Y arrow.r X$，使得 $g compose f = op("id")_X$；
2. $f$ 是满射当且仅当存在另一个映射 $g: Y arrow.r X$，使得 $f compose g = op("id")_Y$；
3. $f$ 是双射当且仅当 $f$ 可逆，即存在另一个映射 $g: Y arrow.r X$，使得 $f compose g = op("id")_Y$, $g compose f = op("id")_X$.