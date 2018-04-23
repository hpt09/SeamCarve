function [ EnergyArray ] = ImageEnergy( Pixel )
% This function will calculate the pixel energy for each pixel in an image
% This function will call the function 'PixelEnergy' in a loop
% in order to find pixel energy for every pixel in an image
% Author: Harpreet

% Getting number of rows and columns in an image
[x, y, ~] = size(Pixel);
% Preallocation
EnergyArray = zeros(x,y);

% Calling PixelEnergy for each column and row
for i = 1:x
    for j = 1:y
        [ EnergyArray(i,j) ] = PixelEnergy( Pixel, i, j );
    end
end
end

