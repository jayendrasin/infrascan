function dataOut = preprocessData(data, imageSize)
    dataOut = data;
    dataOut{1} = imresize(data{1}, imageSize(1:2));               % Image
    dataOut{2} = imresize(data{2}, imageSize(1:2), 'nearest');    % Label (mask)
end
