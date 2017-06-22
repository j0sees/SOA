clear all;

populationSize = 5;
numberOfGenerations = 1000;
nVariables = 5;
alpha = 1;
beta = 0.999;
deltaT = 1;
varMax = 30;
varMin = -varMax;
velMax = (varMax - varMin)/deltaT;
c1 = 2;
c2 = 2;
inertiaWeigth = 1.4;
fitness = zeros(populationSize,1);
particleBestFitness = zeros(populationSize,1);
globalBestFitness = inf;
globalBestParticle = [];

posPopulation = InitializePosPopulation(populationSize,nVariables,varMax,varMin);
velPopulation = InitializeVelPopulation(populationSize,varMax,varMin,nVariables,alpha,deltaT);
bestParticles = posPopulation;

for i = 1:populationSize
  particle = bestParticles(i,:);
  particleBestFitness(i) = EvaluateParticle(particle);
  if (particleBestFitness(i) < globalBestFitness)
    globalBestFitness = particleBestFitness(i);
    globalBestParticle = bestParticles(i,:);        
  end
end
for iGeneration = 1:numberOfGenerations
  for iPos = 1:populationSize
    particle = posPopulation(iPos,:);
    fitness(iPos) = EvaluateParticle(particle);
    if (fitness(iPos) < particleBestFitness(iPos))
      particleBestFitness(iPos) = fitness(iPos);
      bestParticleIndex = iPos;
      bestParticles(iPos,:) = posPopulation(bestParticleIndex,:);
      if (particleBestFitness(iPos) < globalBestFitness)
        globalBestFitness = particleBestFitness(iPos);
        globalBestParticle = bestParticles(iPos,:);        
      end
    end
  end
  
  velPopulation = UpdateVelocity(velPopulation,c1,c2,posPopulation,deltaT,inertiaWeigth,bestParticles,globalBestParticle,velMax);
  if (inertiaWeigth > 0.35)
    inertiaWeigth = UpdateInertiaWeigth(inertiaWeigth,beta);
  end
  posPopulation = UpdatePosition(velPopulation,posPopulation,deltaT);
    
end %loop over generations
%%%%%%%%%%% DISPLAY STUFF
disp(sprintf('BP: %.2f,%.2f;',globalBestParticle(1),globalBestParticle(2)))
disp(sprintf('BP: %.2f,%.2f;',globalBestParticle(3),globalBestParticle(4)))
disp(sprintf('BP: %.2f; Fitness: %d',globalBestParticle(5),globalBestFitness))