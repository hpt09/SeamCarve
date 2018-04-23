function [ leastEnergy, path ] = FindLeastEnergyPathToPixel( ColNumber, PixelEnergy, Array,Cell )
% This function from the name will find the least energy path required to
% get to the pixel given to us. With the inputs such as the column number
% of the pixel and its energy. An array of the row above the particular
% pixel and a cell array to store the minimum paths of the previous row
% Author: Harpreet

% Setting the column numbers next to the column number given as PreCol and
% NxtCol for Previous Column and Next Column
PreCol = ColNumber - 1;
NxtCol = ColNumber + 1;

% Getting just the number of columnns of the array
[~, y ] = size(Array);

% Solving the bounday issues
if PreCol < 1
    PreCol = ColNumber;
end
if NxtCol > y
    NxtCol = ColNumber;
end

% Finding the least energy pixel in the row above the pixel we
% trying to get to provided it is touching the pixel or sharing a corner
leastEnergyPixel = min(Array(PreCol:NxtCol));

% Finding the position of the least energy pixel
minPositionFound = false;
leastEnergy = leastEnergyPixel + PixelEnergy;
i = PreCol;
while minPositionFound == false
    if leastEnergyPixel == Array(i)
        % path following from the previous path stored in the cell aray
        % of the pixel poistion and the col number of the pixel
        path = [Cell{i}, ColNumber];
        % Stopping the loop once path found so the left most pixel is chosen
        % for the least energy pixel position in the case of 2 min energy pix
        minPositionFound = true;
    end
    i = i + 1; % incrementing and seeing other columns if not min energy
end

