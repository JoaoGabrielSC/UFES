clc
close all;

%carregando o pacote de dados

load('Te_Motor.mat');
load('wr_Motor.mat');

plot( Te,wr, 'Te','wr' );
