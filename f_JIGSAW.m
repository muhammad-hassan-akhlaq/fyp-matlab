function  f_JIGSAW(imgName)
   imgOriginal = imread(imgName);
   PatchArray = {imread('1.jpg') imread('2.jpg') imread('3.jpg') imread('4.jpg')};
   noOfPatches =  size(PatchArray , 2);
   imgResult = zeros(size(imgOriginal));
   imwrite(imgResult, 'result.jpg');
   
    
   for i = 1:noOfPatches
       I = imread('result.jpg');
       I = rgb2gray(I);
       name = strcat(int2str(i),'.jpg');
       Patch = imread(char(name));
    
       f_StitchPatch(imgOriginal , Patch, I);
   end
end


