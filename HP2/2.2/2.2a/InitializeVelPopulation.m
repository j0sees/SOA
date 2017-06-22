function velPopulation = InitializeVelPopulation(populationSize,vMax,vMin,nVariables,alpha,deltaT)

  velPopulation = zeros(populationSize,2);
  
  % Since vMin = -vMax the reduced formula for initialising Vij is used
  for iParticle = 1:populationSize
    for iVar = 1:nVariables
      velPopulation(iParticle,iVar) = (alpha/deltaT)*(vMin + rand*(vMax - vMin));
    end
  end

end