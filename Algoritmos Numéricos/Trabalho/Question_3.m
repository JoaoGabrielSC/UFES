
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