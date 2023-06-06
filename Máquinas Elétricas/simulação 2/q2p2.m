clc;
Ef_nom = 33862.68;                  %Tensão nominal de excitação [V]
V_barramento = 26e3;                %Tensão constante do barramento infinito [V]
V_t = 26.3e3;                       %Tensão constante no terminal do gerador [V]
X_barramento = 1i*0.43;             %Impedancia indutiva do barramento [Ohm]
X_s = 1i*2.05;                      %Reatancia sincrona em Ohms (transformada de pu no documento) 
X_eq = X_s + X_barramento;          %Impedancia equivalente [Ohm]
Ifa = 0:1:2350;                     %Vetor Corrente de campo [A]
D = 62.16.*pi/180;                  %Delta, angulo entre Ef e Vt [rad/s]

%Do circuito equivalente para esse problema, a equaçao para Ef é explicita abaixo
Ef = Ifa*(X_eq)+ V_barramento; 

%Como esperado, Ef está variando linearmente em relação a Ifa
%Calculo para o angulo delta variar diretamente com a variação de Ef,aumentando Pout
delta = asin((Ef_nom ./Ef ).*sin(D));

%calculando o valor Ef na forma polar
Ef = Ef .*(cos(delta)+ 1i*sin(delta));
x_eq_abs = 2.48; % Valor da impedancia equivalente em módulo.


%Calculando as potencias em função de Ifa
%Potencia ativa
P = (sqrt(3).*V_t ./x_eq_abs) .*Ef .*sin(delta);
%Potencia Reativa
Q = (sqrt(3).*V_t ./x_eq_abs) .*Ef .*cos(delta) -3*power(V_t,2)/x_eq_abs;


%ferramenta para plotagem
close all;

figure(1);  %Figura 1 gráfico Potencia de saida x Corrente de campo
plot(P, Ifa);
grid on;
hold on;

figure(2); %Figura 2 gráfico Potencia de saida x Potência reativa
plot(P, Q);
grid on;
hold on;





