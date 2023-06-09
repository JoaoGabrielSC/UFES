% function [Y,t,Yr,tau] = arduino_coleta_rc(obj,U0,Tempo)
% Coleta de dados do circuito RC
% Data: 20/9/2022
% Mac
function [Y,t,Yr,tau] = arduino_coleta_rc(obj,U0,Tempo)
Ts=10;

Y=[];
t=[];
Yr=[];
tau=[];

if (min(U0)<0)|(max(U0)>255)
    disp('U0 deve ser maior que zero e menor que 255');
    beep;
    return;
end


N=floor(Tempo*1000/Ts);
if (N>1000)
    ss=sprintf('Tempo máximo para este valor de Ts em segundos: %d',Ts);
    disp(ss);
    beep;
    return;
end

for k=1:length(U0)
    comando=sprintf('%s;%s;','1','1',num2str(round(Tempo,0)),num2str(round(U0(k),0)));
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
    if (k==1)
        y0=mean(y(1:2));
    else
        y0=mean(Y((end-5):end));
    end
    yn=y-y0;
    tau(k)=(Ts/1000)*sum(yn<0.63*yn(end));
    Y=[Y;y];
    Yr=[Yr;mean(y((end-10):end))];
end
t=((1:length(Y))-1)*Ts/1000;

if nargout==0
    stairs(t,Y);
    yline(U0,'r','LineWidth',3);
    xlabel('Tempo(s)');
    ylabel('Resposta');
end

end

