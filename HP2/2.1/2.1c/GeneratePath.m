function path = GeneratePath(pheromoneLevel,visibility,alpha,beta)

  %%%%%%%%%%%%
  % Generates the list of nodes visited by the kth ant.
  %%%%%%%%%%%%
  nCities = size(pheromoneLevel,1);
  startingNode = 1 + fix(rand*nCities); % Random First Node
  tabuList = startingNode; % List of visited nodes
  iNode = startingNode;
  
  for jIteration = 1:nCities - 1
  %if (iNode ~= tabuList)  
    probMatrix = zeros(nCities-jIteration,2);
    counter = 0;
    for jNode = 1:nCities
      if (jNode ~= tabuList)
        counter = counter + 1;  
        probNode = GetProbability(pheromoneLevel,visibility,alpha,beta,tabuList,iNode,jNode);
        probMatrix(counter,1) = probNode;
        probMatrix(counter,2) = jNode;
      end
    end
    %probMatrixSize = size(probMatrix,1)
    iNode = GetNode(probMatrix);
    tabuList(jIteration + 1) = iNode;
  %end  
  end
  path = [tabuList tabuList(1)];
end