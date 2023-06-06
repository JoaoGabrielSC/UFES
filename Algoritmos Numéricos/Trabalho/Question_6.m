
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
  