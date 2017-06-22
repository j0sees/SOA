function iSelected = TournamentSelect(fitnessValues,tournamentSelectionParameter,tournamentSize)

  populationSize = size(fitnessValues,1);
  randChromosomePos = [];
  for j = 1:tournamentSize
    randChromosomePos(j) = 1 + fix(rand*populationSize);
  end
  
  iSelected = 0;
  while (iSelected == 0) % loops until a selection is carried    
    bestFit = randChromosomePos(1);
    bestFitPos = 1;
    individualsLeft = size(randChromosomePos,2);
    for i = 1:individualsLeft % look for best fit in the remaining candidates 
      if (fitnessValues(randChromosomePos(i)) > fitnessValues(bestFit)) 
        bestFit = randChromosomePos(i);
        bestFitPos = i;
      end
    end
    r = rand;
    if (r < tournamentSelectionParameter)
      iSelected = bestFit;
    elseif (individualsLeft == 1 && iSelected == 0)
      worstFit = randChromosomePos(1);
      for i = 1:size(randChromosomePos,2) % look for worst fit  
        if (fitnessValues(randChromosomePos(i)) < fitnessValues(worstFit)) 
          worstFit = randChromosomePos(i);            
        end
      end
      iSelected = worstFit;
    else
      randChromosomePos(bestFitPos) = [];  
    end
  end
  
end