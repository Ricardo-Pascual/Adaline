%Limpiamos y borramos variables de trabajo
clear all; close all; clc;
%Creamos la matriz de entradas 
P=[-1 -1 1 1;-1 1 -1 1];
%Creamos el vector de salidas esperadas
T=[-1 -1 -1 1];
%Obtenemos el valor de alpha
alpha=((1/4)*.49);
%Asignamos los dos pesos aleatorios a el vector W 
W=rand(1,2)*10;
%Asignamos el valor aleatorio a b
b=rand(1)*10;
%Comenzamos a evaluar de acuerdo al modelo con 30 epocas
for epocas = 1:30
  %Con este ciclo recorremos los valores de cada columna 
  %de nuestra matriz P que contiene los valores de entrada
  for i=1:4
    %Realizamos la funcion purelin la cual vamos a utilizar para corregir
    %el error
    a=purelin(W*P(:,i)+b);
    %Calculamos el error para la salida esperada menos 
    %el resultado de la funcion purelin 
    e=T(1,i)-a;
    %Recalculamos el valor de W con los datos calculados anteriormente
    W=W+(alpha*e*P(:,i)');
    %Recalculamos el valor de b con los datos calculados anteriormente
    b=b+(alpha*e);
  end
  
end
%Activamos hold para poder graficar en una sola vista
hold on
%Graficasmo los puntos de entrada en el plano
plot(P(1,1),P(2,1),'^r')
plot(P(1,2),P(2,2),'sr')
plot(P(1,3),P(2,3),'sr')
plot(P(1,4),P(2,4),'sb')
%Creamos un vector de -2 a 2 con un incremento de .1
x=-2:.1:2;
%Asignamos a m los valores finales de los pesos
m=-W(1,1), W(1,2)
%Con esta función se crea la frontera de decisión para clasificar
y = m*x+(-b/W(1,2));
%Graficamos la frontera de decisión
plot(x,y)
hold off;

