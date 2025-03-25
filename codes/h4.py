import math

import numpy as np
import scipy.stats as stats


def point_estimate_mean_diff(mean_A, mean_B):
    """
    1. 对甲乙两个总体的均数之差进行点估计
    """
    return mean_A - mean_B


def confidence_interval_equal_std(
    mean_A, n_A, mean_B, n_B, std=15, confidence=0.95
):
    """
    2. 若两组样本的样本标准差均为15，计算两总体均数之差的95%置信区间
    """
    # 计算标准误
    std_error = std * math.sqrt(1 / n_A + 1 / n_B)

    # 获取对应的t分位数
    alpha = 1 - confidence
    t_value = stats.t.ppf(1 - alpha / 2, n_A + n_B - 2)

    # 计算置信区间
    diff = mean_A - mean_B
    margin_error = t_value * std_error

    return (diff - margin_error, diff + margin_error)


def confidence_interval_sample_var(
    mean_A, n_A, var_A, mean_B, n_B, var_B, confidence=0.95
):
    """
    3. 已知甲组样本方差和乙组样本方差，计算两总体均数之差的95%置信区间
    """
    # 计算标准误
    std_error = math.sqrt(var_A / n_A + var_B / n_B)

    # 计算自由度（Welch-Satterthwaite方程）
    numerator = (var_A / n_A + var_B / n_B) ** 2
    denominator = (var_A / n_A) ** 2 / (n_A - 1) + (var_B / n_B) ** 2 / (
        n_B - 1
    )
    df = numerator / denominator
    print(f"自由度: {df:.4f}")
    # 获取对应的t分位数
    alpha = 1 - confidence
    t_value = stats.t.ppf(1 - alpha / 2, df)

    # 计算置信区间
    diff = mean_A - mean_B
    margin_error = t_value * std_error

    return (diff - margin_error, diff + margin_error)


def confidence_interval_pop_var(
    mean_A, n_A, pop_var_A, mean_B, n_B, pop_var_B, confidence=0.95
):
    """
    4. 已知甲组总体方差和乙组总体方差，计算两总体均数之差的95%置信区间
    """
    # 计算标准误
    std_error = math.sqrt(pop_var_A / n_A + pop_var_B / n_B)

    # 获取对应的z分位数
    alpha = 1 - confidence
    z_value = stats.norm.ppf(1 - alpha / 2)

    # 计算置信区间
    diff = mean_A - mean_B
    margin_error = z_value * std_error

    return (diff - margin_error, diff + margin_error)


def main():
    # 题目给定数据
    mean_A = 120  # 甲组样本均值
    n_A = 15  # 甲组样本量
    mean_B = 115  # 乙组样本均值
    n_B = 10  # 乙组样本量

    var_A = 15**2  # 甲组样本方差 (可根据题目替换)
    var_B = 12**2  # 乙组样本方差 (可根据题目替换)

    pop_var_A = 15**2  # 甲组总体方差 (可根据题目替换)
    pop_var_B = 12**2  # 乙组总体方差 (可根据题目替换)

    print("对甲乙两个独立总体进行抽样:")
    print(f"甲组: 样本均值={mean_A}, 样本量={n_A}")
    print(f"乙组: 样本均值={mean_B}, 样本量={n_B}")
    print()

    # 1. 点估计
    diff_estimate = point_estimate_mean_diff(mean_A, mean_B)
    print(f"1. 甲乙两个总体的均数之差的点估计为: {diff_estimate:.4f}")
    print()

    # 2. 已知两组样本标准差均为15的置信区间
    ci_equal_std = confidence_interval_equal_std(mean_A, n_A, mean_B, n_B)
    print("2. 若两组样本的样本标准差均为15:")
    print(
        f"   两总体均数之差的95%置信区间为: ({ci_equal_std[0]:.4f}, {ci_equal_std[1]:.4f})"
    )
    print()

    # 3. 已知样本方差的置信区间
    print(f"3. 若甲组样本方差={var_A}, 乙组样本方差={var_B}:")
    ci_sample_var = confidence_interval_sample_var(
        mean_A, n_A, var_A, mean_B, n_B, var_B
    )
    print(
        f"   两总体均数之差的95%置信区间为: ({ci_sample_var[0]:.4f}, {ci_sample_var[1]:.4f})"
    )
    print()

    # 4. 已知总体方差的置信区间
    print(f"4. 若甲组总体方差={pop_var_A}, 乙组总体方差={pop_var_B}:")
    ci_pop_var = confidence_interval_pop_var(
        mean_A, n_A, pop_var_A, mean_B, n_B, pop_var_B
    )
    print(
        f"   两总体均数之差的95%置信区间为: ({ci_pop_var[0]:.4f}, {ci_pop_var[1]:.4f})"
    )


if __name__ == "__main__":
    main()
