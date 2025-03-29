import statsmodels.stats.proportion as smp

# 已知信息
p0 = 0.25  # 去年吸烟率
n = 200  # 今年抽取人数
x = 40  # 今年吸烟人数

# 计算样本比例
p_hat = x / n

# 问题2：计算 Z 统计量
z_stat, p_value = smp.proportions_ztest(
    count=x, nobs=n, value=p0, alternative="two-sided"
)

print(f"Z 统计量: {z_stat}")
print(f"p 值: {p_value}")

# 问题4：判断是否拒绝原假设
alpha = 0.05
if p_value < alpha:
    print("拒绝原假设，说明今年的吸烟率与去年有显著差异。")
else:
    print("不能拒绝原假设，没有足够证据表明今年的吸烟率与去年有显著差异。")
