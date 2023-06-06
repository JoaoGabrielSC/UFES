
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
  