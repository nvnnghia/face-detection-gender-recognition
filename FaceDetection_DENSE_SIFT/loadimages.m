% File nay tai du lieu (face va non face) sau do luu toan bo du lieu lai duoi dang file mat
% Moi anh duoc luu lai voi 3 thong tin la: duong dan toi anh, label (face: 1, nonface: 0), va vecto dac trung cho anh do.

clc
close all
clear all
%% Khai bao thong tin database 
face_folder= 'face\';
non_face_folder= 'nonface\';
so_face= 141; % so face
so_non_face= 846; % so non face
IMGDB= cell(3,[]); % image database dung de luu thong tin du lieu
fprintf('\nTai anh khuon mat');
 %% Tai anh khuon mat
 for k=1:so_face
    string= strcat(face_folder,num2str(k),'.png');
    image= imread(string);
    try
    image=rgb2gray(image);
    end
    fprintf('+'); % theo doi qua trinh load du lieu
    IM {1} = im2vec (image);    % vecto dac trung cua anh goc
    IM {2} = im2vec (fliplr(image));    % vector dac trung cho anh doi xung truc 
   for i=1:2
        IMGDB {1,end+1}= string; %duong dan toi anh
        IMGDB {2,end} = 1;    %1: face/ 0:non_face
        IMGDB (3,end) = {(IM{i})'};    %luu cac vector dac trung lai 
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
     IM{1}= im2vec(image);
     IM {2} = im2vec (fliplr(image));
     IM {3} = im2vec (flipud(image));
     IM {4} = im2vec (flipud(fliplr(image)));  
     for i=1:4
        IMGDB {1,end+1}= string;
        IMGDB {2,end} = 0; %1: face/ 0:non_face
        IMGDB (3,end) = {(IM{i})'};
     end
 end
    fprintf('\n');
%% Luu ket qua
 save imgdb IMGDB;
 

 
