% Chuong trinh nay dung de tao ra file net chua cac thong tin cua du lieu da duoc
% huan luyen. 

clc
clear all
close all
% load thong tin database
load imgdb.mat   
%tien hanh huan luyen
fprintf('Creating & training the machine ->\n');
T = cell2mat(IMGDB(2,:));
P = cell2mat(IMGDB(3,:));
%kiem tra ket qua
net2 = svmtrain(P',T');
fprintf('Number of Support Vectors: %d\n',size(net2.SupportVectors,1));
classes = svmclassify(net2,P');
fprintf('number of mistake with the training data. %d \n',sum(abs(classes-T')))
fprintf('done. \n');
%luu du lieu
save net2 net2
NET = net2;