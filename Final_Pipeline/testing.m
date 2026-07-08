load('trainedDeepCrackNet.mat', 'net');
img=imresize(imread('crack.jpg'),[256 256]);

predMask = (semanticseg(img,net) == 'crack')*255 + 0;
% Display the predicted segmentation mask
imshowpair(img,predMask,'montage');
title('Predicted Segmentation Mask');