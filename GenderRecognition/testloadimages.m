% File nay tai du lieu (face va non face) sau do luu toan bo du lieu lai duoi dang file mat
% Moi anh duoc luu lai voi 3 thong tin la: duong dan toi anh, label (face: 1, nonface: 0), va vecto dac trung cho anh do.

clc
close all
clear all
%% Khai bao thong tin database 
face_folder= 'male\';
non_face_folder= 'female\';
so_face= 688; % number of face
so_non_face= 520; % number of nonface
IMGDBHOG1= cell(3,[]); % image database use to save image infomation
fprintf('\nTai anh nam');
 %% Tai anh khuon mat
 for k=1:so_face
    string= strcat(face_folder,num2str(k),'.png');
    image= imread(string);
    try
    image=rgb2gray(image);
    end
    fprintf('+'); % tracking
    IM {1} = im2vecHOG (image);    % ORIGINAL FACE IMAGE
    IM {2} = im2vecHOG (fliplr(image));
       % MIRROR OF THE FACE 
   for i=1:2
        IMGDBHOG1 {1,end+1}= string; %duong dan toi anh
        IMGDBHOG1 {2,end} = 1;    %1: face/ 0:non_face
        IMGDBHOG1 (3,end) = {(IM{i})'};    %size, double  
   end
 end
 %% Tai anh khong phai khuon mat
 fprintf('\nTai nhung anh nu');
 for k=1:so_non_face
     string= strcat(non_face_folder,num2str(k),'.png');
     image= imread(string);
     try
     image=rgb2gray(image);
     end
     fprintf('-');
     IM{1}= im2vecHOG(image);
     IM {2} = im2vecHOG (fliplr(image));
     for i=1:2
        IMGDBHOG1 {1,end+1}= string;
        IMGDBHOG1 {2,end} = 0; %1: face/ 0:non_face
        IMGDBHOG1 (3,end) = {(IM{i})'};
     end
 end
    fprintf('\n');
%% save result
 save imgdbHOG1 IMGDBHOG1;
 

 
