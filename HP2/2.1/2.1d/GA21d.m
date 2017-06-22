clear all;

populationSize = 500;
mutationProbability = 0.8;
numberOfGenerations = 100;
fitness = zeros(populationSize,1);
nCopies = 50; % Copies of the best individual placed in the top of the population
cityLocation = LoadCityLocations();
numberOfGenes = size(cityLocation,1);

population = InitializePopulation(cityLocation,populationSize,numberOfGenes);
bestFitness = 0;
bestIndividualIndex = 0;
range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation,range);
connection = InitializeConnections(cityLocation); 

for iGeneration = 1:numberOfGenerations   
  for i = 1:populationSize
    chromosome = population(i,:);
    chromosome(numberOfGenes + 1) = population(i,1);
    fitness(i) = EvaluatePathLength(chromosome,numberOfGenes,cityLocation);
    if (fitness(i) > bestFitness)
      bestFitness = fitness(i);
      pathLength = 1/fitness(i);
      bestIndividualIndex = i;
      bestIndividual = population(bestIndividualIndex,:);
      disp(sprintf('Gen %d, Ind %d: Path Length = %.2f',iGeneration,i,pathLength));
      PlotPath(connection,cityLocation,bestIndividual);                     
    end
  end
  
  tempPopulation = population;
    
  for i = 1:populationSize
    originalChromosome = tempPopulation(i,:);
    mutatedChromosome = Mutate(originalChromosome,mutationProbability);
    tempPopulation(i,:) = mutatedChromosome;
  end
    
  tempPopulation = InsertBestIndividual(tempPopulation,bestIndividual,nCopies);
  population = tempPopulation;
    
end %loop over generations
