---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе №3: Модель боевых действий"
subtitle: "*дисциплина: Математическое моделирование*"
author: "Швец Сергей Сергеевич, НФИбд-03-18"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
#lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: luatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Введение

## Цель работы

Изучить и построить простейшую модель боевых действий

## Задачи работы

1. Построить график изменения числености двух армий для случая боевых действий между регулярными войсками;
2. Построить график изменения числености двух армий для случая ведения боевых действий с участием регулярных войск и партизанских отрядов.


# Теоретическая справка

Рассмотрим два случая боевых моделей

## Первый случай
 $$ \begin{cases}
\frac{dx}{dt} =  -a(t)x(t) - b(t)y(t)+P(t)
\\
\frac{dx}{dt} =  -c(t)x(t) - h(t)y(t)+Q(t)
\end{cases}
$$



$-a(t)x(t) и -h(t)y(t)$ - потери, не связанные с боевыми действиями.$a(t), h(t)$ - характеризуют степень влияния различных факторов на потери(болезни, дезертирство и т.д)

$b(t), c(t)$ - коэффиценты, указывающие на эффективность боевых действий со стороны $y$ и $x$ соответственно.

## Второй случай

В этом случае считается, что темп потерь партизан, проводящих свои операции в разных местах на неизвестной территории, пропорционален не только численности армейских соединенй, но и численности самих партизан

$$ \begin{cases}
\frac{dx}{dt} =  -a(t)x(t) - b(t)y(t)+P(t)
\\
\frac{dx}{dt} =  -c(t)x(t)y(t) - h(t)y(t)+Q(t)
\end{cases}
$$


## Простейшие модели

### Первый случай
Факторы, влияющие на модель:
 - $b, c$ - постоянны
 - Не учитваются потери, не с вязанные с боевыми действиями(коэффиценты $a(t), c(t)$)
 - Не учитывается возможность подхода подкрепления:
 - $x, y$ - численность противостоящих армий

 $$ \begin{cases}
 \frac{dx}{dt} =  - b(t)y(t)
 \\
 \frac{dx}{dt} =  -c(t)x(t)
 \end{cases}
 $$

 Тогда:

 $$\frac{dx}{dy} = \frac{by}{cx}$$

 $cxdx = bydy$

 $cx^2-by^2 = C$

 Влияние  $C$:

 - $C < 0$ - армия $y$ выигрывает
 - $C>0$ - армия $x$ выигрывает
 - $C= 0$ - истребление обеих армий(требуется бесконечно большое время)


### Второй случай
Модель принимает вид:

$$ \begin{cases}
\frac{dx}{dt} =  - b(t)y(t)
\\
\frac{dx}{dt} =  -c(t)x(t)y(t)
\end{cases}
$$


$\frac{dx}{dt}$ -   изменение численности рнегулярных войск

$\frac{dy}{dt}$ -  изменение численности партизанских войск

Уравнение:
$$\frac{d}{dt}\bigg(\frac{b}{2}x^2(t) - cy(t)\bigg) = 0 $$

Введем начальные данные:
$$\frac{b}{2}x^2(t) - cy(t) = \frac{b}{2}x^2(0) - cy(0) = C_1$$

Влияние  $C_1$:

- $C_1 < 0$ -  партизаны побеждают
- $C_1>0$ - регулярная армия выигрывает
- $C_1 = 0$ - истребление обоих войск(требуется бесконечно большое время)

# Выполнение лабораторной работы

## Формулировка задачи:
**Вариант 7**

Между страной $X$ и страной $Y$ идет война. Численность состава войск исчисляется от начала войны, и являются временными функциями $x(t)$, $y(t)$ . В начальный момент времени страна $X$ имеет армию численностью 24 000 человек, а в распоряжении страны У армия численностью в 9 500 человек. Для упрощения модели считаем, что коэффициенты $a, b, c, h$ постоянны. Также считаем $P(t)$ и $Q(t)$ непрерывные функции.

## Решение

Построим графики изменения численности войск армии Х и армии У для следующих случаев:

1. Модель боевых действий между регулярными войсками:

$$ \begin{cases}
\frac{dx}{dt} =  -0,3x(t)-0,87y(t)+sin(2t)+1
\\
\frac{dx}{dt} =  - 0,5x(t)-0,41y(t)+cos(3t)+1
\end{cases}
$$

*Код на Julia*

```
using Plots
using DifferentialEquations
theme(:wong)
#Численность армий
x0 = 24000;
y0 = 9500;
#Потери, не связанные с боевыми действиями
 a = 0.3;
 h = 0.41;
 #Эффективность боевых действий
 b = 0.87;
 c = 0.5;
 #Подкрепления
 P(t) = sin(2t)+1;

 Q(t) = cos(3t)+1;

 # СДУ
 function m!(dy, y, p, t)
       dy[1]=-a*y[1]-b*y[2]+P(t)
       dy[2]=-c*y[1]-h*y[2]+Q(t)
       end
#Вектор начальных значений
y0 = [x0, y0]
tspan = (0.0,1.0);

#Решение СДУ
 pr = ODEProblem(m!,y0,tspan);
 s = solve(pr);

#график
  pl = plot(s,title = "Модель сражения №1",
  label = ["Армия X" "Армия Y"],
   xlabel = "Время",
   ylabel= "Численность",
   lw = 2)

   display(pl)

 savefig(pl,"1.png")

```
![Модель боевых действий №2 ](1.png){ #fig:001 width=70% }

*Модель боевых действий между 2-мя регулярными армиями*

**Вывод**: армия X выигрывает с потерями около 9000 человек(по графику видно, что численность армии Y равна 0 менее чем за единицу времени)

2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов:

$$ \begin{cases}
\frac{dx}{dt} =  -0,25x(t)-0,64y(t)+sin(2t+4)
\\
\frac{dx}{dt} =  - 0,2x(t)y(t)-0,52y(t)+cos(t+4)
\end{cases}
$$

*Код на Julia*

```
using Plots
using DifferentialEquations
theme(:wong)
#Начальные значения
x0 = 24000;
y0 = 9500;
#Коэффиценты
 a = 0.25;
 h = 0.52;
 b = 0.64;
 c = 0.2;
#Подкрепление
 P(t) = sin(2t+4)
 Q(t) = cos(t+4);
# СДУ
 function m2!(dy, y, p, t)
       dy[1]=-a*y[1]-b*y[2]+P(t)
       dy[2] = -c*y[1]*y[2]-h*y[2]+Q(t)
       end
y_0 = [x0, y0];
tspan = (0.0, 1.0);
#Решение системы
 prb = ODEProblem(m2!,y_0,tspan);
 sol = solve(prb, saveat = 0.05);
#график
  pl = plot(sol,title = "Модель сражения №2",
  label = ["Армия X" "Армия Y"],
   ylabel= "Численность",
   xlabel = "Время",
    lw = 2)

   display(pl)
#Сохранение графика
savefig(pl,"2.png")
```

![Модель боевых действий №2 ](2.png){ #fig:002 width=70% }

*Модель боевых действий между регулярной армией и партизанами*

**Вывод**: армия X выигрывает с небольшими потерями

# Выводы

Мы изучили простейстейшие модели боевых действий.
