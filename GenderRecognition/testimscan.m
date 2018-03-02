% Ham nay dung de scan toan bo anh de tim ra nhung vi tri la khuon mat
% Ham nay co ket hop phuong phap phan vung da de tang toc do thuc hien cung nhu la
% giam ti le phat hien sai/
% Input: im: anh dua vao de thuc hien phat hien khuon mat
% Output: im_out chua vi tri toa do cua cac khuon mat phat hien duoc

function im_out = testimscan(im)
%load du lieu da trainning

load net;
%thuc hien phan vung da
imycbcr = rgb2ycbcr(im); 
im1 = rgb2gray(im);
[m, n]= size(im1);
im_out=zeros(m, n);
skin3 = zeros(m, n);
for i = 32:m-32
   for j = 32:n-32
      cb = double(imycbcr(i,j,2));
      cr = double(imycbcr(i,j,3));
      if (cb>80 && cb<130 && cr>130 && cr<190)
      skin3(i,j) = 1;  
      end
   end
end
%Tien hanh scan anh o cac vi tri co mau da de tim khuon mat
figure
imshow(skin3,[]);
figure
imshow(im);
hold on
for i = 32:3:m-32
   for j = 32:3:n-32
      if (skin3(i,j) == 1)
      imcut=(im1(i-29:i+30,j-29:j+30));
            b= svmclassify(net,im2vec(imcut));
            if (b==1)
            plot(j,i,'.g');
            im_out(i,j)=1;  
            im_out(i,j+1)=im_out(i,j+1)|1;
            im_out(i+1,j)=im_out(i+1,j)|1;
            end

      end
    end
end






