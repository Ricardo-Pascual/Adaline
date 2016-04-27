clear all; close all; clc;
P=[-1 -1 1 1;-1 1 -1 1]
T=[-1 -1 -1 1]
R=zeros(2,2)
for i=1:4
  R=R+1/4*(P(:,i)*P(:,i)')
end
valor = eig(R)
alpha=((1/2)*.49)
W=rand(1,2)*10;
b=rand(1)*10;

for epocas= 1:30
  for i=1:4
    a=purelin(W*P(:,i)+b)
    e=T(1,i)-a
    W=W+(alpha*e*P(:,i)')
    b=b+(alpha*e)
  end
end
alpha = alpha*.7
hold on
plot(P(1,1),P(2,1),'*r')
plot(P(1,2),P(2,2),'*r')
plot(P(1,3),P(2,3),'*r')
plot(P(1,4),P(2,4),'sb')
x=-2:.1:2
m=-W(1,1), W(1,2)
y = m*x+(-b/W(1,2));
plot(x,y)
