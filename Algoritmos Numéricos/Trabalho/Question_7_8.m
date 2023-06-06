printf ('\n\n\nSolução da Questão 7 e 8: Mostre uma tabela com os valores de cada método e seus erros respectivamente: \n\n');


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
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
 

%%%_ - _ - __ - _ - __ - _ - _Primeira Função_ - _ - __ - _ - __ - _ - _

 
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


%%%_ - _ - __ - _ - __ - _ - _Segunda Função_ - _ - __ - _ - __ - _ - _


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



%%%% _ - _ - __ - _ - __ - _ - _Terceira Função_ - _ - __ - _ - __ - _ - _


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

