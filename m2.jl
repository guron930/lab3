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
