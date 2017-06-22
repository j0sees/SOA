function nearestNTourPathLength = GetNearestNeighbourPathLength(cityLocation)

  nearestNTourPathLength = 0;
  nCities = size(cityLocation,1);
  %citiesPositions = [1:nCities];
  r = rand;
  firstCityPos = 1 + fix(r*nCities);
  currentCityPos = firstCityPos;
  visitedCities = firstCityPos;
  
  for iIteration = 1:nCities - 1
    nearestNPathLength = inf;
    for iCity = 1:nCities
      pathLength = EuclideanPathLength(currentCityPos,iCity,cityLocation);
      if (pathLength < nearestNPathLength) & (pathLength > 0) & (iCity ~= visitedCities)
        nearestNPathLength = pathLength;
        nearestCity = iCity;
      end
    end
    nearestNTourPathLength = nearestNTourPathLength + nearestNPathLength;
    currentCityPos = nearestCity;
    visitedCities(iIteration + 1) = nearestCity;    
  end
  lastStepPathLength = EuclideanPathLength(currentCityPos,firstCityPos,cityLocation);
  nearestNTourPathLength = nearestNTourPathLength + lastStepPathLength;
end
