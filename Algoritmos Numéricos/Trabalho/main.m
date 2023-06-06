%%%%                                                  NOTAS DE ATUALIZAÃ‡ÃƒO!!!
%%%%
%%%%         FINALIZADA!!!
%%%%         CADA QUESTÃƒO FOI ADICIONADA COMO UM SCRIPT PRÃ“PRIO PRA FACILIAR O TRABALHO
%%%%         MELHORIA NA VIZUALIZAÃ‡ÃƒO E PLOTAGEM DO CODIGO
%%%%         ADICIONADA FUNÃ‡ÃƒO Practical_Problem 
%%%%

fprintf('SoluÃ§Ã£o da QuestÃ£o 1 : Determine a soluÃ§Ëœao analÃ­tica y(x) de cada PVI. \n\n');

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*log(x+1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*(x**2 -1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 
[f, sol, PVIstr] = solveEDO('1-(y/x)', 0, 1) 


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSoluÃ§Ã£o da QuestÃ£o 2 : Converta a soluÃ§Ëœao em uma funÃ§Ã£o nËœao-simbÃ³lica.\n\n');


[~, ~, ~, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\



fprintf ('\n\nSolução da Questão 3 : Discretize a variável independente a partir de x0, calcule o valor da funç˜ao analítica e desenhe:.\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
  
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end
  plot(xx,Y_a,'--*k', xx,A_a,'-r',  xx,B_a,'--b','linewidth',2,  xx,C_a,'--y','linewidth',2,  xx,D_a,'--*d',  xx,E_a,'--g','linewidth',3, X_adpt_a, F_adpt_a,'--*m');
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;
  
  
%%%_ - _ - __ - _ - __ - _ - _Segunda Função_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure
  plot(xx,Y_b,'--*k', xx,A_b,'-r',  xx,B_b,'--b','linewidth',2,  xx,C_b,'--y','linewidth',2,  xx,D_b,'--*d',  xx,E_b,'--g','linewidth',3, X_adpt_b, F_adpt_b,'--*m');
  title("PVI : y’=y*(x²-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;


%%%% _ - _ - __ - _ - __ - _ - _Terceira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end
  figure
  plot(xx3,Y_c,'--*k', xx3,A_c,'-r',  xx3,B_c,'--b','linewidth',2,  xx3,C_c,'--y','linewidth',2,  xx3,D_c,'--*d',  xx3,E_c,'--g','linewidth',3, X_adpt_c, F_adpt_c,'--*m');
  title("PVI : y’=1-y/x, com x0=1,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;
  hold off;
  
%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSoluÃ§Ã£o da QuestÃ£o 4 : Calcule as aproximaÃ§Ãµes da soluÃ§Ã£o analÃ­tica, usando os seguintes mÃ©todos:\n\n'); 


func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO 


x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
x0_c = 1;
y0_c = 1;
f = '%8.6f';


fprintf('\n\nFuncao: y(x)= (x + 1) .* exp (x .* (log (x + 1) - 1))\n\n')


[X, Y] = Euler(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


fprintf('\n\nFuncao: y(x)= exp (x .* (x .^ 2 - 3) / 3)\n\n')


[X, Y] = Euler(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


fprintf('\n\nFuncao: y(x)= x / 2\n\n')


[X, Y] = Euler(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0_c, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0_c, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\




fprintf ('\n\nSolução da Questão 5 : Insira os pontos (xi, yi) de cada método no gráfico junto com a funç˜ao verdadeira y(x) :\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %Solução analitica não simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%Solução analitica não simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %Solução analitica não simbolica terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  x = 0:0.1:1;
  xx3 = 1:0.1:2;
  
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end
  
  figure
  plot(x,funcv1(X),'--m','linewidth',3,x,Y_a,'*-k', x,A_a,'-r','linewidth',2,  x,B_a,'-db',  x,C_a,'--py','linewidth',2,  x,D_a,'*d',  x,E_a,'+g','linewidth',2, X_adpt_a, F_adpt_a,'-oc');
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('y(x)=(x + 1) .* exp (x .* (log (x + 1) - 1)','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;


%%%_ - _ - __ - _ - __ - _ - _Segunda Função_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure
  plot(x,funcv2(x),'--m','linewidth',3,x,Y_b,'*-k', x,A_b,'-r','linewidth',2,  x,B_b,'-db',  x,C_b,'--py','linewidth',2,  x,D_b,'*d',  x,E_b,'+g','linewidth',2, X_adpt_b, F_adpt_b,'-oc');
  title("PVI : y’=y*(x²-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('y(x)= exp (x .* (x .^ 2 - 3) / 3)','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;


%%%% _ - _ - __ - _ - __ - _ - _Terceira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end

figure
plot(xx3,funcv3(xx3),'--m',xx3,Y_c,'--*k', xx3,A_c,'-r',  xx3,B_c,'--b','linewidth',2,  xx3,C_c,'--y','linewidth',2,  xx3,D_c,'--*d',  xx3,E_c,'--g','linewidth',3, X_adpt_c, F_adpt_c,'-oc');
title("PVI : y’=1-y/x, com x0=1,y0=0",'fontsize',20)
xlabel('x','fontsize',20);
ylabel('y','fontsize',20);
grid on;
legend('y(x)= x / 2','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
hold on;
  
  
  
  
%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\




fprintf ('\n\nSolução da Questão 6 : Gere um no gráfico de erros de cada método relativo à funç˜ao verdadeira y(x), com eixo y logarítmic:.\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %Solução analitica não simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%Solução analitica não simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %Solução analitica não simbolica terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  x = 0:0.1:1;
  xx3 = 1:0.1:2;
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end

  figure
  semilogy(x,funcv1(X)-Y_a,'*-k', x,funcv1(X)-A_a,'-r','linewidth',2,  x,funcv1(X)-B_a,'-db',  x,funcv1(X)-C_a,'--py','linewidth',2,  x,funcv1(X)-D_a,'*d',  x,funcv1(X)-E_a,'-+g', X_adpt_a, funcv1(X_adpt_a)-F_adpt_a,'-oc'); 
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;


%%%_ - _ - __ - _ - __ - _ - _Segunda Função_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end

  figure
  semilogy(x, abs(funcv2(X)-Y_b),'*-k', x,abs(funcv2(X)-A_b),'-r','linewidth',2,  x,abs(funcv2(X)-B_b),'-db',  x,abs(funcv2(X)-C_b),'--py','linewidth',2,  x,abs(funcv2(X)-D_b),'*d',  x,abs(funcv2(X)-E_b),'-+g', X_adpt_b,abs(funcv2(X_adpt_b)-F_adpt_b),'-oc');    
  title("PVI : y’=y*(x²-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;
 

%%%% _ - _ - __ - _ - __ - _ - _Terceira Função_ - _ - __ - _ - __ - _ - _


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end

  figure
  semilogy(xx3,funcv3(x)-Y_c,'-*k', xx3,funcv3(x)-A_c,'-r','linewidth',2,  xx3,funcv3(x)-B_c,'-db',  xx3,funcv3(x)-C_c,'--py',  xx3,funcv3(x)-D_c,'*d',  xx3,funcv3(x)-E_c,'-+g', X_adpt_c, funcv3(X_adpt_c)-F_adpt_c,'-oc');  
  title("PVI : y’=1-y/x, com x0=1,y0=0",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on
  
  
  
%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\

 

printf ('\n\n\nSoluÃ§Ã£o da QuestÃ£o 7 e 8: Mostre uma tabela com os valores de cada método e seus erros respectivamente: \n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %SoluÃ§Ã£o analitica nÃ£o simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%SoluÃ§Ã£o analitica nÃ£o simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %SoluÃ§Ã£o analitica nÃ£o simbolica terceira EDO


  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
 

%%%_ - _ - __ - _ - __ - _ - _Primeira FunÃ§Ã£o_ - _ - __ - _ - __ - _ - _

 
fprintf('PVI: ===> Funcao: y(x)= (x + 1) .* exp (x .* (log (x + 1) - 1))\n\n')
fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('-----------------------------------------------------------------------------------------------------------------\n');


for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx(i), funcv1(X(i)), Y_a(i), A_a(i), B_a(i), C_a(i), D_a(i), E_a(i));
end


fprintf('\nErros\n\n');


for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx(i), abs(funcv1(X(i))-funcv1(X(i))), abs(funcv1(X(i))-Y_a(i)), abs(funcv1(X(i))-A_a(i)), abs(funcv1(X(i))-B_a(i)), abs(funcv1(X(i))-C_a(i)), abs(funcv1(X(i))-D_a(i)), abs(funcv1(X(i))-E_a(i)));
end


%%%_ - _ - __ - _ - __ - _ - _Segunda FunÃ§Ã£o_ - _ - __ - _ - __ - _ - _


fprintf('\n\n\nPVI: ===> Funcao: y(x)= exp (x .* (x .^ 2 - 3) / 3)\n\n');
fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('-----------------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx(i), funcv2(X(i)), Y_b(i), A_b(i), B_b(i), C_b(i), D_b(i), E_b(i));
end


fprintf('\nErros\n\n');


for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
	fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx(i), abs(funcv2(X(i))-funcv2(X(i))), abs(funcv2(X(i))-Y_b(i)), abs(funcv2(X(i))-A_b(i)), abs(funcv2(X(i))-B_b(i)), abs(funcv2(X(i))-C_b(i)), abs(funcv2(X(i))-D_b(i)), abs(funcv2(X(i))-E_b(i)));
end



%%%% _ - _ - __ - _ - __ - _ - _Terceira FunÃ§Ã£o_ - _ - __ - _ - __ - _ - _


fprintf('\n\nPVI: ===> Funcao: y(x)= x / 2\n\n');
fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('------------------------------------------------------------------------------------------------------------------\n');


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx3(i), funcv3(X(i)), Y_c(i), A_c(i), B_c(i), C_c(i), D_c(i), E_c(i));
end


fprintf('\nErros\n\n');


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
	fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx3(i), abs(funcv3(X(i))-funcv3(X(i))), abs(funcv3(X(i))-Y_c(i)), abs(funcv3(X(i))-A_c(i)), abs(funcv3(X(i))-B_c(i)), abs(funcv3(X(i))-C_c(i)), abs(funcv3(X(i))-D_c(i)), abs(funcv3(X(i))-E_c(i)));
end



%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\



fprintf("\n\nProblema Pratico: : Use todos os métodos de resoluç˜ao de uma EDO da parte teórica deste trabalho para determinar a tens˜ao Vc(t).")

Vac= @(t) abs(18*cos(120*pi*t));
Vc_rms= @(t,v) ifelse(v<=Vac(t)-2, (25*Vac(t)-50.1-25*v)/100e-6, -0.1/(100e-6));
Vct = @(t,v) Vc_rms(t,v);


x0 = 0;
y0 = 16;
h = 1/200000;
n = 10000;


[T_e,Y_e] = Euler(Vct,x0,y0, h, n);
[T_eme,Y_eme] = EulerMelhorado(Vct,x0,y0, h, n);
[T_emo,Y_emo] = EulerModificado(Vct,x0,y0, h, n);
[T_fb12,Y_fb12] = Fehlberg12(Vct,x0,y0, h, n);
[T_fb45,Y_fb45] = Fehlberg45(Vct,x0,y0, h, n);
passofixo=true;
[T_DPfixo,Y_DPfixo] = RungeKutta_Dormand_Prince_ode45(Vct,x0,y0, h, n, passofixo);
passofixo=false;
[T_DPadpt,Y_DPadpt] = RungeKutta_Dormand_Prince_ode45(Vct,x0,y0, h, n, passofixo);


figure;
plot(T_e,Y_e,'-b','markersize',1,  T_eme,Y_eme,'-k','markersize',1,  T_emo,Y_emo,'-m','markersize',1,  T_fb12,Y_fb12, '-g','markersize',1,T_fb45,Y_fb45,'-w','markersize',1, T_DPfixo,Y_DPfixo,'-c','markersize',1,  T_DPadpt,Y_DPadpt,'-r','markersize',1);                  
title("Fonte DC",'fontsize',15)
axis([0 0.05 0 20]);
xlabel('t(s)','fontsize',15);
ylabel('Vc(t)[V]','fontsize',15);
legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
hold on;
grid on;




