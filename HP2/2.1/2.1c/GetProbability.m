function probNode = GetProbability(pheromoneLevel,visibility,alpha,beta,tabuList,iNode,jNode)
  
  % Probability for the (i,j) node
  nCities = size(pheromoneLevel,1);
  tmpSum = 0;
  for lNode = 1:nCities
    if (lNode ~= tabuList)
      tmpSum = tmpSum + (pheromoneLevel(lNode,jNode)^alpha)*(visibility(lNode,jNode)^beta); 
    end
  end
  numerator = (pheromoneLevel(iNode,jNode)^alpha)*(visibility(iNode,jNode)^beta);
  probNode = numerator/tmpSum;

end