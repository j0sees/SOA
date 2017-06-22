function pathLength = GetPathLength(path,cityLocation)

  numberOfNodes = size(path,2);
  pathLength = 0;
  
  for tNode = 1:numberOfNodes - 1
    currentNode = path(tNode);
    nextNode = path(tNode + 1);
    singlePath = EuclideanPathLength(currentNode,nextNode,cityLocation);
    pathLength = pathLength + singlePath;
  end

end