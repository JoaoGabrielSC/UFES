% function [y,u,t] = arduino_controle_PI_rc(obj,Ref,Tempo, Kp,Ki)
% Controle do circuito RC usando controlador PI 
% Data: 10/04/2023
%
function [y,u,t] = arduino_controle_PI_rc(obj,Ref,Tempo, Kp,Ki)
Ts=20;
y=[];
u=[];
t=[];

if (Ref<=0)|(Ref>1023)
    disp('Ref deve ser maior que zero e menor que 1023');
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

% if (Ki<=0)
%     disp('Ki deve ser maior que zero (estar no SPE)');
%     beep;
%     return;
% end

if (Ki>0)
C=tf(Kp*[1 Ki],[1 0]);
Cd=c2d(C,Ts/1000);
b1=num2str(round(1000*Cd.Num{1}(1),0));
b2=num2str(round(1000*Cd.Num{1}(2),0));
a1=num2str(round(1000*Cd.Den{1}(2),0));
else
    b1=num2str(round(1000*Kp,0));
    b2=num2str(0);
    a1=num2str(0);
end

comando=sprintf('%s;%s;%s;%s;%s;%s;%s;','2','1',num2str(round(Tempo,0)),num2str(round(Ref,0)),b1,b2,a1);
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
    %yline(Ref,'r','LineWidth',3);
    line([0 max(t)],[Ref Ref],'Color','r','LineWidth',3);
    legend('Y','U', 'Ref');
end

end
