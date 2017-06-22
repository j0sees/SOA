function updatedPosPop = UpdatePosition(velPopulation,posPopulation,deltaT)
  
  nVar = size(posPopulation,2);
  nPart = size(posPopulation,1);
  updatedPosPop = zeros(nPart,nVar);
  
  for i = 1:nPart
    for j = 1:nVar
      updatedPosPop(i,j) = posPopulation(i,j) + deltaT*velPopulation(i,j);
    end
  end
  
end