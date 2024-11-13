// #show heading: set text(font: "Noto Serifs CJK SC", size: 13pt)
#set text(font: "Noto Serif CJK SC", size: 10pt)

#show link: underline


// Feel free to change the margin below to best fit your own CV
#set page(
  margin: (x: 0.9cm, y: 1.3cm),
)

// For more customizable options, please refer to official reference: https://typst.app/docs/reference/

#set par(justify: true)

#let chiline() = {v(-3pt); line(length: 100%); v(1pt)}
#place(right, [#image("./images/me.jpg", height: auto, width: 13%)])

= 邹翔宇
中共党员 | 男 | 2000.11 \
长沙理工大学-计算机科学与技术学士学位 | 2023.06 \
\u{1f4e7} #link("mailto://zxy.xavier@gmail.com")[zxy.xavier\@gmail.com]
\u{1f4e1} #link("https://www.github.com/xavierzxy")[github.com/XavierZXY] 
\u{1f30d} #link("https://spacezxy.top/about")[www.spacezxy.top] 


== 专业技能
#chiline()
- 了解Python、C++、Java、Rust编程
- 熟悉常用数据结构和算法
- 熟悉计算机网络，操作系统等相关知识
- 了解Linux环境下常用工具和命令的使用
- 了解支持向量机，决策树等基础机器学习算法
- 了解卷积神经网络，注意力机制，Transformer等
- 了解构建机器学习系统的基础知识，了解TVM
- 了解LoRA模型优化技术
- 了解CUDA基础编程


== 实习经历
#chiline()
=== 北京澎峰科技公司 #h(1fr) 2024.06 -- 2024.08

- Flash attention相关工作
- cuda, hip

=== 中科院深圳理工大学训练营活动 #h(1fr) 2024.01 -- 2024.09

- 学习Mamba等相关模型技术
- CUDA并行编程，以及传统编译器基础知识

== 项目经历
#chiline()
=== 面向RISC-V架构的AI开发框架构建与优化 #h(1fr) 2024.02 -- 2024.05

- 在RISC-V开发板上使用ncnn工具部署水域安全检测系统
- 使用openmp, rvv, yolov5-lite等方法，优化加速模型的推理速度和推理流程

=== DeepLearning Sys #h(1fr) 2023.01 -- 2023.04

- 学习CMU DL Systems课程、学习简单GPU，CUDA编程
- 构建简单的深度学习系统
  - 实现自动微分
  - 实现计算图
  - 实现GPU矩阵运算加速

=== 第十三届大学生服务外包大赛 #h(1fr) 2022.02 -- 2022.06

- 使用深度学习模型学习多人声音频中的人声特征
- 使用C++将项目工程化部署

== 荣誉奖项
#chiline()
开放原子开源大赛-面向RISC-V架构的AI开发框架构建与优化二等奖 #h(1fr)  2024.04 \
长沙理工大学优秀毕业设计论文 #h(1fr) 2023.06 \
第十三届中国大学生服务外包大赛中南赛区三等奖 #h(1fr) 2022.06 \
长沙理工大学奖学金 #h(1fr) 多次获得 \

== 其他
#chiline()

- 语言： 英语（CET-6）