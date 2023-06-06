% function [] = seta_saida_motor(obj,U0)
%   20/09/2022
% Seta a saída PWM do circuito RC para o valor U0:
%
function [] = seta_saida_motor(obj,U0)
comando=sprintf('0;0;1;%d;',round(U0,0));
fprintf(obj,'%s',comando)
pause(2); % Aguardar os delays para circuito RC entrar em regime
end