function   f_StitchPatch( imgOriginal, imgPatch, imgResult)
    
    if size(imgOriginal,3)==3
       imgOriginal= rgb2gray(imgOriginal);
    end
    if size(imgPatch,3)==3
       imgPatch= rgb2gray(imgPatch);
    end
    if size(imgResult,3)==3
       imgResult= rgb2gray(imgResult);
    end
    
    
    [tform status1] = f_GetTForm(imgOriginal, imgPatch);
    if status1 == 1
        recovered  = imwarp(imgPatch,tform);
        recovered = f_AutoCrop2(recovered, 5);
        [tform1 status2]= f_GetTForm(imgOriginal, recovered);
        if status2 ==1
            recovered  = imwarp(recovered,tform1);

            [R, C] = size(recovered);
            T = tform1.T;

            xStart =round(T(3,2));
            yStart= round(T(3,1));
            if xStart ==0
                xStart = 1;
            end
            if xStart <0
                xStart = 1;
            end

            if yStart == 0
                yStart = 1;
            end 
             if yStart <0
                yStart =1;
             end
            imgResult(xStart:xStart+R-1 ,yStart:yStart +C-1 )= recovered;

            rgbI(:,:,1)=imgResult;
            rgbI(:,:,2)=imgResult;
            rgbI(:,:,3)=imgResult;

            imwrite(rgbI , 'result.jpg');
            imshow(rgbI);
        end
    end
    
end

    