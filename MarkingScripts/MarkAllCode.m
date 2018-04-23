% Mark all eight specified functions for the 2015 matlab project 
% To use this script requires a small amount of setup (see below).
% Author: Peter Bier
%
% Setup:
% You will need to add the MarkingScripts directory to the
% matlab path so that Matlab can find the test scripts and test data files
% To do this from within Matlab right click on the directory 
% called MarkingScripts and choose add to path, "Selected folders and subfolders").  
% Adding a directory to the Matlab path allows Matlab to locate any 
% in that directory.  This allows you to keep your test scripts separate
% from the directory your code is stored in.
% This script assumes that you will change into a working directory 
% that contains the code you want to test.
% Once setup is complete you can test code by typing MarkAllCode from 
% within your working directory.  You can also test individual functions
% using the appropriate marking script, e.g. calling MarkPixelGradient will 
% mark the PixelGradient function.
%
% Note that if someone mispells one or more function names you can still use
% scripts to mark them, just specify the function name they have actually
% used as an optional argument (e.g. if they called their PixelGradient
% function pixelgradient, you could mark it by typing:
% MarkPixelGradient('pixelgradient')

clear
% set up list of functions to mark
functionsList = {'PixelGradient','PixelEnergy','ImageEnergy', ...
  'FindLeastEnergyPathToPixel','FindSeam','ColourSeam', ...
  'RemovePixelFromRow','RemoveSeam'};
   

divider='=======================================================';
totalMark = 0;
% Call the marking function for each listed function, e.g. MarkPixelGradient
for i=1:length(functionsList)
    mark = feval(['Mark' functionsList{i}]);
    totalMark = totalMark + mark;
    disp('Hit enter to continue'); pause;
    disp(divider);
end

disp(['Your total functionality mark is ' num2str(totalMark) ' + your execution time mark']);


