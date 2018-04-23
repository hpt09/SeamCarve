function [mark] = MarkFindLeastEnergyPathToPixel(specifiedFunctionName)
% Marks the FindLeastEnergyPathToPixel function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
% author: Peter Bier

% default the function name to FindLeastEnergyPathToPixel, if no optional arg specified
if nargin == 0
    functionName = 'FindLeastEnergyPathToPixel';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

%Test all pixesl in row 2 of TestImage1
% all pixels in row 4 of TestImage 1
% pixels 1, 3 and 6  from 2nd row of TestImage2
columnNumber = [1 2 3    1 2 3    1 3 6];      
pixelEnergy =  [20808 52225 21220    20808 52225 21220    15421 22808 25496];
leastEnergyPath ={ [20808 52020 20808] [20808 52020 20808] [20808 52020 20808] ...
    [62425 93640 62837] [62425 93640 62837] [62425 93640 62837] ...
    [57685 50893 91370 25418 33055 37246] [57685 50893 91370 25418 33055 37246] [57685 50893 91370 25418 33055 37246] };
minimumPaths = { {[1] [2] [3]} {[1] [2] [3]} {[1] [2] [3]} ...
{[1,1,1] [1,1,2] [3,3,3]}  {[1,1,1] [1,1,2] [3,3,3]}  {[1,1,1] [1,1,2] [3,3,3]} ...
{[1] [2] [3] [4] [5] [6]}  {[1] [2] [3] [4] [5] [6]}  {[1] [2] [3] [4] [5] [6]} };

totalPassed = 0;
numTests = length(columnNumber);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = ['Testing ' functionName ' test ' num2str(i) ':'];
    
    try
        
        [output1,output2] = feval(functionName,columnNumber(i),pixelEnergy(i),leastEnergyPath{i},minimumPaths{i});
        % check if result returned closely matches the expected result
        outputMinEnergy(i) = output1;
        outputPath{i} = output2;
        if isequal(expectedMinEnergy(i),outputMinEnergy(i)) && isequal(expectedPath{i},outputPath{i})
            totalPassed = totalPassed + 1;
            disp([m '  Passed test']);
        else
            disp([m '  FAILED test']);
            
        end
        
    catch ex
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary 
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

