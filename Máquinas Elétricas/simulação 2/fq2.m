%script para controle a fluxo constante
clc;

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Controle com fluxo constante
E1 = 0:23:460;
f1 = 0:3:60;
%parametros de placa do motor
w_nom = 1780; %[rpm]
polo = 6;
L_1 = 0.000867; 
L_2 = 0.000867;
R_1 = 0.09961;
R_2 = 0.05837;
L_m = 0.03039;
W = 4*pi*f1 ./polo;                                        %Velocidade atual
W_rpm = W.*9.549296585514;
X1 = L_1*W;
X2 = L_2*W;
Torque = polo/(4*pi)*((E1 ./f1).^2) .*(1./(4*pi*L_2));    %Torque em função da Tensão E1 e frequencia f1                                                        
s = (w_nom - W_rpm) ./w_nom;
K = ((R_1+R_2./s).^0.5 + (X1+X2).^0.5).^0.5;
I_r = E1 ./K;

%plot
%Torque x velocidade 
figure(1);  
plot(W_rpm, Torque);
grid on;
hold on;

%Corrente x velocidade
figure(2);  
plot(W_rpm, I_r);
grid on;
hold on;




