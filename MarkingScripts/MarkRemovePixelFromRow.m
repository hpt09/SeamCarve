function [mark] = MarkRemovePixelFromRow(specifiedFunctionName)
% Marks the RemovePixelFromRow function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
% author: Peter Bier

% default the function name to RemovePixelFromRow, if no optional arg specified
if nargin == 0
    functionName = 'RemovePixelFromRow';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

% set up rows 
Row1=TestImage1(1,:,:);
Row2=TestImage1(1,:,:);
Row3=TestImage1(1,:,:);
Row4=TestImage2(1,:,:);
Row5=BroadwayTower(1,:,:);
Row6=RiverCrossing(1,:,:);


input1 =         {Row1, Row2, Row3, Row4, Row5, Row6};
input2 =         [   1,    2,    3,    1,  100,  256];
expectedOutput = expectedRows; % expectedRows is stored in TestData.mat
totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = ['Testing ' functionName ' test ' num2str(i) ':'];
    
    try
        
        output{i} = feval(functionName,input1{i},input2(i));
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
allocatedMarks = 2;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

