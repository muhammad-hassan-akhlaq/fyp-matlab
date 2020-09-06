function f_MakePatches(imageName , noOfRowPieces, noOfColPieces )

    I = imread(imageName);
    [R, C , P] = size(I);
    xLength= floor(R/noOfRowPieces);
    yLength= floor(C/noOfColPieces);
      
    k=1;
    for i= 1:xLength:R
        for j = 1:yLength:C
            xStart =i;
            xEnd=i+xLength-1;
            yStart =j;
            yEnd=j+yLength-1;
            if(xEnd <= R && yEnd<=C)
                Temp =I(xStart: xEnd,yStart: yEnd,:);
                Temp = imresize(Temp, rand()+0.5);
                Temp = imrotate(Temp , 100*rand());
                name = strcat(int2str(k),'.jpg');
                imwrite(Temp ,char(name));
                k=k+1;
            end
               
        end
    end
end
