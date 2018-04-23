function [ gradient ] = PixelGradient( Pixel1, Pixel2 )
% This function calculates the gradient between 2 pixels
%  Author: Harpreet

% Converting uint8 value to double value
Pixel1=double(Pixel1);
Pixel2=double(Pixel2);

% Getting difference of Red, Green and Blue and squaring them
gradient = (Pixel2(1,1,1) - Pixel1(1,1,1))^2 + (Pixel2(1,1,2) - Pixel1(1,1,2))^2 + (Pixel2(1,1,3) - Pixel1(1,1,3))^2;

end

