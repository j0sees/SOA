function population = InitializePopulation(cityLocation,populationSize,numberOfGenes)
  
  numberOfMutations = 7;
  population = zeros(populationSize, numberOfGenes);
  for i = 1:populationSize
    firstCityPos = 1 + fix(rand*numberOfGenes);
    population(i,:) = NearestNeighbourPath(cityLocation,firstCityPos);
    chromosome = population(i,:);
    if i > 1
      population(i,:) = InitialMutations(chromosome,numberOfMutations);
    end
  end
    
end
