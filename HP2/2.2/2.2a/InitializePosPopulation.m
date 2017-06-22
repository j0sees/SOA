function posPopulation = InitializePosPopulation(populationSize,nVariables,vMax,vMin)

  posPopulation = zeros(populationSize,2);

  for iParticle = 1:populationSize
    for iVar = 1:nVariables
      posPopulation(iParticle,iVar) = vMin + rand*(vMax - vMin);
    end
  end

end