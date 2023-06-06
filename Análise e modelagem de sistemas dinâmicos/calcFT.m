clear; clc; close all;

%% Determinação da FT de malha fechada Gmf e de malha aberta Gp - Fórmula de Mason
syms c1 c2 c3 delta1 delta2 delta3;
syms L1 L2 L3;
syms s A B C Ki Kb Kp Kd;
syms La Ra Jm beta m g;

N=2;

A = (1/(La*s+Ra));

B = (1/(Jm*s+beta));

C = (m*g)/((m*s^2)+(beta*s));

L1 = (Kp+s*Kp)*A*Ki*B*(-Kb);
L2 = (B*C*m*g)/s;
C1 = (Kp+s*Kd)*((A*Ki*B*C)/s);
delta1=1;

FT_Mfechada = (C1*delta1)/(1-(L1+L2));

subsFT_Mfechada = subs(FT_Mfechada,{La,Ra,Jm,beta,m,g,Ki,Kb}, ...
    {0.1*N,20/N,N,20/N,sqrt(1/N),9.8,20/N,0.1*N});

[num,den]=numden(subsFT_Mfechada);

% disp(coeffs(den,s));
% disp(den);

Gp = (1/(Kp+s*Kd))*((subsFT_Mfechada)/(1-subsFT_Mfechada));
% desconsiderando os distúrbios, pode-se encontrar a função de 
% transferência em malha aberta.

[numGp,denGp] = numden(Gp);

% disp(coeffs(denGp,s));
disp(numGp);
disp(denGp);

