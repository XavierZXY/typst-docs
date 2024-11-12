#set text(font: ("Noto Serif CJK SC"), size: 10pt)
// #set text(font: "Source Sans Pro", size: 12pt)

// #show heading: set text(font: "Noto Serif CJK SC", size: 12pt)

#show link: underline


// Feel free to change the margin below to best fit your own CV
#set page(
  margin: (x: 1.4cm, y: 1.5cm),
)

// For more customizable options, please refer to official reference: https://typst.app/docs/reference/

#set par(justify: true)

#let chiline() = {v(-3pt); line(length: 100%); v(-3pt)}

// For code
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 20pt,
  radius: 4pt,
)

#align(center,text(font: "Noto Serif CJK SC", size: 14pt)[= HomeWork 11.06])
#align(center,[
  #set text(font: "Noto Serif CJK SC", size: 12pt)
  邹翔宇 | 2410833001
])
#chiline() 

== 设一条蛋白由三个氨基酸组成，第一个氨基酸是起始氨基酸，第二个氨基酸是疏水性氨基酸，第三个氨基酸是终止氨基酸。
== 1. 写出所有可能的氨基酸序列；

#table(
  columns: 6,
  [ML-],
  [MI-],
  [MV-],
  [MF-],
  [MW-],
  [MA-],
)

== 2. 写出所有可能的mRNA序列；
#table(
  columns: 6,
  [AUG-UUA-UAA], [AUG-UUA-UAG], [AUG-UUA-UGA], 
  [AUG-UUG-UAA], [AUG-UUG-UAG], [AUG-UUG-UGA], 
  [AUG-CUU-UAA], [AUG-CUU-UAG], [AUG-CUU-UGA], 
  [AUG-CUC-UAA], [AUG-CUC-UAG], [AUG-CUC-UGA], 
  [AUG-CUA-UAA], [AUG-CUA-UAG], [AUG-CUA-UGA], 
  [AUG-CUG-UAA], [AUG-CUG-UAG], [AUG-CUG-UGA], 
  [AUG-AUU-UAA], [AUG-AUU-UAG], [AUG-AUU-UGA], 
  [AUG-AUC-UAA], [AUG-AUC-UAG], [AUG-AUC-UGA], 
  [AUG-GUU-UAA], [AUG-GUU-UAG], [AUG-GUU-UGA], 
  [AUG-GUC-UAA], [AUG-GUC-UAG], [AUG-GUC-UGA], 
  [AUG-GUA-UAA], [AUG-GUA-UAG], [AUG-GUA-UGA], 
  [AUG-GUG-UAA], [AUG-GUG-UAG], [AUG-GUG-UGA], 
  [AUG-UUU-UAA], [AUG-UUU-UAG], [AUG-UUU-UGA], 
  [AUG-UUC-UAA], [AUG-UUC-UAG], [AUG-UUC-UGA], 
  [AUG-UGG-UAA], [AUG-UGG-UAG], [AUG-UGG-UGA], 
  [AUG-GCU-UAA], [AUG-GCU-UAG], [AUG-GCU-UGA], 
  [AUG-GCC-UAA], [AUG-GCC-UAG], [AUG-GCC-UGA], 
  [AUG-GCA-UAA], [AUG-GCA-UAG], [AUG-GCA-UGA], 
  [AUG-GCG-UAA], [AUG-GCG-UAG], [AUG-GCG-UGA]
)

== 3. 写出所有可能的基因序列；
#table(
  columns: 6, 
[ATG-TAA-TAA], [ATG-TAA-TAG], [ATG-TAA-TGA], 
[ATG-TGA-TAA], [ATG-TGA-TAG], [ATG-TGA-TGA], 
[ATG-GAA-TAA], [ATG-GAA-TAG], [ATG-GAA-TGA], 
[ATG-GAC-TAA], [ATG-GAC-TAG], [ATG-GAC-TGA], 
[ATG-GAU-TAA], [ATG-GAU-TAG], [ATG-GAU-TGA], 
[ATG-GAG-TAA], [ATG-GAG-TAG], [ATG-GAG-TGA], 
[ATG-TTA-TAA], [ATG-TTA-TAG], [ATG-TTA-TGA], 
[ATG-TTG-TAA], [ATG-TTG-TAG], [ATG-TTG-TGA], 
[ATG-GTA-TAA], [ATG-GTA-TAG], [ATG-GTA-TGA], 
[ATG-GTC-TAA], [ATG-GTC-TAG], [ATG-GTC-TGA], 
[ATG-GTG-TAA], [ATG-GTG-TAG], [ATG-GTG-TGA], 
[ATG-GTT-TAA], [ATG-GTT-TAG], [ATG-GTT-TGA], 
[ATG-TTT-TAA], [ATG-TTT-TAG], [ATG-TTT-TGA], 
[ATG-TTC-TAA], [ATG-TTC-TAG], [ATG-TTC-TGA], 
[ATG-TGG-TAA], [ATG-TGG-TAG], [ATG-TGG-TGA], 
[ATG-AGG-TAA], [ATG-AGG-TAG], [ATG-AGG-TGA], 
[ATG-GGC-TAA], [ATG-GGC-TAG], [ATG-GGC-TGA], 
[ATG-GGA-TAA], [ATG-GGA-TAG], [ATG-GGA-TGA], 
[ATG-GGG-TAA], [ATG-GGG-TAG], [ATG-GGG-TGA]
)

== 4.回答存不存在一个基因点突变，使得其蛋白产物是亲水的。列举出所有可能性。

1. Cys & Trp
(TGT、TGC) -> TGG
2. Ser & Pro
(TCT、TCC、TCA、TCG) -> (CCT、CCC、CCA、CCG)
3. Thr & Pro
(ACT、ACC、ACA、ACG) -> (CCT、CCC、CCA、CCG)