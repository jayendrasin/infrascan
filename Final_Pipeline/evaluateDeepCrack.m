function evaluateDeepCrack()
    clc
    
    load('trainedDeepCrackNet.mat', 'net');
    
    outputTestImgDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\test_img_resized';
    outputTestMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\test_lab_resized';
    files=dir(fullfile(outputTestImgDir,'*.jpg'));
    l=length(files);

    predMaskDir= 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\predicted_masks';
    if(~exist(predMaskDir,'dir')) 
        mkdir(predMaskDir); % Create directory for predicted masks if it doesn't exist
    end 

    totalPix=0;
    
    disp('Evaluating accuracy of the model...');
    disp('It will take about 10-15 mins...');
    
    for i=1:l
        img = imread(fullfile(outputTestImgDir,files(i).name));
        mask = imread(fullfile(outputTestMaskDir,replace(files(i).name, '.jpg', '.png')));
        
        predMask = semanticseg(img,net);
        predNumMask = (predMask == 'crack')*255 + 0;

        imwrite(predNumMask,fullfile(predMaskDir,files(i).name));

        samePix = sum(sum(mask==predNumMask));
        % fprintf("%f\n",samePix/(256*256)*100)
        totalPix=totalPix+samePix;
    end
    
    accuracy = totalPix / (l * numel(mask))*100; % Calculate accuracy based on pixel comparison
    disp(['Accuracy: ', num2str(accuracy)]);
end