function [ ArrayOfMinEnergy ] = FindSeam2( energy )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[x, y, ~] = size(energy);

% for i = 1:y
%     Cell = cell(x,y);
%     Cell{i} = i;
% end
% 
Cell = cell(x,y);
firstRowOfCell = 1:y;
Cell{1, :} = num2cell(firstRowOfCell);
% for i = 1:y  
%     Cell{1, i} = i;
% end

%   Cell = {PreCol, j, NxtCol};
for i = 2:x
    for j = 1:y
  
        [ energy(i,j), path ] = FindLeastEnergyPathToPixel( j, energy(i, j), energy(i-1, :),Cell(i-1, :) );
        Cell{i,j} = path;
%         if i == 2
%         Cell{i,j} = path;
%         else
%             variable = path(1);
%             Cell{i,j} = [Cell{i-1, variable},j];
%         end
    end
end
    u = 1;
minleastEnergy = min(energy(x,:));
while energy(x, u) ~= minleastEnergy
    u = u + 1;
end
ArrayOfMinEnergy = Cell{x,u};             %[ArrayOfMinEnergy, minpath{u}];
end

