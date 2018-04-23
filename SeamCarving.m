% This script file performs seam carving on an image
% Before it will run you will need to implement the 8 functions
% specified in the project hand out document
% author: Peter Bier

clear
clf

% get image to carve
% TIP: to save typing in a test image name every time, you may like to
% change this line to something like imageName = 'testImage.jpg'
imageName = input('Please enter the name of the image to carve:','s');
myImage = imread(imageName);

% get number of seams to cave
n = input('Please enter the number of seams to carve:');

% display original image
figure(1)
imshow(myImage)

% carve specified number of seams
ColImage = myImage;
for i=1:n
    disp(['Carving seam ' num2str(i)]);
    
    % step 1: Calculage image energy
    energy = ImageEnergy(myImage);
    
    figure(2)
%     subplot(1,3,1)
    % normalise and display energy image
    maxE = max(max(energy));
    imshow(uint8(energy/maxE*255))
    
     figure(3)
    % step 2: Identify seam
    seam = FindSeam(energy);
    
    ColImage = ColourSeam(ColImage,seam);
    
   
%     subplot(1,3,2)
    imshow(ColImage)
    
    % step 3: Remove seam
    figure(4)
    newImage = RemoveSeam(myImage,seam);
    clear myImage seam energy;
 
    myImage = newImage;
    
%     subplot(1,3,3)
    imshow(myImage);
    
   %disp('Hit enter to continue');
    %pause
end

% write out the carved image
imwrite(newImage,['Carved' imageName]);
