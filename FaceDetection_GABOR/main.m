% Chuong trinh nay dung de tien hanh qua trinh phat hien khuon mat
 
clear all;
close all;
clc;
tic
%% chon anh de tien hanh test
[file_name, file_path] = uigetfile ('*.jpg');
%% Tien hanh quet toan bo anh de tim vi tri cac khuon mat trong anh
% mot khuon mat co the bi luu voi nhieu vi tri khac nhau
if file_path ~= 0
    im = imread ([file_path,file_name]);
    imout= imscan (im);
end
%% Loai bo cac vung co the bi phat hien sai vi so diem duoc phat hien duoc it hon mong muon
% Ngoai ra con ket hop cac diem gan nhau lai de tranh phat hien mot khuon mat nhieu lan
se1 = strel('square',1);
se = strel('disk',3,8);
se2 = strel('disk',8,8);
imout1 = imopen(imclose(imout,se),se1);
imout1 = imclose(imout1,se2);
%% Luu cac vi tri cho tung khuon mat (mot khuon mat chi luu voi mot toa do nhat dinh)
FaceCoord = [];
[L,numobj] = bwlabel(imout1,8);
for i=1:numobj
[x,y] = find(L == i);
bwsegment = bwselect(imout1,y,x,8);
if(sum(sum(bwsegment))>1)
[xCoord, yCoord] = region_center(bwsegment);
RectCoord = [xCoord-15 yCoord-15 30 30];
FaceCoord = [FaceCoord; RectCoord];
end
end
%% Hien thi ket qua, Danh khung vao cac khuon mat da phat hien duoc
figure;
imshow(im);
[numfaces, x] = size(FaceCoord);
 for i=1:numfaces
   hd = rectangle('Position',FaceCoord(i,:));
   set(hd, 'edgecolor', 'w');
 end;
 toc   
