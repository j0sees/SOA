function mutatedChromosome = InitialMutations(chromosome,numberOfMutations)
  
  nGenes = size(chromosome,2);
  mutatedChromosome = chromosome;
  counter = 0;
  while (counter < numberOfMutations)
    for j = 2:nGenes - 1
      r = rand;
      if (r < 0.5)
        tmpChromosome = mutatedChromosome;
        tmpChromosome(j) = [];
        remPos = size(tmpChromosome,2);
        swapPos = 1 + fix(rand*remPos);
      % swapPos = randi([1,remPos]);
        if (swapPos < j)
          mutatedGene = mutatedChromosome(j);
          mutatedChromosome(j) = mutatedChromosome(swapPos);
          mutatedChromosome(swapPos) = mutatedGene;
        else
          mutatedGene = mutatedChromosome(j);
          mutatedChromosome(j) = mutatedChromosome(swapPos + 1);
          mutatedChromosome(swapPos + 1) = mutatedGene;
        end
      counter = counter + 1;  
      end
      if (counter > numberOfMutations - 1)
        break
      end
    end
  end 
end