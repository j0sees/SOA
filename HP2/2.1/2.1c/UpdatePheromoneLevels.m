function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);

  nNodes = size(pheromoneLevel,1);

  for i = 1:nNodes
    for j = 1:nNodes
      pheromoneLevel(i,j) = ((1 - rho)*pheromoneLevel(i,j)) + deltaPheromoneLevel(i,j);
    end
  end
 
end