function lbp= im2vecLBP(I2)
I3=I2;
m=size(I2,1);
n=size(I2,2);

for i=2:m-1
    for j=2:n-1
        c=I2(i,j);
        I3(i-1,j-1)=I2(i-1,j-1)>c;
        I3(i-1,j)=I2(i-1,j)>c;
        I3(i-1,j+1)=I2(i-1,j+1)>c; 
        I3(i,j+1)=I2(i,j+1)>c;
        I3(i+1,j+1)=I2(i+1,j+1)>c; 
        I3(i+1,j)=I2(i+1,j)>c; 
        I3(i+1,j-1)=I2(i+1,j-1)>c; 
        I3(i,j-1)=I2(i,j-1)>c;
        LBP (i,j) =I3(i-1,j-1)*2^7+I3(i-1,j)*2^6+I3(i-1,j+1)*2^5+ ...
            I3(i,j+1)*2^4+I3(i+1,j+1)*2^3+I3(i+1,j)*2^2+ ...
            I3(i+1,j-1)*2^1+I3(i,j-1)*2^0;
    end
end
    LBP =double(LBP);
    lbp = reshape(LBP, [1 59*59]);

