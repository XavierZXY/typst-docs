import numpy as np
from scipy.stats import binom, norm, poisson

# 定义参数
n = 10000
p = 0.001
lambda_ = n * p
mu = n * p
sigma = np.sqrt(n * p * (1 - p))

# 1. 用二项分布计算此概率
binom_prob = binom.cdf(5, n, p)
print(f"二项分布计算的概率: {binom_prob:.6f}")

# 2. 用泊松分布计算此概率
poisson_prob = poisson.cdf(5, lambda_)
print(f"泊松分布计算的概率: {poisson_prob:.6f}")

# 3. 用正态分布计算此概率
# 对于正态分布，需要进行连续性校正
normal_prob = norm.cdf(5 + 0.5, mu, sigma)
print(f"正态分布计算的概率: {normal_prob:.6f}")

# 4. 比较并讨论以上结果
print("\n结果比较与讨论：")
print(
    "二项分布是精确的模型，适用于固定次数的独立试验，这里每天生产n个产品，每个产品是次品的概率为p，符合二项分布的条件。"
)
print(
    "泊松分布是二项分布的近似，当n很大（这里n = 10000），p很小（这里p = 0.001）时，泊松分布可以很好地近似二项分布。从计算结果来看，泊松分布的结果与二项分布非常接近。"
)
print(
    "正态分布也是二项分布的近似，当np和n(1 - p)都大于5时，二项分布可以用正态分布近似。这里np = 10，n(1 - p) = 9990，满足条件。但由于正态分布是连续分布，需要进行连续性校正。从计算结果来看，正态分布的结果也与二项分布较为接近，但与泊松分布和二项分布的差异相对大一些。"
)
