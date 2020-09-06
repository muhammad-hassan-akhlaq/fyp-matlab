function [tForm status] = f_GetTForm(imgOriginal , imgPatch)

    if size(imgOriginal,3)==3
       imgOriginal= rgb2gray(imgOriginal);
    end
    if size(imgPatch,3)==3
       imgPatch= rgb2gray(imgPatch);
    end
    
    ptsOriginal  = detectSURFFeatures(imgOriginal);
    ptsPatch = detectSURFFeatures(imgPatch);
    
    [featuresOriginal,  validPtsOriginal]  = extractFeatures(imgOriginal,  ptsOriginal);
    [featuresPatch, validPtsPatch] = extractFeatures(imgPatch, ptsPatch);
    
    indexPairs = matchFeatures(featuresOriginal, featuresPatch);
    if(size(indexPairs,1)>=3)
        matchedOriginal = validPtsOriginal(indexPairs(:,1));
        matchedPatch = validPtsPatch(indexPairs(:,2));
        tForm = estimateGeometricTransform(matchedPatch, matchedOriginal, 'affine');
          
        status =1;
    else
        tForm = [0 0 0; 0 0 0; 0 0 0];
        status =0;
    end
end

