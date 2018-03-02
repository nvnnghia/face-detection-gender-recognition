function His= im2vec1(I)
try
I = rgb2gray(I);
end
% nPatchSize=8;
% nGridSpacing=4;
[SIFTFeatureVector, ~, locationY ] = DenseSIFT( I, 8, 4 );
His=SIFTFeatureVector';

