#import "simplepaper.typ": *

#show: project.with(
  title: "A Reading Report About _AHPA_",
  authors: (
    (
      name: "邹翔宇",
      // organization: [Typst Group],
      // email: "zs@typst.app",
    ),
    (
      name: "陈锦新",
      // organization: [Rust Group],
      // email: "ls@typst.app",
    ),
  ),
  // abstract: "本文详细描述了 SimplePaper 模版的使用方法。",
  // keywords: (
  //   "Typst",
  //   "模板",
  //   "使用说明",
  // ),
)

= 模版简介

SimplePaper#cite(<SimplePaper>) 是 Typst 的模版，用于生成简单的论文。
在全球化的大背景下，货币国际化已成为衡量一个国家经济实力和国际影响力的重要标志。随着中国经济的快速崛起，人民币国际化的议题受到了越来越多的关注。本文旨在探讨人民币国际化的逻辑及其与新时代中国经济发展战略的关联，同时对比分析美元霸权的内在机制，以期为中国在全球经济体系中的地位提升提供思考。货币国际化不仅仅是一种货币在全球范围内被广泛使用和接受的过程，它还涉及到一个国家的经济政策、金融市场的开放程度、以及国际政治经济格局的变迁。美元作为当前国际货币体系中的主导货币，其霸权地位的形成和发展有着复杂的历史背景和内在逻辑。理解美元霸权的成因，对于我们分析人民币国际化的路径和策略具有重要的启示作用。

= 使用说明

使用前确保已经安装了对应的字体！详细字体列表参考 #link("https://github.com/1bitbool/SimplePaper/tree/main")[README] 或模板文件。

= 使用示例 <example>

== 特殊标记 <bug1>

你可以 Typst 的语法对文本进行特殊标记，模板设定了几种语法的样式：*突出*、_强调_、引用@example。


== 图片

// 图片标题默认设置了方正楷体，效果如@img 如果你想要使用其他字体，你可以自行修改模版。

// #figure(image("sample.svg"),
//   caption: [
//     示例图片
//   ],
// )<img>

图片后的文字。

== 表格

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 10pt,
    align: horizon,
    [], [周一], [周二], [周三], [周四], [周五],
    "早上", "编译原理", "操作系统", "计算机网络", "操作系统", "计算机网络",
    "下午", "数据挖掘", "计算机网络", "操作系统", "计算机网络", "分布式系统",
  ),
  caption: "示例表格",
)

表格后的文字。

== 代码

我们为代码添加了如下简单的样式。

```c
#include <stdio.h>
int main()
{
   // printf() 中字符串需要引号
   printf("Hello, World!");
   return 0;
}
```

代码后的文字。

== 列表

下面是有序列表的示例：

+ 第一项
+ 第二项
+ 第三项

列表后的文字。

下面是无序列表的示例：

- 第一项
- 第二项
- 第三项

无序列表后的文字。

#bibliography("ref.bib")

