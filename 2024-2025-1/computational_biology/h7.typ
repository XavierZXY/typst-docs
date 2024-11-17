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

#align(center,text(font: "Noto Serif CJK SC", size: 14pt)[= HomeWork 11.13])
#align(center,[
  #set text(font: "Noto Serif CJK SC", size: 12pt)
  邹翔宇 | 2410833001
])
#chiline() 

== 1. What’s the difference between amino acids and residues?

1. 氨基酸（Amino Acids）：
氨基酸是构成蛋白质的基本单元，每个氨基酸分子包含一个氨基（-NH2）和一个羧基（-COOH），以及一个特定的侧链（R基）。在蛋白质合成过程中，氨基酸通过脱水缩合反应形成肽键，连接成长链状的多肽或蛋白质。

2. 残基（Residues）：
残基通常指的是蛋白质链中已经通过脱水缩合反应连接在一起的氨基酸单元。在蛋白质链中，每个氨基酸残基通过肽键与相邻的氨基酸残基相连。因此，残基可以看作是蛋白质链中的一个“节点”，它包含了氨基酸的氨基、羧基和侧链，但这些官能团已经参与形成了蛋白质链的结构。

== 2. Briefly describe the translation process of the central dogma.

1. 转录（Transcription）：
转录是遗传信息从DNA复制到RNA的过程。在这个过程中，细胞核中的DNA双螺旋结构解开，RNA聚合酶识别并结合到DNA模板链上，按照碱基互补配对原则，合成一条与DNA模板链互补的信使RNA（mRNA）分子。转录完成后，新合成的mRNA分子会离开细胞核，进入细胞质中准备进行翻译。

2. 翻译（Translation）：
翻译是遗传信息从mRNA转移到蛋白质的过程。在细胞质中，mRNA分子与核糖体结合，核糖体沿着mRNA移动，根据mRNA上的密码子（每三个核苷酸构成一个密码子，对应一个氨基酸）顺序，将转运RNA（tRNA）上携带的相应氨基酸连接起来，形成多肽链。每个tRNA分子都携带有一个特定的氨基酸，并且有一个反密码子，与mRNA上的密码子互补配对。随着核糖体的移动，多肽链逐渐延长，直到遇到mRNA上的终止密码子，翻译过程结束，新合成的多肽链（蛋白质）释放出来，完成蛋白质的合成。

== 3. What are important participants in the translation process and their roles?

1. 信使RNA（mRNA）：
mRNA是翻译过程的模板，它携带了从DNA转录来的遗传信息，这些信息以密码子的形式存在，指导氨基酸的顺序。

2. 转运RNA（tRNA）：
tRNA分子负责将氨基酸运送到生长中的多肽链上。每个tRNA分子都有一个反密码子，与mRNA上的密码子互补配对，确保正确的氨基酸被添加到多肽链上。

3. 核糖体：
核糖体是翻译过程的场所，它由rRNA（核糖体RNA）和蛋白质组成，负责催化氨基酸之间的肽键形成，将氨基酸连接成多肽链。

4. 氨基酸：
氨基酸是蛋白质的基本构建单元，由tRNA携带并根据mRNA上的密码子顺序被添加到生长中的多肽链上。

5. 起始因子（Initiation Factors）：
起始因子帮助核糖体识别mRNA上的起始密码子（AUG），并协助第一个tRNA与核糖体的P位点结合，启动翻译过程。

6. 延伸因子（Elongation Factors）：
延伸因子在翻译的延伸阶段起作用，帮助tRNA在核糖体的A位点与mRNA上的密码子正确配对，并促进肽键的形成，推动核糖体沿着mRNA移动。

7. 释放因子（Release Factors）：
释放因子识别mRNA上的终止密码子，促进多肽链的释放，终止翻译过程。

8. GTP（鸟嘌呤核苷酸三磷酸）：
GTP作为一种能量分子，在翻译过程中提供能量，特别是在起始和延伸阶段，GTP的水解提供必要的能量。

== 4. What’s the alphabet set of protein amino acid sequences? Compare it to the alphabet set of DNA and RNA sequences.

蛋白质氨基酸序列的字母表由20种标准氨基酸组成，每种氨基酸由一个或多个字母表示。这些氨基酸是：
#table(
columns: 8,
[丙氨酸（Ala，A）],
[精氨酸（Arg，R）],
[阿斯巴甜酸（Asp，D）],
[天冬氨酸（Asp，D）],
[半胱氨酸（Cys，C）],
[胱氨酸（Cys，C）],
[天冬酰胺（Asn，N）],
[谷氨酰胺（Gln，Q）],
[苯丙氨酸（Phe，F）],
[ 甘氨酸（Gly，G）],
[ 组氨酸（His，H）],
[ 异亮氨酸（Ile，I）],
[ 亮氨酸（Leu，L）],
[ 赖氨酸（Lys，K）],
[ 蛋氨酸（Met，M）],
[ 苏氨酸（Thr，T）],
[ 酪氨酸（Tyr，Y）],
[ 苯丙氨酸（Phe，F）],
[ 缬氨酸（Val，V）],
[ 色氨酸（Trp，W）],
)
相比之下，DNA序列的字母表由四种核苷酸组成，分别是：
1. 腺嘌呤（Adenine，A）
2. 胸腺嘧啶（Thymine，T）
3. 胞嘧啶（Cytosine，C）
4. 鸟嘌呤（Guanine，G）
RNA序列的字母表也由四种核苷酸组成，与DNA类似，但在RNA中胸腺嘧啶（T）被尿嘧啶（Uracil，U）所取代，所以RNA的字母表是：
1. 腺嘌呤（Adenine，A）
2. 尿嘧啶（Uracil，U）
3. 胞嘧啶（Cytosine，C）
4. 鸟嘌呤（Guanine，G）

蛋白质的氨基酸序列是由DNA序列通过转录和翻译过程产生的，其中DNA和RNA的三联体密码子（三个连续的核苷酸）对应一个特定的氨基酸。

== 5. What are the main categories of protein secondary structures?

蛋白质二级结构是指蛋白质链在空间中的局部折叠模式，主要类别包括：
1. α-螺旋（Alpha Helix）：
   - α-螺旋是蛋白质中最常见的二级结构之一，由氢键稳定的右手螺旋构象。在α-螺旋中，每个氨基酸残基的氨基氮与第四个残基的羧基氧形成氢键，使得螺旋结构稳定。
2. β-折叠（Beta Sheet）：
   - β-折叠是由多个β-折叠股通过氢键连接形成的平面结构。每个β-折叠股是一条相对伸直的多肽链，股与股之间可以是平行排列或反平行排列。
3. 转角（Turn）：
   - 转角是连接蛋白质中不同二级结构单元的弯曲部分，它们允许蛋白质链改变方向。常见的转角类型包括β-转角和γ-转角。
4. 环（Loop）：
   - 环或环区是指在蛋白质结构中不形成明显二级结构的区域，它们连接不同的二级结构单元，增加了蛋白质结构的复杂性和灵活性。
5. 无规则卷曲（Random Coil）：
   - 无规则卷曲指的是蛋白质链中没有特定二级结构的部分，这些区域通常较为灵活，没有固定的空间结构。
这些二级结构通过氢键、疏水作用、范德华力和二硫键等非共价相互作用稳定，共同决定了蛋白质的三维结构和功能。蛋白质的二级结构可以通过实验方法如X射线晶体学、核磁共振（NMR）等技术来确定。

== 6. Describe what is a protein domain and its relation with protein family.

蛋白质域（Protein Domain）是指蛋白质分子中的一个相对独立的三维结构和功能单元。蛋白质域通常具有以下特点：
1. 结构独立性：蛋白质域在其所在的多肽链中具有相对独立的折叠和空间构象，即使在没有与其他域连接的情况下也能保持其三维结构。
2. 功能专一性：蛋白质域往往承担特定的生物学功能，如催化生化反应、结合特定的配体或参与蛋白质-蛋白质相互作用。
3. 进化保守性：蛋白质域在进化过程中相对保守，即使在不同物种中，具有相似功能的域往往保持相似的序列和结构。

蛋白质域与蛋白质家族的关系：
1. 同源性：蛋白质家族是指具有共同祖先并通过进化分化而来的一组蛋白质。这些蛋白质在序列和结构上具有同源性，即它们之间存在一定的序列相似性和结构相似性。蛋白质域的同源性是蛋白质家族分类的基础。
2. 结构和功能的相关性：同一蛋白质家族中的成员通常具有相似的蛋白质域结构，这些域负责相似的生物学功能。因此，通过研究蛋白质域的结构和功能，可以推断出蛋白质家族成员的功能特性。
3. 域的组合和多样性：不同蛋白质家族的蛋白质可能通过组合不同的蛋白质域来实现多样化的功能。例如，一个蛋白质可能由多个不同的域组成，每个域负责不同的功能，这种域的组合可以产生新的功能或增强蛋白质的适应性。
4. 域的进化和功能分化：在进化过程中，蛋白质域可能通过复制、重组或突变等机制发生变异，从而产生新的功能或适应不同的生物学需求。这种域的进化和功能分化是蛋白质多样性的一个重要来源。

总之，蛋白质域是蛋白质结构和功能的基本单元，而蛋白质家族则是基于蛋白质域的同源性和功能相关性对蛋白质进行分类的一种方式。通过研究蛋白质域，可以更好地理解蛋白质家族的进化关系和功能多样性。
