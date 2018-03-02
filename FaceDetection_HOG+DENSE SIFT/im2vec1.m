% Ham nay dung de trich xuat dac trung cua anh. Dung phuong phap HOG de trich xuat dac trung.
% Input la mot anh training (hoac test) kich thuoc 60x60
% Outout la 1 vector 1x900
function His= im2vec1(I)
%chuyen anh sang anh trang den
try
    I = rgb2gray(I);
end
%tinh bien do va goc cho anh
[m, n] = size(I);
[Gx, Gy] = imgradientxy(I);
[Gmag, Gdir] = imgradient(Gx, Gy);
theta = atan2(Gx,Gy);
degree = (theta.*(180/pi));
for i=1:m
    for j=1:n
        if (degree(i,j)<0)
            degree(i,j) = degree(i,j)+180;
        end
    end 
end
% Rut trich dac trung theo phuong phap HOG
cellHis=[];
for i = 1:6:55
    for j=1:6:55
        Gmag1 = Gmag(i:i+5,j:j+5);
        degree1 = degree(i:i+5,j:j+5);
        mg=zeros(1,11);
        for a= 1:6
            for b=1:6
                index=floor(degree1(a,b)/20);
                mg(index+1)=mg(index+1)+Gmag1(a,b)-Gmag1(a,b)*mod(degree1(a,b),20)/20;
                mg(index+2)= mg(index+2)+Gmag1(a,b)* mod(degree1(a,b),20)/20;                
            end
        end
        mg(1)=mg(1)+mg(10);
        veclength = sqrt(mg(1)*mg(1)+mg(2)*mg(2)+mg(3)*mg(3)+mg(4)*mg(4)+mg(5)*mg(5)+mg(6)*mg(6)+mg(7)*mg(7)+mg(8)*mg(8)+mg(9)*mg(9));
        mg=mg./veclength;
        cellHis=[cellHis; mg(1:9)];
    end
end
% Sap xep cac dac trung lai thanh vector 1 chieu
His =[];
for i =1:100
        His = [His, cellHis(i,:)];
end





