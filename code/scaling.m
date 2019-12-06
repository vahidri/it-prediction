function outy = scaling(inpMat)
    outy = ( inpMat - mean(inpMat) ) ./ (max(inpMat) - min(inpMat) );
end