function updateTransparency(contourObj)
contourFillObjs = contourObj.FacePrims;
for i = 1:length(contourFillObjs)
    % Have to set this. The default is 'truecolor' which ignores alpha.
    contourFillObjs(i).ColorType = 'truecoloralpha';
    % The 4th element is the 'alpha' value. First 3 are RGB. Note, the
    % values expected are in range 0-255.
    if i==1
        contourFillObjs(i).ColorData(4) = 0;
    else
        contourFillObjs(i).ColorData(4) = 180;
    end
end
end