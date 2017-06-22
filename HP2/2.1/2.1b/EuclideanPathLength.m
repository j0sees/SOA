function pathLength = EuclideanPathLength(node1,node2,cityLocation)

  tmpX = cityLocation(node2,1) - cityLocation(node1,1);
  tmpY = cityLocation(node2,2) - cityLocation(node1,2);
  pathLength = sqrt((tmpX)^2 + (tmpY)^2);
  
end