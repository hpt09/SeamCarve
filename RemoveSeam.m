function [ ArrayWithOnelessCol ] = RemoveSeam( RGBarray, VerticalSeam )
% This function removes the whole seam
%  The function will call the function RemovePixelFromRow and make new
%  image with with one less column i.e. with seam removed
% Author: Harpreet

% size
[x, y, z] = size(RGBarray);
% Preallocating with zeroes of uint8 values
ArrayWithOnelessCol = zeros(x,y-1,z);

% For loop going from 1 to number of rows using RemovePixelFromRow on every
% row to remove pixel from every row from an image and getting an output
% with one less column i.e. Seam Removed
for i = 1:x
    NewRowOfPixels = RemovePixelFromRow( RGBarray(i,:,:), VerticalSeam(i) );
    ArrayWithOnelessCol(i,:,:) = NewRowOfPixels;
    
end

