clear all
clc
close all
% load netDense;
load netHOG1
% load netGabor
% load net
nam=0;
nu = 0;
for i=201:688
    link = strcat('male\',num2str(i),'.png');
    I=imread(link);
%     a= svmclassify(netGabor,im2vecGabor(I));
    b= svmclassify(netHOG1,im2vecHOG(I));
%      c= svmclassify(netDense,im2vecDense(I));
%     d= svmclassify(net,im2vec(I));
    if((b)==1)
        nam=nam+1;
    else
        nu = nu+1;
    end
end
fprintf('so anh nam la: \n'); nam
fprintf('so anh nu la: \n'); nu