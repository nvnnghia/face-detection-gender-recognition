%Ham nay dung de tinh toa do trung tam cua mot vung nao do trong anh nhi
%phan. Vung can tinh phai la vung co gia tri khac 0 duy nhat trong anh.
% Input: anh nhi phan co 1 vung gia tri khac 0 (vung can tinh toa do trung
% tam
%Output: toa do trung tam cua vung can tinh
 
function [x, y] = region_center(A)
% thiet lap cac gia tri ban dau cho toa do cac vi tri bien cua vung
[m, n] = size(A);
left = -1;
right = -1;
up = -1;
down = -1;
%% Tinh cac gia tri bien cua vung
for j=1:n,
  for i=1:m,
     if (A(i,j) ~= 0)
       left = j;
       break;
     end;
  end;
  if (left ~= -1) 
      break; 
  end;
end;
 
for j=n:-1:1,
  for i=1:m,
     if (A(i,j) ~= 0)
       right = j;
       break;
     end;
  end;
  if (right ~= -1) 
      break; 
  end;
end;
 
for i=1:m,
    for j=1:n,
     if (A(i,j) ~= 0)
       up = i;
       break;
     end;
    end;
 if (up ~= -1) 
     break; 
 end;
end;
 
for i= m:-1:1,
  for j=1:n,
     if (A(i,j) ~= 0)
       down = i;
       break;
     end;
  end;
  if (down ~= -1) 
      break; 
  end;
end;
 
%% tinh toa do trung tam cua vung
if (left == -1) left =1; end;
if (right == -1) right = n; end;
if (up == -1) up=1; end;
if (down == -1) down = m; end;
x = (left+right)/2;
y= (up+down)/2;
