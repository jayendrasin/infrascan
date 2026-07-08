function resizeImages()

    % Directories for training data
    inputImgDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\dataset\train_img';
    inputMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\dataset\train_lab';
    outputImgDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\train_img_resized';
    outputMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\train_lab_resized';

    % Directories for test data
    inputTestImgDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\dataset\test_img';
    inputTestMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\dataset\test_lab';
    outputTestImgDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\test_img_resized';
    outputTestMaskDir = 'C:\Users\HP\Desktop\OneDrive - IIT Kanpur\DESCON - Infracan\InfraScan-Summer-25\TanmayJain_241090\Output Images\test_lab_resized';

    imageSize = [256, 256];  % desired size

    % Create output directories if they don't exist
    if ~exist(outputImgDir, 'dir'); mkdir(outputImgDir); end
    if ~exist(outputMaskDir, 'dir'); mkdir(outputMaskDir); end
    if ~exist(outputTestImgDir, 'dir'); mkdir(outputTestImgDir); end
    if ~exist(outputTestMaskDir, 'dir'); mkdir(outputTestMaskDir); end

    % Resize training data
    imgFiles = dir(fullfile(inputImgDir, '*.jpg'));
    maskFiles = dir(fullfile(inputMaskDir, '*.png'));

    if length(imgFiles) ~= length(maskFiles)
        error('❌ Number of training images and masks do not match!');
    end

    fprintf('🔁 Resizing training images and masks...\n');
    for i = 1:length(imgFiles)
        img = imread(fullfile(inputImgDir, imgFiles(i).name));
        mask = imread(fullfile(inputMaskDir, maskFiles(i).name));

        imgResized = imresize(img, imageSize);
        maskResized = imresize(mask, imageSize, 'nearest');

        imwrite(imgResized, fullfile(outputImgDir, imgFiles(i).name));
        imwrite(maskResized, fullfile(outputMaskDir, maskFiles(i).name));
    end
    fprintf('✅ Training resize complete.\n');

    % Resize test data
    testImgFiles = dir(fullfile(inputTestImgDir, '*.jpg'));
    testMaskFiles = dir(fullfile(inputTestMaskDir, '*.png'));

    if length(testImgFiles) ~= length(testMaskFiles)
        error('❌ Number of test images and masks do not match!');
    end

    fprintf('🔁 Resizing test images and masks...\n');
    for i = 1:length(testImgFiles)
        img = imread(fullfile(inputTestImgDir, testImgFiles(i).name));
        mask = imread(fullfile(inputTestMaskDir, testMaskFiles(i).name));

        imgResized = imresize(img, imageSize);
        maskResized = imresize(mask, imageSize, 'nearest');

        imwrite(imgResized, fullfile(outputTestImgDir, testImgFiles(i).name));
        imwrite(maskResized, fullfile(outputTestMaskDir, testMaskFiles(i).name));
    end
    fprintf('✅ Test resize complete.\n');
end
