%%% https://en.wikipedia.org/wiki/List_of_Runge–Kutta_methods#Gauss–Legendre_methods
%%% Implementing an RK 1(2) Algorithm

function [X, Y] = Fehlberg12(f, x0, y0, h, n )

%%% The Fehlberg method has two methods of orders 1 and 
%%% 
%%% 0   |  0       0       0
%%% 1/2 | 1/2      0       0
%%% 1   |1/256  255/256    0
%%% -------------------
%%%     |1/512  255/256  1/512 
%%%     |1/256  255/256    0

    butcher.isEmbedded = false;
    s = 3; 
    butcher.a = zeros(s,s);
    butcher.a(2,1) = 0.5;
    butcher.a(3,1) = 1.0/512; butcher.a(3,2) = 255.0/256;
    butcher.b = [1.0/512 255.0/256 1.0/512];
    butcher.bstar = [1.0/256 255.0/256 0];
    butcher.c = [0 0.5 1];
    %fprintf('Butcher tableau for Fehlberg's 1(2) method:\n');
    [X, Y] = RungeKutta(f, x0, y0, h, n, butcher, s );
end	
