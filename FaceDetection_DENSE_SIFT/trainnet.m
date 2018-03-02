% Chuong trinh nay dung de tao ra file net chua cac thong tin cua du lieu da duoc
% huan luyen. 

clc
clear all
close all
%% load thong tin database
load imgdb.mat   
%% tien hanh huan luyen
fprintf('Dang huan luyen du lieu ....\n');
T = cell2mat(IMGDB(2,:));
P = cell2mat(IMGDB(3,:));
%% kiem tra ket qua
net = svmtrain(P',T');
fprintf('So luong Support Vectors: %d\n',size(net.SupportVectors,1));
classes = svmclassify(net,P');
fprintf('So loi xay ra doi voi du lieu %d \n',sum(abs(classes-T')))
fprintf('done. \n');
%% luu du lieu
save net net
NET = net;