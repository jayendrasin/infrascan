clear all;
clc;

% Setup datastores
fprintf('📦 Preparing datastores...\n');

outputImgDir='C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\train_img_resized';
imds = imageDatastore(outputImgDir);
outputMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\train_lab_resized';
pxds = pixelLabelDatastore(outputMaskDir, ["crack", "background"], [255, 0]);

% Optional: Pair and apply preprocessing
imageSize = [256, 256];
cds = combine(imds, pxds);
cdsTransformed = transform(cds, @(data) preprocessData(data, imageSize));

fprintf('✅ Pipeline setup complete. Ready for training!\n');

save('cdsTransformed.mat', 'cdsTransformed');
