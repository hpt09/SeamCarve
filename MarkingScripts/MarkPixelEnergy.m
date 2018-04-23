function [mark] = MarkPixelEnergy(specifiedFunctionName)
% Marks the PixelEnergy function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
% author: Peter Bier

% default the function name to PixelEnergy, if no optional arg specified
if nargin == 0
    functionName = 'PixelEnergy';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

input1 =         {TestImage1, TestImage1, TestImage2, TestImage2, BroadwayTower, BroadwayTower};
input2 =         {3,          1,          3,          5,          2,             2};
input3 =         {2,          1,          1,          6,          2,             256};
expectedOutput = [52024,      20808,      12344,      36556,      774,           194];

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = ['Testing ' functionName ' test ' num2str(i) ':'];
    
    try
        
        output(i) = feval(functionName,input1{i},input2{i},input3{i});
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput(i),output(i))
            totalPassed = totalPassed + 1;
            disp([m '  Passed test']);
        else
            disp([m '  FAILED test']);
            disp(['Expected output ' num2str(output(i))]);
            
        end
        
    catch ex
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary 
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

