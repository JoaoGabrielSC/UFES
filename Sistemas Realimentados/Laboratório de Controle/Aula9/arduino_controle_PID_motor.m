% function [y,u,t] = arduino_controle_PID_motor(obj,Ref,Tempo, Kp,Ki,Kd)
% Controle do motor CC usando controlador PI 
% Data: 24/7/2022
%
function [y,u,t] = arduino_controle_PID_motor(obj,Ref,Tempo, Kp,Ki,Kd)
Ts=20;
y=[];
u=[];
t=[];

if (Ref<0)|(Ref>7000)
    disp('Ref deve ser maior que zero e menor que 7000');
    beep;
    return;
end

N=Tempo*1000/Ts;
if (N>1000)
    ss=sprintf('Tempo máximo para este valor de Ts em segundos: %d',Ts);
    disp(ss);
    beep;
    return;
end

if (Kp<=0)
    disp('Kp deve ser maior que zero (estar no SPE)');
    beep;
    return;
end

if (Ki<=0)
    disp('Ki deve ser maior que zero (estar no SPE)');
    beep;
    return;
end

% if (Kd<=0)
%     disp('Kd deve ser maior que zero (estar no SPE)');
%     beep;
%     return;
% end

Tf=1/50; % Filtro do derivativo
C=tf([Kp*Kd Kp+Kp*Ki*Tf Kp*Ki],[Tf 1 0]);
Cd=c2d(C,Ts/1000);
b1=num2str(round(10000*Cd.Num{1}(1),0));
b2=num2str(round(10000*Cd.Num{1}(2),0));
b3=num2str(round(10000*Cd.Num{1}(3),0));
a1=num2str(round(10000*Cd.Den{1}(2),0));
a2=num2str(round(10000*Cd.Den{1}(3),0));


comando=sprintf('%s;%s;%s;%s;%s;%s;%s;','3','0',num2str(round(Tempo,0)),num2str(round(Ref,0)),b1,b2,b3,a1,a2);
fprintf(obj,'%s',comando);
pause(2)

y=[];
i=1;
y(i,1)=fscanf(obj,'%f');
while (y(i)~=10000)
    i=i+1;
    y(i,1)=fscanf(obj,'%f');
end;
y(end)=[];


u=[];
i=1;
u(i,1)=fscanf(obj,'%f');
while (u(i)~=10000)
    i=i+1;
    u(i,1)=fscanf(obj,'%f');
end;
u(end)=[];


t=((1:length(y))-1)*Ts/1000;

if nargout==0
    stairs(t,y);hold on;
    stairs(t,u);hold off; shg
    yline(Ref,'r','LineWidth',3);
    legend('Y','U', 'Ref');
end

end
