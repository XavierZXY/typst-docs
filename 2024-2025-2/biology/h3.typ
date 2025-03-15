#set text(font: "Noto Serif CJK SC", size: 10pt)
// #set text(font: "Source Sans Pro", size: 12pt)

// #show heading: set text(font: "Noto Serif CJK SC", size: 12pt)

#show link: underline


// Feel free to change the margin below to best fit your own CV
#set page(margin: (x: 1.4cm, y: 1.5cm))

// For more customizable options, please refer to official reference: https://typst.app/docs/reference/

#set par(justify: true)

#let chiline() = {
  v(-3pt)
  line(length: 100%)
  v(-3pt)
}

// For code
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 20pt,
  radius: 4pt,
)

#align(center, text(font: "Noto Serif CJK SC", size: 14pt)[= HomeWork ])
#align(
  center,
  [
    #set text(font: "Noto Serif CJK SC", size: 12pt)
    邹翔宇 | 2410833001
  ],
)
#chiline()

== 第一题

=== 1. 骰子点数
离散型
{1, 2, 3, 4, 5, 6}
均匀分布

=== 2. 男性身高
连续型
(0, +∞)
正态分布

=== 3. 交通事故次数
离散型
{0, 1, 2, ...}
泊松分布

=== 4. 降雨量
连续型
[0, +∞)
伽马分布 / 指数分布

== 第二题

=== 1. 随机变量X的分布

$X ~ "Binomial"(10, 0.9)$

=== 2. 数学期望和方差
$E[X] = n*p = 9 \\ V[X] = n*p*(1-p) = 10*0.9*0.1 = 0.9$

=== 3. 恰好8件合格的概率
$ P(X = 8) = C_{10}^8 * (0.9)^8*(0.1)^2 = 0.1937 $

=== 4. 至少7件合格的概率
$ P(X >= 7) = P(X = 7) + P(X = 8) + P(X =9) + P(X = 10) = 0.9872 $

== 第三题
=== 1. 恰好出生5个婴儿的概率
$ P(X=k)= frac(lambda^k * e^(- lambda), k) $
$ P(X=5)=frac((3^5 * e^{-3}),5!) = 0.1008 $

=== 2. 出生数不超过2个的概率
$ P(X <= 2) = P(X=0)+P(X=1)+P(X=2) = 0.4232 $

=== 3. 出生数至少为4个的概率
$ P(X >= 4) = 1- P(X <= 3) = 0.3528 $

=== 4. 两小时内出生总数为8个的概率
两小时内的出生数符合泊松分布
$ P(Y = 8) = 0.1033 $

== 第四题

=== 1. 正态分布参数解释
$mu$（均值）：表示正态分布的中心位置，即数据集中趋势的平均值。
$sigma^2$（方差）：表示数据分布的离散程度，$sigma^2$ 越大，数据越分散；$sigma^2$ 越小，数据越集中。
对曲线的影响：
位置：$mu$ 决定曲线的对称轴位置，$mu$ 增大时曲线右移，$mu$ 减小时左移。
形状：$sigma^2$ 决定曲线的 “胖瘦”，$sigma^2$ 越大，曲线越扁平；$sigma^2$ 越小，曲线越陡峭。

$ Z = frac(X-mu, sigma) = frac(82-70, 4) = 3 $

=== 2. 估计此学生的排名

$ P(Z <= 3) approx 0.9987 $
$ 100 * (1 - 0.9987) approx 0.13 $
该学生的成绩在班级大约排第1名

== 第五题

=== 1. 二项分布
$ P(X = k) = C_n^k * p^k * (1-p)^(n-k) $
$ P(X <= 5) = sum_(k=0)^5(C_10000^k) *(0.0001)^k * (0.999)^(10000-k) = 0.067 $

=== 2. 泊松分布

$ P(X <= 5) = sum_(k=0)^5(frac(10^k e^(-19), k!)) = 0.067 $

=== 3. 正态分布

$ mu = "np" = 10, sigma = sqrt("np"(1-p) = 3.162) $
$ Z = frac(5.5-10, 3.162) approx -1.423 $
$ P(Z <= -1.423) approx 0.077 $

=== 4. 比较与讨论

​二项分布与泊松分布：两者结果几乎一致（约 6.71%），说明当 n 大且 p 小时，泊松近似非常精确。
​正态分布：结果为 7.7%，略高于前两者。这是因为正态分布是对称的，而实际分布（二项/泊松）在左尾略轻，导致正态近似在尾部区域存在误差。
