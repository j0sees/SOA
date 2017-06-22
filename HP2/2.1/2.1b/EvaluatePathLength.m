function fitness = EvaluatePathLength(individual,nGenes,cityLocation)

  pLength = 0;
  
  for iPos = 1:nGenes
    currentCity = individual(iPos);
    nextCity = individual(iPos + 1);
    pLength = pLength + EuclideanPathLength(currentCity,nextCity,cityLocation);
  end  
  fitness = 1/pLength;
  
end