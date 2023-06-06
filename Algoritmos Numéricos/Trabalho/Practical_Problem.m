fprintf("Problema Pratico: : Use todos os métodos de resoluç˜ao de uma EDO da parte teórica deste trabalho para determinar a tens˜ao Vc(t).")

Vac= @(t) abs(18*cos(120*pi*t));
Vc_rms= @(t,v) ifelse(v<=Vac(t)-2, (25*Vac(t)-50.1-25*v)/100e-6, -0.1/(100e-6));
Vct = @(t,v) Vc_rms(t,v);


x0 = 0;
y0 = 16;
h = 1/200000;
n = 10000;

[T_e,Y_e] = Euler(Vct,x0,y0, h, n);
[T_eme,Y_eme] = EulerMelhorado(Vct,x0,y0, h, n);
[T_emo,Y_emo] = EulerModificado(Vct,x0,y0, h, n);
[T_fb12,Y_fb12] = Fehlberg12(Vct,x0,y0, h, n);
[T_fb45,Y_fb45] = Fehlberg45(Vct,x0,y0, h, n);
passofixo=true;
[T_DPfixo,Y_DPfixo] = RungeKutta_Dormand_Prince_ode45(Vct,x0,y0, h, n, passofixo);
passofixo=false;
[T_DPadpt,Y_DPadpt] = RungeKutta_Dormand_Prince_ode45(Vct,x0,y0, h, n, passofixo);


figure;
plot(T_e,Y_e,'-b','markersize',1,  T_eme,Y_eme,'-k','markersize',1,  T_emo,Y_emo,'-m','markersize',1,  T_fb12,Y_fb12, '-g','markersize',1,T_fb45,Y_fb45,'-w','markersize',1, T_DPfixo,Y_DPfixo,'-c','markersize',1,  T_DPadpt,Y_DPadpt,'-r','markersize',1);                  
title("Fonte DC",'fontsize',15)
axis([0 0.05 0 20]);
xlabel('t(s)','fontsize',15);
ylabel('Vc(t)[V]','fontsize',15);
legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
hold on;
grid on;