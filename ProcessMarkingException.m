function [] = ProcessMarkingException( ex, functionName)
% displays a nice message to the user if their code causes a problem
% author: Peter Bier

disp(['   There was an error when calling ' functionName ':'])
disp(['   ' ex.message])
disp(sprintf('\n'));
if length(strfind(ex.message,'Undefined function')) && length(strfind(ex.message, functionName)) 
    disp(['   Matlab could not find ' functionName '.m',])
    disp('   Either the function does not exist in the current directory or it has been mispelt.');
    disp('   Check the current directory to see if an alternatively spelling has been used.');
    disp('   If you are marking someone else''s code then remember that you can still test a mispelt ');
    disp('   function by calling the appropriate test function with the mispelt function name as the input');
elseif length(strfind(ex.message,'Attempt to execute SCRIPT'))
    disp('   You have written a script rather then the required function');
end
end

