function posPopulation = InitializePosPopulation(populationSize,nVariables,xMax,xMin)

  posPopulation = zeros(populationSize,2);

  for iParticle = 1:populationSize
    for iVar = 1:nVariables
      posPopulation(iParticle,iVar) = xMin + rand*(xMax - xMin);
    end
  end

end