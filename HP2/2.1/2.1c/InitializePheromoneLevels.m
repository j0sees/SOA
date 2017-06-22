function pheromoneLevel = InitializePheromoneLevels(numberOfCities,tau0)

  pheromoneLevel = zeros(numberOfCities,numberOfCities);
  for iRow = 1:numberOfCities
    for jCol = 1:numberOfCities
      pheromoneLevel(iRow,jCol) = tau0; 
    end
  end

end