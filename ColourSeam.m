function [ ColouredImage ] = ColourSeam( RGBarray, VerticalSeam )
% This function will colour in the Seam to be removed
% This function will take in the Vertical seam found from the function
% FindSeam and colour in the particular pixels in Red
% Author: Harpreet

% Using a for loop from 1 to size of input image which will be the number
% of rows since it is the first value given
for i = 1:size(RGBarray)
    RGBarray(i, VerticalSeam(i), 1) = 255; % Setting Red of pixel to max
    RGBarray(i, VerticalSeam(i), 2) = 0; % Setting Green of pixel to zero
    RGBarray(i, VerticalSeam(i), 3) = 0; % Setting Blue of pixel to zero
end
% Setting the output as the input with coloured seam
ColouredImage = RGBarray;

end

