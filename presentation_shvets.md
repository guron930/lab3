---
## Front matter
title: Модель боевых действий
author: С. Швец
institute: "RUDN University, Moscow, Russian Federation"
date: 2021, 27 february
## Formatting
toc: false
slide_level: 2
theme: metropolis
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: Fira Code
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
aspectratio: 43
section-titles: true
---
# Цель работы

Изучить и построить пмодели боевых действий

# Выполнение лабораторной работы

## Модель боевых действий между регулярными войсками

$$ \begin{cases}
\frac{dx}{dt} =  -0,3x(t)-0,87y(t)+sin(2t)+1
\\
\frac{dx}{dt} =  - 0,5x(t)-0,41y(t)+cos(3t)+1
\end{cases}
$$
Начальные данные:
- $x_0$ = 44150
- $y_0$ = 19000


## 1)


На Julia задаем Коэффиценты и функции, описывающие подход подкрепления

```
P(t) = sin(2t)+1;
Q(t) = cos(3t)+1;

```
Задаем систему дифференциальных уравнений:
```
function m!(dy, y, p, t)
			dy[1]=-a*y[1]-b*y[2]+P(t)
			dy[2]=-c*y[1]-h*y[2]+Q(t)
			end
```
## 2)

Решение системы с помощью внутренних пакетов Julia:

```
y0 = [x0, y0]
tspan = (0.0,1.0);
#Решение СДУ
 pr = ODEProblem(m!,y0,tspan);
 s = solve(pr);
```
## 3)

Построение графика:
```
pl = plot(s,title = "Модель сражения №1",
label = ["Армия X" "Армия Y"],
 xlabel = "Время",
 ylabel= "Численность",
 lw = 2)

```
## 4)

График для модели боевых действий  между 2мя регулярными армиями (рис. -@fig:001)

![Модель боевых действий регулярных армий](1.png){ #fig:001 width=70% }


## Модель боевых действий между регулярными войсками и партизанской армией

$$ \begin{cases}
\frac{dx}{dt} =  -0,25x(t)-0,64y(t)+sin(2t+4)
\\
\frac{dx}{dt} =  - 0,2x(t)y(t)-0,52y(t)+cos(t+4)
\end{cases}
$$

## 5)

Решение CДУ

```
	m2!(dy, y, p, t)
		       dy[1]=-a*y[1]-b*y[2]+P(t)
		       dy[2] = -c*y[1]*y[2]-h*y[2]+Q(t)
		       end
		y_0 = [x0, y0];
		tspan = (0.0, 1.0);
		#Решение системы
		 prb = ODEProblem(m2!,y_0,tspan);
		 sol = solve(prb, saveat = 0.05);
```
## 6)
Графики модели боевых действий между регулярной армией и  партизанскими войсками (рис. -@fig:002)

![Модель боевых действий регулярной армии и партизанских войск](2.png){ #fig:002 width=70% }


# Выводы

Мы изучили модели боевых действий и построили графики простейших моделей
