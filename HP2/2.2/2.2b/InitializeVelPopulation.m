function velPopulation = InitializeVelPopulation(populationSize,xMax,xMin,nVariables,alpha,deltaT)

  velPopulation = zeros(populationSize,2);
  
  % Since xMin = -xMax the reduced formula to update Vij is used
  for iParticle = 1:populationSize
    for iVar = 1:nVariables
      velPopulation(iParticle,iVar) = (alpha/deltaT)*(xMin + rand*(xMax - xMin));
    end
  end

end