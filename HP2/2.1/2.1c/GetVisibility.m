function visibility = GetVisibility(cityLocation)

  nCities = size(cityLocation,1);
  visibility = zeros(nCities,nCities);
  
  for iNode = 1:nCities
    for jNode = iNode:nCities
      if (jNode ~= iNode)
        pathLength = EuclideanPathLength(jNode,iNode,cityLocation);
        visibility(iNode,jNode) = 1/pathLength;
        visibility(jNode,iNode) = 1/pathLength;
      end
    end
  end
end