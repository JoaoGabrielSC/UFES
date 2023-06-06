clc
close all;

%carregando o pacote de dados
load('Te_Motor.mat');
load('wr_Motor.mat');

%plotando o grafico

plot(wr(2,:),Te(2,:))