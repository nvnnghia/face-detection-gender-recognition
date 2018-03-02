% Ham nay dung de scan toan bo anh de tim ra nhung vi tri la khuon mat
% Ham nay co ket hop phuong phap phan vung da de tang toc do thuc hien cung nhu la
% giam ti le phat hien sai/
% Input: im: anh dua vao de thuc hien phat hien khuon mat
% Output: im_out chua vi tri toa do cua cac khuon mat phat hien duoc
 
function im_out = timscan(im)
%load du lieu da trainning
load net;
%thuc hien phan vung da
imycbcr = rgb2ycbcr(im); 
im1 = rgb2gray(im);
[m, n]= size(im1);
im_out=zeros(m, n);
skin3 = zeros(m, n);
for i = 15:m-15
   for j = 15:n-15
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
for i = 16:2:m-16
   for j = 16:2:n-16
      if (skin3(i,j) == 1)
      imcut=(im1(i-12:i+12,j-12:j+12));
        a= svmclassify(net,im2vec1(imcut));
        if (a==1)
            plot(j,i,'.g');
            im_out(i,j)=1;              
        end
      end
    end
end
