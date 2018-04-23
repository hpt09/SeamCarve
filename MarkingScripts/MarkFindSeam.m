function [mark] = MarkFindSeam(specifiedFunctionName)
% Marks the FindSeam function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
% author: Peter Bier

% default the function name to FindSeam, if no optional arg specified
if nargin == 0
    functionName = 'FindSeam';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

input1 = {TestImage1Energy, TestImage2Energy, BlackImageEnergy, WhiteImageEnergy, BroadwayTowerEnergy, RiverCrossingEnergy};
expectedOutput = expectedSeamsFound;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = ['Testing ' functionName ' test ' num2str(i) ':'];
    
    try
        
        output{i} = feval(functionName,input1{i});
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput{i},output{i})
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

