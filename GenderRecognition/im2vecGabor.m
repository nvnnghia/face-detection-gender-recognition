function IMVECTOR= im2vecGabor(W25x25)
load gabor;
    background = imopen(W25x25,strel('disk',15));
    W25x25_1 = W25x25 - background;
    W25x25_1= adapthisteq(W25x25_1,'Numtiles',[8 3]);
    Features100x160= cell(5,8);
for s=1:5
    for j=1:8
        Features100x160{s,j}= abs(ifft2(G{s,j}.*fft2(double(W25x25_1),32,32),25,25));
    end
end
    Features45x48= cell2mat(Features100x160);
IMVECTOR= reshape(Features45x48,[1 25000]);



