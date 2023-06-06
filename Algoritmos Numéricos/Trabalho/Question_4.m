
fprintf ('\n\nSolução da Questão 4 : Calcule as aproximações da solução analítica, usando os seguintes métodos:\n\n'); 


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

