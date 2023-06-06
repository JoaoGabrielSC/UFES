% Maquinas Eletricas 
% João Gabriel Santos Custodio, Vinicius Robaski Mondadori, Gabriel Campos
% Questao 1
% i. Calcular a potência de saída máxima do gerador em MW.
%ii. Plotar a corrente de campo do gerador [A] em função da sua potência
%de saída [MW].
%iii. Plotar potência reativa de saída do gerador [Mvar] em função da
%potência de saída do gerador [MW].


% ----------------------------------------------------------------------------------------------------------------------------------------
clc
Ia_nominal = (550e6/26e3); %corrente do terminal do gerador
Ia_n = 1:(21154/2350):21154; %vetor corrente de terminal de 0 a nominal
Vt = 1.012;
Vbarramento = 1;
Xbarramento = 0.35;
Xeqt = 2.02;
Xs = 1.67;
n_delta = 1:101;
delta = (pi/2)*(n_delta-1)/100;
Ia = (Vt *exp(j*delta) - Vbarramento)/(j*(Xs + Xbarramento));
Va = (Vbarramento + j*Xbarramento*Ia);
P = real(Va.*conj(Ia));
ifa = 1:1:2350; %(corrente de campo)
N = 2350;
a =0;
b = 0;
for n = 1:N
 if (a <= ifa(n) || b <= Ia_nominal(n) )
 PMAX = P(n_delta);
 m = n_delta;
 a=a+1;
 b=b+1;
 end
end

PMAX = 395;
