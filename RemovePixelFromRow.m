function [ NewRowOfPixels ] = RemovePixelFromRow( RowOfPixels, ColPosition )
% This function removes on pixel from a row of pixels
%   This function will remove one pixel of a seam from one row of pixels
% Author: Harpreet

% Size
[~, y, ~] = size(RowOfPixels);

% Preallocation
%NewRowOfPixels = zeros(1, y-1, 3);

NewRowOfPixels = [RowOfPixels(1,1:ColPosition-1,:),RowOfPixels(1, ColPosition + 1 : y, :)];
end

% Nested loop for all columns upto 1 before column need to be removed
% and for all layers
% for j = 1:3
%     for i = 1:ColPosition - 1
%         NewRowOfPixels(1, i, j) = RowOfPixels(1, i, j);
%     end
% end
% 
% % Nested loop for all columns 1 after the column need to be removed
% % and for all layers
% for j = 1:3
%     for i = ColPosition + 1 : y
%         NewRowOfPixels(1, i-1, j) = RowOfPixels(1, i, j);
%     end
% end
