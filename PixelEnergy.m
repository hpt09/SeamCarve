function [ Energy ] = PixelEnergy( Pixel, RowPosition, ColumnPosition )
% This function calculates the energy for a pixel using
% gradient in the x direction and y direction and adding them
% This function will call PixelGradient to calculate the gradients required
% Author: Harpreet

% Setting variables for to use in calculating gradients
PreRow = RowPosition - 1;
NxtRow = RowPosition + 1;
PreCol = ColumnPosition - 1;
NxtCol = ColumnPosition + 1;

% getting rows and columns of the pixel array
[x, y, ~] = size(Pixel);

% Solving the problem of border pixels
if PreRow < 1
    PreRow = x;
end
if NxtRow> x
    NxtRow = 1;
end
if PreCol < 1
    PreCol = y;
end
if NxtCol > y
    NxtCol = 1;
end

% Calculating the Gradient from x and y direction for a particular pixel
[ gradientY ] = PixelGradient( Pixel(PreRow, ColumnPosition, :), Pixel(NxtRow, ColumnPosition, :));
[ gradientX ] = PixelGradient( Pixel(RowPosition, (PreCol), :), Pixel(RowPosition, (NxtCol), :));

% Adding the gradients for Energy
Energy = gradientY + gradientX;
end

