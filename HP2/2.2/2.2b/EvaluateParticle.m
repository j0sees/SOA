function fitness = EvaluateParticle(particle)
  
  dim = size(particle,2);
  Xt = round(particle);
  X = transpose(Xt); 
  A = [15 27 36 18 12];
  B = [ 35 -20 -10  32 -10;...
       -20  40 -6  -31  32;...
       -10 -6   11 -6  -10;...
        32 -31 -6   38 -20;...
       -10  32 -10 -20  31];
   
  firstTerm = GetScalarProduct(A,X);
  tmpRow = [];
  for q = 1:dim
    tmpCol = B(:,q);  
    tmpRow(1,q) = GetScalarProduct(Xt,tmpCol); 
  end
  secondTerm = GetScalarProduct(tmpRow,X);
  fitness = -firstTerm + secondTerm;
  
end