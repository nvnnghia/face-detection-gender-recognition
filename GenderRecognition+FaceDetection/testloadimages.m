% File nay tai du lieu (face va non face) sau do luu toan bo du lieu lai duoi dang file mat
% Moi anh duoc luu lai voi 3 thong tin la: duong dan toi anh, label (face: 1, nonface: 0), va vecto dac trung cho anh do.

clc
close all
clear all
%% Khai bao thong tin database 
face_folder= 'face\';
non_face_folder= 'nonface\';
so_face= 613; % number of face
so_non_face= 1200; % number of nonface
IMGDB= cell(3,[]); % image database use to save image infomation
fprintf('\nTai anh khuon mat');
 %% Tai anh khuon mat
 for k=1:so_face
    string= strcat(face_folder,num2str(k),'.png');
    image= imread(string);
    try
    image=rgb2gray(image);
    end
    fprintf('+'); % tracking
    IM {1} = im2vec1 (image);    % ORIGINAL FACE IMAGE
    IM {2} = im2vec1 (fliplr(image));    % MIRROR OF THE FACE 
   for i=1:2
        IMGDB {1,end+1}= string; %duong dan toi anh
        IMGDB {2,end} = 1;    %1: face/ 0:non_face
        IMGDB (3,end) = {(IM{i})'};    %size, double  
   end
 end
 %% Tai anh khong phai khuon mat
 fprintf('\nTai nhung anh khong phai khuon mat');
 for k=1:so_non_face
     string= strcat(non_face_folder,num2str(k),'.png');
     image= imread(string);
     try
     image=rgb2gray(image);
     end
     fprintf('-');
     IM{1}= im2vec1(image);
     IM {2} = im2vec1 (fliplr(image));
     IM {3} = im2vec1 (flipud(image));
     IM {4} = im2vec1 (flipud(fliplr(image)));  
     for i=1:4
        IMGDB {1,end+1}= string;
        IMGDB {2,end} = 0; %1: face/ 0:non_face
        IMGDB (3,end) = {(IM{i})'};
     end
 end
    fprintf('\n');
%% save result
 save imgdb IMGDB;
 

 
