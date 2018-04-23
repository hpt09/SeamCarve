function [mark] = MarkPixelGradient(specifiedFunctionName)
% Marks the PixelGradient function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
% author: Peter Bier

% default the function name to PixelGradient, if no optional arg specified
if nargin == 0
    functionName = 'PixelGradient';
else
    functionName = specifiedFunctionName;
end

% set up  test data
% construct arrays of unsigned 8 bit integers representing pixels
RedPixel=zeros(1,1,3,'uint8'); % create a pixel with all 3 values as 0
RedPixel(1,1,1)=255; % now set the amount of red to 255
WhitePixel=ones(1,1,3,'uint8')*255; % pixel with all 3 values set to 255
BlackPixel=zeros(1,1,3,'uint8'); % pixel with all 3 values set to 0
GreyPixel=ones(1,1,3,'uint8')*128; % pixel with all 3 values set to 128
 
input1 =         {RedPixel,   WhitePixel, BlackPixel, RedPixel,  BlackPixel, GreyPixel};
input2 =         {WhitePixel, RedPixel,   WhitePixel, GreyPixel, GreyPixel,  GreyPixel};
expectedOutput = [130050,     130050,     195075,     48897,     49152,      0];

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = ['Testing ' functionName ' test ' num2str(i) ':'];
    
    try

        output(i) = feval(functionName,input1{i},input2{i});
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
allocatedMarks = 2;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


