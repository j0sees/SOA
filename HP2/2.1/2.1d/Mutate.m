function mutatedChromosome = Mutate(chromosome,mutationProbability)
  
  nGenes = size(chromosome,2);
  mutatedChromosome = chromosome;
  for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
      mutatedChromosome(j);
      tmpChromosome = mutatedChromosome;
      tmpChromosome(j) = [];
      remPos = size(tmpChromosome,2);
      swapPos = 1 + fix(rand*remPos);
      if (swapPos < j)
        mutatedGene = mutatedChromosome(j);
        mutatedChromosome(j) = mutatedChromosome(swapPos);
        mutatedChromosome(swapPos) = mutatedGene;
      else
        mutatedGene = mutatedChromosome(j);
        mutatedChromosome(j) = mutatedChromosome(swapPos + 1);
        mutatedChromosome(swapPos + 1) = mutatedGene;
      end      
    end
  end
  
end