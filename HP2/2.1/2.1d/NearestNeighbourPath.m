function nnPath = NearestNeighbourPath(cityLocation,firstCityPos)
  
  tabuList = firstCityPos; % List of visited nodes
  iCity = firstCityPos;
  nCities = size(cityLocation,1);
  
  for iIteration = 1:nCities - 1 
    pathsMatrix = zeros(nCities-iIteration,2);
    counter = 0;
    for jCity = 1:nCities
      if (jCity ~= tabuList)
        counter = counter + 1;
        singlePathLength = EuclideanPathLength(iCity,jCity,cityLocation);
        pathsMatrix(counter,1) = singlePathLength;
        pathsMatrix(counter,2) = jCity;
      end
    end
    pathsMatrix = sortrows(pathsMatrix);
    iCity = pathsMatrix(1,2);
    tabuList(iIteration + 1) = iCity;  
  end
  nnPath = tabuList;
  
end
