function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

  nNodes = size(pathCollection,2) - 1;
  nPaths = size(pathCollection,1);
  tmpDeltaPheromoneLevel = zeros(nNodes,nNodes,nPaths);
  deltaPheromoneLevel = zeros(nNodes,nNodes);
  
  for kAnt = 1:nPaths % Iterates over all the k ants
    for i = 1:nNodes % Iterates over all the positions in the path except the last one
      for j = i + 1:nNodes + 1 % iterates over the rest of the positions in the path
        iNode = pathCollection(kAnt,i); % store the path positions 
        jNode = pathCollection(kAnt,j);
        kPathLegth = pathLengthCollection(kAnt);
        tmpDeltaPheromoneLevel(iNode,jNode,kAnt) = 1/kPathLegth;
      end
    end
  end
   
  for k = 1:nPaths
    deltaPheromoneLevel = deltaPheromoneLevel + tmpDeltaPheromoneLevel(:,:,k);
  end
  
end