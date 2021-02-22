function [F] = blob(F,fraco,i,j)

if(fraco(i-1,j-1) && ~F(i-1,j-1))
    F(i-1,j-1) = 1;
    blob(F,fraco,i-1,j-1);
elseif(fraco(i-1,j) && ~F(i-1,j))
    F(i-1,j) = 1;
    blob(F,fraco,i-1,j);
elseif(fraco(i-1,j+1) && ~F(i-1,j+1))
    F(i-1,j+1) = 1;
    blob(F,fraco,i-1,j+1);
elseif(fraco(i,j-1) && ~F(i,j-1))
    F(i,j-1) = 1;
    blob(F,fraco,i,j-1);
elseif(fraco(i,j+1) && ~F(i,j+1))
    F(i,j+1) = 1;
    blob(F,fraco,i,j+1);
elseif(fraco(i+1,j-1) && ~F(i+1,j-1))
    F(i+1,j-1) = 1;
    blob(F,fraco,i+1,j-1);
elseif(fraco(i+1,j) && ~F(i+1,j))
    F(i+1,j) = 1;
    blob(F,fraco,i+1,j);
elseif(fraco(i+1,j+1) && ~F(i+1,j+1))
    F(i+1,j+1) = 1;
    blob(F,fraco,i+1,j+1);
end
    

end