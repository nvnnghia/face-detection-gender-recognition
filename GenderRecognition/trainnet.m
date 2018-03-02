% Chuong trinh nay dung de tao ra file net chua cac thong tin cua du lieu da duoc
% huan luyen. 

clc
clear all
close all
% load thong tin database
load imgdbHOG1.mat   
%tien hanh huan luyen

fprintf('Creating & training the machine ->\n');
T = (cell2mat(IMGDBHOG1(2,:)));
P = (cell2mat(IMGDBHOG1(3,:)));
%kiem tra ket qua
netHOG1 = svmtrain(P',T');
fprintf('Number of Support Vectors: %d\n',size(netHOG1.SupportVectors,1));
classes = svmclassify(netHOG1,P');
fprintf('number of mistake with the training data. %d \n',sum(abs(classes-T')))
fprintf('done. \n');
%luu du lieu
save netHOG1 netHOG1
NET = netHOG1;