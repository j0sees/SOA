function nextNode = GetNode(probMatrix)
  
  %%%%%%%%%%%%%%%%%
  % Returns the next node in the path
  %%%%%%%%%%%%%%%%%
  
  counter = size(probMatrix,1);
  probMatrix = sortrows(probMatrix);
  iSelection = 0;
  while (iSelection == 0)
    if (counter == 1)
      nextNode = probMatrix(counter,2);
      iSelection = 1;
    else
      r = rand;
      if (r < probMatrix(counter,1))
        nextNode = probMatrix(counter,2);
        iSelection = 1;
      end
    end
    counter = counter - 1;
  end  

end