%% 0.0 - Declaração de variáveis importantes.
clear ; close all; clc

N = 2;
syms alfa beta gama;
syms x1 x2 x3 u1 u2 dx1 dx2 dx3 du1 du2;
syms f1(x1,x2,x3,u1,u2) f2(x1,x2,x3,u1,u2) f3(x1,x2,x3,u1,u2)

f1(x1,x2,x3,u1,u2) = -(alfa)*x1 - (beta)*x1*x2 + u1;
f2(x1,x2,x3,u1,u2) = -(gama)*x2 - (beta)*x1*x2 + u2;
f3(x1,x2,x3,u1,u2) = (alfa)*x1 + (gama)*(x2^2);

%% 0.1 - Linearizando funções de interesse.

syms g1(x1,x2,x3,u1,u2) g2(x1,x2,x3,u1,u2) g3(x1,x2,x3,u1,u2);

g1(x1,x2,x3,u1,u2) = diff(f1,x1)*dx1 + diff(f1,x2)*dx2 + diff(f1,x3)*dx3 + diff(f1,u1)*du1 + diff(f1,u2)*du2;
g2(x1,x2,x3,u1,u2) = diff(f2,x1)*dx1 + diff(f2,x2)*dx2 + diff(f2,x3)*dx3 + diff(f2,u1)*du1 + diff(f2,u2)*du2;
g3(x1,x2,x3,u1,u2) = diff(f3,x1)*dx1 + diff(f3,x2)*dx2 + diff(f3,x3)*dx3 + diff(f3,u1)*du1 + diff(f3,u2)*du2;

%% 0.2 - Ponto de equilíbrio citado:

syms r1(dx1,dx2,dx3,du1,du2) r2(dx1,dx2,dx3,du1,du2) r3(dx1,dx2,dx3,du1,du2);

x1_0 = 20/N;
u1_0 = x1_0;
u2_0 = x1_0;
x2_0 = x1_0;
x3_0 = N;

r1(dx1,dx2,dx3,du1,du2) = g1(x1_0,x2_0,x3_0,u1_0,u2_0);
r2(dx1,dx2,dx3,du1,du2) = g2(x1_0,x2_0,x3_0,u1_0,u2_0);
r3(dx1,dx2,dx3,du1,du2) = g3(x1_0,x2_0,x3_0,u1_0,u2_0);

A = [r1(1,0,0,0,0) r1(0,1,0,0,0) r1(0,0,1,0,0);r2(1,0,0,0,0) r2(0,1,0,0,0) r2(0,0,1,0,0);r3(1,0,0,0,0) r3(0,1,0,0,0) r3(0,0,1,0,0)];

B = [r1(0,0,0,1,0) r1(0,0,0,0,1);r2(0,0,0,1,0) r2(0,0,0,0,1);r3(0,0,0,1,0) r3(0,0,0,0,1)];

% Os estados x2 e x3 correspondem às saídas.
C = [0 1 0;0 0 1];

D = [0 0;0 0];
%% 1.1 - Verificar parâmetros para estabilidade do sistema.

syms s;

I = eye(3);

result = det(s*I-A);

poles = solve(result == 0, s);


%% 1.2 - Assumir valores requisitados para alfa, beta e gama e simular. 

Asub = double(subs(A,{alfa,beta,gama},{20/N,N,sqrt(N/10)}));

B = double(B);

t = 0:0.001:6;
length_t = length(t);

U = ones(length_t,2);

sys = ss(Asub,B,C,D);

x_0 = [x1_0 x2_0 x3_0];

y = lsim(sys,U,t,x_0);

figure();
lsim(sys,U,t,x_0)

figure();
sysd = c2d(sys, 0.01*N);
yd = dlsim(sysd.A,sysd.B,sysd.C,sysd.D,U,x_0); 
dlsim(sysd.A,sysd.B,sysd.C,sysd.D,U,x_0)
axis([0 200 0 10 0 10])

lsiminfo(y(:,1),t)
lsiminfo(yd(:,1),t)

lsiminfo(y(:,2),t)
lsiminfo(yd(:,2),t)



