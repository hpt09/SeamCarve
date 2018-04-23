function [ ArrayOfMinEnergy ] = FindSeam( energy )
% This Function will find the minimum energy path required to go from top
% to bottom. It uses the function FindLeastEnergyPathToPixel in a loop and
% makes 2D arrays of energy spent and minimum paths taken and hence gives
% the path i.e. seam that has the minimum energy overall.
% Author: Harpreet

% Calculating the number of rows and columns
[x, y, ~] = size(energy);

% Preallocating the Cell array
path = cell(x,y);

% Setting the first row of Cell array as just 1,2,3.. to the number of rows
firstRowOfCell = 1:y;
path(1, :) = num2cell(firstRowOfCell);

% Nested loop that goes through every column and row i - row, j - column
% Starts from second row as first row is already set up
for i = 2:x
    for j = 1:y
        
        [ energy(i,j), path{i,j} ] = FindLeastEnergyPathToPixel( j, energy(i, j), energy(i-1, :), path(i-1, :) );
        %Cell{i,j} = path;
        %        Setting a 2D Cell array of minimum paths for every column and
        %        replacing the energy array with the energy required to go to
        %        minimum paths in corressponding paths in cell array
        
    end
end

% Finding the first minimum energy in the last row of energy array
% u being set up as column number of the minimum energy
u = 1;
minleastEnergy = min(energy(x,:));
while energy(x, u) ~= minleastEnergy
    u = u + 1;
end
% Hence the output would be last array of energy array with the column
% number found above 'u'
ArrayOfMinEnergy = path{x,u};
end

