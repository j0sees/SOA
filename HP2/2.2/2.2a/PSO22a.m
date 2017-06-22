clear all;

populationSize = 5;
numberOfGenerations = 1000;
nVariables = 2;
fitness = zeros(populationSize,1);
particleBestFitness = zeros(populationSize,1);
alpha = 1;
beta = 0.99;
deltaT = 1;
varMax = 10;
c1 = 2;
c2 = 2;
inertiaWeigth = 1.4;
varMin = -varMax;
velMax = (varMax - varMin)/deltaT;
bestParticleIndex = 0;
globalBestFitness = inf;
globalBestParticle = [];

posPopulation = InitializePosPopulation(populationSize,nVariables,varMax,varMin);
velPopulation = InitializeVelPopulation(populationSize,varMax,varMin,nVariables,alpha,deltaT);
bestParticles = posPopulation;

for jPart = 1:populationSize
  particle = bestParticles(jPart,:);
  particleBestFitness(jPart) = EvaluateParticle(particle);
  if (particleBestFitness(jPart) < globalBestFitness)
    globalBestFitness = particleBestFitness(jPart);
    globalBestParticle = bestParticles(jPart,:);        
  end
end
for iGeneration = 1:numberOfGenerations
  for iPart = 1:populationSize
    particle = posPopulation(iPart,:);
    fitness(iPart) = EvaluateParticle(particle);
    if (fitness(iPart) < particleBestFitness(iPart))
      particleBestFitness(iPart) = fitness(iPart);
      bestParticleIndex = iPart;
      bestParticles(iPart,:) = posPopulation(bestParticleIndex,:);
      if (particleBestFitness(iPart) < globalBestFitness)
        globalBestFitness = particleBestFitness(iPart);
        globalBestParticle = bestParticles(iPart,:);        
      end
    end
  end
  
  velPopulation = UpdateVelocity(velPopulation,c1,c2,posPopulation,deltaT,inertiaWeigth,bestParticles,globalBestParticle,velMax);
  if (inertiaWeigth > 0.35)
    inertiaWeigth = UpdateInertiaWeigth(inertiaWeigth,beta);
  end
  posPopulation = UpdatePosition(velPopulation,posPopulation,deltaT);
    
end %loop over generations
disp(sprintf('BP: (%.2f,%.2f); Fitness: %.2f',globalBestParticle(1),globalBestParticle(2),globalBestFitness))
