
clear all;

addpath(['../' 'util'], ['../' 'edo']);

is_octave = (exist('OCTAVE_VERSION','builtin')>1); % Octave ou Matlab
if is_octave
    available_graphics_toolkits();
    graphics_toolkit gnuplot;
	pkg load symbolic;	% Carregar bibliotéca simbólica
end;

% Declararção das variáveis simbólicas
syms y(x)


if 1	% 1=Use 0=Não use
func = @(x) exp (x .* (x .^ 2 - 3) / 3);
edostr = '\n\nTesteee\n\n';
x0 = 0; y0 = 1; h = 0.1; n = 1;
ode = diff(y, x) == y;
end


if 0	% 1=Use 0=Não use
func = @(x) exp (x .* (x .^ 2 - 3) / 3);
edostr = '\n\nTesteee\n\n';
x0 = 0; y0 = 1; h = 0.1; n = 1;
ode = x * diff(y, x) == x-y;
end


fprintf('EDO: '); ode


cond = y(x0)==y0;
fprintf('Condicao inicicial: '); cond

sol = dsolve(ode, cond);
fprintf('Solucao: '); sol


if iscell(sol)
	sol = sol{1};
else
	sol = sol;
end
if is_octave
	F = rhs(sol);
else
	F = sol;
end
yx = matlabFunction(F);
fprintf('Versao numerica da solucao: '); yx




x = -1:0.01:3;


clf
hold on
plot(x,yx(x),'-k');
axis([-1 3 -1 9]);
leg = {'y(x)'};
title(edostr);


%

[X,Y] = Euler(func, x0, y0, h, n )
printTabXY( X, 'X', Y, 'Y', '%.5e', 'Euler' );
printTabXY( X, 'X', yx(X)-Y, 'Erro', '%.5e', 'ERRO: Euler' );

[X,YMel] = EulerMelhorado(func, x0, y0, h, n )
printTabXY( X, 'X', Y, 'Y', '%.5e', 'Euler Melhorado' );
printTabXY( X, 'X', yx(X)-Y, 'Erro', '%.5e', 'ERRO: Euler Melhorado' );

