function  P =f_AutoCrop2( P , th )
    
    if size(P,3)==3
       P= rgb2gray(P);
    end

    [R,  C]= size(P);
    
    cx = round(R/2);
    cy = round(C/2);
    
    
    count=0;
    up=cx;
    for i = cx:-1:1
        
        if P(i , cy)==0
           for j=1:C
              if P(i,j) ~=0
                  count = count+1;
                  
              end
           end
           if count>=th
               up=i;
               count=0;
           end
        else
            up=i;
        end
            
    end
    count =0;
    down=cx;
    for i = cx:R
        
        if P(i , cy)==0
           for j=1:C
              if P(i,j) ~=0
                  count= count+1;
              end
           end
           if count>=th
               down=i;
               count=0;
           end
        else
            down=i;
        end
            
    end
    count=0;
    left=cy;
    for i = cy:-1:1

        if P(cx , i)==0
           for j=1:R
              if P(j,i) ~=0
                  count=count+1;
              end
           end
           if count>=th
               left=i;
               count=0;
           end
        else
            left=i;
        end

    end
    
    count =0;
    right=cy;
    for i = cy:C

        if P(cx , i)==0
           for j=1:R
              if P(j,i) ~=0
                  count= count+1;
              end
           end
           if count>=th
               right=i;
               count=0;
           end
               
               
        else
            right=i;
        end

    end
    P=imcrop(P , [left up right-left down-up]);
end

