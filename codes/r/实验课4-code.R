# 实验课4  描述统计

library(tidyverse)
setwd('/Users/yuanyuan/Library/CloudStorage/OneDrive-个人/工作/2025春季/实验课4')

############################## 连续值变量 ###################################

library(readr)
d.cancer <- read_csv("cancer.csv", locale=locale(encoding = "GBK"))
d.cancer


# 连续性变量：集中趋势
str(d.cancer)
summary(d.cancer$v0)
mean(d.cancer$v0)
median(d.cancer$v0)
quantile(d.cancer$v0,probs=c(0.25,0.50,0.75))

# 连续性变量：离散趋势
sd(d.cancer$v0)
max(d.cancer$v0)
min(d.cancer$v0)
max(d.cancer$v0) - min(d.cancer$v0)
IQR(d.cancer$v0)

# 两连续变量
cov(d.cancer$v0, d.cancer$v1)
cor(d.cancer$v0, d.cancer$v1)

R.iris <- cor(iris[,1:4])
print(round(R.iris, 2))  


# dplyr
library(dplyr)
d.cancer %>% 
  drop_na() %>% 
  summarise( mean(age),
             median(age),
             quantile(age,0.25), 
             sd(age),
             max(age),
             min(age),
             IQR(age)) 

d.cancer %>% 
  drop_na() %>%
  group_by(sex) %>%
  summarise( mean(age),
             median(age),
             quantile(age,0.25), 
             sd(age),
             max(age),
             min(age),
             IQR(age)) 


## Hmisc包/psych包 ####
# install.packages("Hmisc")
library(Hmisc)
vars <- c("age","v0")
describe(d.cancer[vars])

# install.packages("psych")
library(psych)
vars <- c("age","v0")
describe(d.cancer[vars])


############################## 分类变量 ###################################


##　base包: table()/prop.table()　####
# 一维列联表
table(d.cancer$type)
prop.table(table(d.cancer$type))
prop.table(table(d.cancer$type))*100

# 二维列联表
d.cancer <- d.cancer %>% mutate(Agecate=case_when(age < 50 ~ "less than 50",
                                                  age >= 50 & age < 60 ~ "50 ~ 60",
                                                  age >= 60 & age < 70 ~ "60 ~ 70",
                                                  TRUE ~ "more than 70"))
d.cancer
a <- table(d.cancer$sex,d.cancer$Agecate)
a
prop.table(a) #计算整个百分比
prop.table(a,1)  #计算行百分比
prop.table(a,2)  #计算列百分比

margin.table(a) #计算整个合计
margin.table(a,1) #计算行合计
margin.table(a,2) #计算列合计

addmargins(a) #添加行和列合计
addmargins(a,1) #添加一行进行合计
addmargins(a,2) #添加一列进行合计

addmargins(prop.table(a,1)) 

##　base包: xtabs()　####
xtabs(~ d.cancer$sex + d.cancer$Agecate)

##　gmodels包: CrossTable()　####
library(gmodels)
CrossTable(d.cancer$sex, d.cancer$Agecate, prop.chisq = FALSE)

## dplyr包：count() ####
d.cancer %>% count(sex) 
d.cancer %>% group_by(sex) %>% count(Agecate) 


# 分组描述(连续+分类)
aggregate(d.cancer$v0,by=list(Gender=d.cancer$sex),mean)
aggregate(d.cancer$v0,by=list(Gender=d.cancer$sex),sd)


############################## 自主实验1 ###################################

# 1. 导入d.cancer，并进行后续的操作
# 2. 在d.cancer中根据v0生成grade变量（按照v0<60; 60-100; 100-140; ≥140，
# 3. 分别赋值为grade1, grade2, grade3, grade4），
d.cancer <- d.cancer %>%
  mutate(grade = case_when(
    v0 < 60 ~ "grade1",
    v0 >= 60 & v0 < 100 ~ "grade2",
    v0 >= 100 & v0 < 140 ~ "grade3",
    v0 >= 140 ~ "grade4"
  ))

# 4. 描述不同grade分组中，性别、年龄分布情况

# 性别分布
table(d.cancer$grade, d.cancer$sex)

# 年龄分布 (均值)
aggregate(age ~ grade, data = d.cancer, FUN = mean)

# 年龄分布 (标准差)
aggregate(age ~ grade, data = d.cancer, FUN = sd)

# 年龄分布 (中位数)
aggregate(age ~ grade, data = d.cancer, FUN = median)

# 年龄分布 (四分位数)
aggregate(age ~ grade, data = d.cancer, FUN = quantile)


############################## 统计图 ###################################

# 1. 条形图
res1 <- table(d.cancer[,'sex']); print(res1)

barplot(res1)
par(family='STKaiti')
barplot(res1, main="性别分布", 
        col=c("brown2", "aquamarine1"))

barplot(res1, width=0.5, xlim=c(-2, 5),
        main="性别分布", 
        col=c("brown2", "aquamarine1"))

barplot(res1, main="性别分布", horiz = TRUE, 
        col=c("brown2", "aquamarine1"))


# 交叉分组频数
res2 <- with(d.cancer, table(sex, type)); res2
barplot(res2, legend=TRUE)
barplot(res2, beside=TRUE, legend=TRUE) # 并排展示
barplot(res2, beside=TRUE, legend=TRUE,
        main='不同种类病人的性别',
        ylim=c(0, 20),
        xlim=c(-1, 6), width=0.6,
        col=c("brown2", "aquamarine1"))


# 2. 饼图
pie(res1, main="Pie")

pie(res1, labels = c('Female', 'Male'), 
    main = "饼图示例 1", 
    col = c("red", "green"))

pie(res1, labels = c('Female', 'Male'), 
    main = "饼图示例 1", 
    col = c("red", "green"),
    init.angle = 90)


# 3. 直方图和密度曲线
x <- rnorm(30, mean=100, sd=1)
print(round(x,2))
hist(x)
hist(x, col=rainbow(15), 
     main='正态随机数', xlab='', ylab='频数')

hist(x, freq=FALSE,
     col=rainbow(15),
     main='正态随机数',
     xlab='', ylab='频数')
plot(density(x), lwd=2, col='blue')

hist(x, freq=FALSE,
     col=rainbow(15),
     main='正态随机数',
     xlab='', ylab='频数')
lines(density(x), lwd=2, col='blue')


# 4. 箱线图 & 小提琴图
with(d.cancer, boxplot(v0))
with(d.cancer, boxplot(v0 ~ sex))
with(d.cancer,
     boxplot(list('疗前'=v0, '疗后'=v1)))

library(vioplot)
with(d.cancer,
     vioplot(list('疗前'=v0, '疗后'=v1)))


# 5. 散点图
d.class <- read_csv("class.csv")
d.class 
plot(d.class$height, d.class$weight)

with(d.class,
     plot(height, weight))

with(d.class,
     plot(height, weight,
          main='体重与身高关系',
          xlab='身高', ylab='体重'))

with(d.class,
     plot(height, weight,
          pch=16, col='blue',
          cex=1))

with(d.class,
     plot(height, weight,
          pch=16, col='blue',
          cex=1 + (age - min(age))/(max(age)-min(age))))

with(d.class, 
     plot(height, weight,
          main='体重与身高关系',
          xlab='身高', ylab='体重',
          pch=16, 
          col=ifelse(sex=='M', 'blue', 'red'),
          cex=1 + (age - min(age))
          /(max(age)-min(age))))

# 散点图矩阵
pairs(d.class[, c('age', 'height', 'weight')])


# 6. qq图
qqnorm(x)
qqline(x, lwd=2, col='blue')


############################## R作图 ###################################

# 1. 函数曲线
curve(1 - 3*x - x^2, -4, 2)
curve(sin, -2*pi, 2*pi)

x <- seq(0, 2*pi, length=200)
y <- sin(x)
plot(x,y)
plot(x,y, type='l')
plot(x,y, type='l', lwd=2)
plot(x,y, type='l', lwd=2, lty=3)


# 2. abline
abline(h=0, col='gray')

with(d.class, plot(height, weight))
abline(-143, 3.9, col="red", lwd=2)  # 截距、斜率
abline(v=c(55,60,65,70), col="gray")
abline(h=c(60,80,100,120,140), col="gray")

# 3. plot();points();lines()；text()
x <- seq(0, 2*pi, length=200)
y <- sin(x)
special <- list(x=(0:4)*pi/2, y=sin((0:4)*pi/2))
plot(x, y, type='l')
points(special$x, special$y, 
       col="red", pch=16, cex=2)
points(special, col="red", pch=16, cex=2)

lines(x, y, lwd=2, col="blue")

legend(0, -0.5, col=c("red", "blue"),
       lty=c(1,1), lwd=c(2,2), 
       legend=c("sin", "cos"))

legend('top', col=c("red", "blue"),
       lty=c(1,1), lwd=c(2,2), 
       legend=c("sin", "cos"))

text(4, 1, adj=0, '正弦函数和余弦函数')
text(4, 1, adj=0.1, '正弦函数和余弦函数')


# 一页多图
opar <- par(mfrow=c(2,2),    # 一页多图用mfrow参数或mfcol参数规定
            oma=c(0,0,2,0))  # oma指定四个外边空的行数
with(d.class, {hist(height);
  boxplot(height);
  qqnorm(height); qqline(height);
  plot(height)})
mtext(side=3, text='身高分布', cex=2, outer=T)


opar <- par(mfcol=c(2,2),    # 一页多图用mfrow参数或mfcol参数规定
            oma=c(0,0,2,0))  # oma指定四个外边空的行数
with(d.class, {hist(height);
  boxplot(height);
  qqnorm(height); qqline(height);
  plot(height)})
mtext(side=3, text='身高分布', cex=2, outer=T)
par(opar)

# 保存输出

pdf(file='fig-hw.pdf', height=4,
    width=4, family='GB1')
with(d.class, plot(height, weight,
                   main='体重与身高关系'))
dev.off()


png(file='fig-hw.png', height=500, width=500)
with(d.class, plot(height, weight,
                   main='weight&height'))
dev.off()


############################## ggplot作图 ###################################

library(ggplot2)
data(diamonds)
diamonds

small<-diamonds[sample(nrow(diamonds),1000),] 
head(small)
p <- ggplot(data=small, 
            mapping=aes(x=carat, y=price))
p+geom_point()


p <- ggplot(small, 
            aes(carat, price))
p+geom_point()
p + geom_point() + geom_smooth()


# 1. 数据和映射
# 加形状
p <- ggplot(data=small, mapping=aes(x=carat, y=price, shape=cut))
p+geom_point()

# 加颜色
p <- ggplot(data=small, mapping=aes(x=carat, y=price, shape=cut, colour=color))
p+geom_point()


# 2. 几何对象
### 直方图
ggplot(small)+geom_histogram(aes(x=price))
ggplot(small)+geom_histogram(aes(x=price, fill=cut))
ggplot(small)+geom_histogram(aes(x=price, fill=cut), position="dodge")
ggplot(small)+geom_histogram(aes(x=price, fill=cut), position="fill")

### 条形图
ggplot(small)+geom_bar(aes(x=clarity))
ggplot()+geom_bar(aes(x=c(LETTERS[1:3]),y=1:3), stat="identity")

### 密度曲线
ggplot(small)+geom_density(aes(x=price, colour=cut))  # 曲线颜色
ggplot(small)+geom_density(aes(x=price,fill=clarity))  # 填充颜色

### 箱线图
ggplot(small)+geom_boxplot(aes(x=cut, y=price,fill=color))


# 3. 统计变换（Statistics）
### 连续值
ggplot(small, aes(x = cut, y = price)) +
  stat_summary(fun = mean, geom = "bar", fill = "skyblue", 
               position = position_dodge())

ggplot(small, aes(x = cut, y = price)) +
  stat_summary(fun = mean, geom = "point", fill = "skyblue")

ggplot(small, aes(x = cut, y = price)) +
  stat_summary(fun = sum, geom = "point", fill = "skyblue")

ggplot(small, aes(x = cut, y = price)) +
  stat_summary(fun = sd, geom = "point", fill = "skyblue")

### 分类值
ggplot(small, aes(x = color)) +
  stat_count()

ggplot(small, aes(x = cut)) +
  stat_count()


# 4. scale
ggplot(small)+
  geom_point(aes(x=carat, y=price, shape=cut, colour=color))+
  scale_colour_manual(values=rainbow(7))

ggplot(small)+
  geom_point(aes(x=carat, y=price, shape=cut, colour=color))+
  scale_y_log10()+
  scale_colour_manual(values=rainbow(7))


# 5. 坐标系
ggplot(small)+geom_bar(aes(x=cut, fill=cut))
## coord_flip()坐标轴翻转
ggplot(small)+geom_bar(aes(x=cut, fill=cut))+coord_flip()
## coord_polar()转极坐标
ggplot(small)+geom_bar(aes(x=factor(1), fill=cut))+coord_polar(theta="y")
## 靶心图
ggplot(small)+geom_bar(aes(x=factor(1), fill=cut))+coord_polar()
## 风玫瑰图
ggplot(small)+geom_bar(aes(x=clarity, fill=cut))+coord_polar()


# 6. 位置调整（position adjustment）
ggplot(small, aes(x = cut, y = price, fill = color)) +
  stat_summary(fun = mean, geom = "bar", position = 'dodge') 

ggplot(small, aes(x = cut, y = price, fill = color)) +
  stat_summary(fun = mean, geom = "bar", position = 'stack') 

ggplot(small, aes(x = cut, y = price, fill = color)) +
  stat_summary(fun = mean, geom = "bar", position = 'fill') 

ggplot(small, aes(x = cut, y = price, fill = color)) +
  stat_summary(fun = mean, geom = "bar", position = position_dodge(width=0.5)) 

ggplot(small, aes(x = cut, y = price, fill = color)) +
  stat_summary(fun = mean, geom = "bar", position = position_dodge(width=0.9)) 


# 7. 主题（theme）
ggplot(small, aes(x = cut, y = price)) +
  geom_point() + 
  labs(title = "Price of Diamonds by cut") 

ggplot(small, aes(x = cut, y = price,  color = color)) +
  geom_point() + 
  labs(title = "Price of Diamonds by cut") 

### 调整图的背景和标题
ggplot(small, aes(x = cut, y = price,  color = color)) +
  geom_point() + 
  labs(title = "Price of Diamonds by Cut and Color") + 
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.background = element_rect(fill = "lightyellow")
  )

### 调整面板背景和网格
ggplot(small, aes(x = cut, y = price,  color = color)) +
  geom_point() + 
  theme(
    panel.background = element_rect(fill = "lightblue"),
    panel.grid.major = element_line(color = "gray"),
    panel.grid.minor = element_blank()
  )

### 调整图例
ggplot(small, aes(x = cut, y = price,  color = color)) +
  geom_point() + 
  labs(title = "Price of Diamonds by Cut") +
  theme(
    legend.background = element_rect(fill = "lightgray"),
    legend.position = "right",
    legend.title = element_text(face = "bold")
  )

### 调整坐标轴
ggplot(small, aes(x = cut, y = price,  color = color)) +
  geom_point() + 
  labs(title = "Average Price of Diamonds by Cut") +
  theme(
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

### R自带主题 theme_XX
p <- ggplot(small, aes(x = cut, y = price,  color = color)) +
        geom_point() + 
        labs(title = "Average Price of Diamonds by Cut") 

p + theme_bw()
p + theme_minimal()
library(ggthemes)
p + theme_wsj()


# 8. 分面
ggplot(small, aes(x=carat, y=price))+
  geom_point()+
  scale_y_log10()+
  facet_wrap(.~cut)+
  stat_smooth()

ggplot(small, aes(x=carat, y=price))+
  geom_point()+
  scale_y_log10()+
  facet_wrap(~cut, nrow = 1, ncol = 5)+
  stat_smooth()

ggplot(small, aes(x = carat, y = price)) +
  geom_point(stat = "identity", fill = "skyblue") +
  facet_grid(color ~ cut) +
  labs(title = "Price of Diamonds by Cut, Color, and Clarity")


############################## 自主实验2 ###################################
# 根据 v0 的分级（grade），绘制不同分级的性别分布堆叠条形图，要求添加比例标签和图例。
# 使用箱线图和小提琴图对比不同 grade 分组中 age 的分布差异，并为图表添加自定义标题和坐标轴标签。
# 绘制 v0 与 v1 的散点图，用颜色区分 type 变量，添加趋势线，并调整图表主题为 theme_minimal()。
# 使用 ggplot2 分面功能，展示不同 sex 和 type 组合下 v0 的直方图分布。

# 1. 堆叠条形图
ggplot(d.cancer, aes(x = grade, fill = sex)) +
  geom_bar(position = "fill") +
  geom_text(aes(label = scales::percent(..count../tapply(..count.., ..x.., sum)[..x..])),
            stat = "count",
            position = position_fill(vjust = 0.5)) +
  labs(title = "Gender Distribution by Grade",
       x = "Grade",
       y = "Proportion") +
  theme_minimal()

# 2. Boxplot and Violin Plot
ggplot(d.cancer, aes(x = grade, y = age, fill = grade)) +
  geom_boxplot() +
  geom_violin(alpha = 0.5) +
  labs(title = "Age Distribution by Grade",
       x = "Grade",
       y = "Age") +
  theme_minimal()

# 3. Scatter Plot
ggplot(d.cancer, aes(x = v0, y = v1, color = type)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "V0 vs V1",
       x = "V0",
       y = "V1") +
  theme_minimal()

# 4. Faceted Histogram
ggplot(d.cancer, aes(x = v0)) +
  geom_histogram() +
  facet_grid(sex ~ type) +
  labs(title = "Histogram of V0 by Sex and Type",
       x = "V0",
       y = "Frequency") +
  theme_minimal()
