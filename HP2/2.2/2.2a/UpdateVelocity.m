function updatedVelPop = UpdateVelocity(velPopulation,c1,c2,posPopulation,deltaT,inertiaWeigth,bestParticles,globalBestParticle,velMax)

  nVar = size(posPopulation,2);
  nPart = size(posPopulation,1);
  updatedVelPop = zeros(nPart,nVar);
  
  for iParticle = 1:nPart
    for jVariable = 1:nVar
      q = rand;
      r = rand;
      cognitiveComponent = c1*q*((bestParticles(iParticle,jVariable) - posPopulation(iParticle,jVariable))/deltaT);
      socialComponent = c2*r*((globalBestParticle(jVariable) - posPopulation(iParticle,jVariable))/deltaT);
      updatedVelPop(iParticle,jVariable) = inertiaWeigth*velPopulation(iParticle,jVariable) + cognitiveComponent + socialComponent;
      if (updatedVelPop(iParticle,jVariable) > velMax)
        updatedVelPop(iParticle,jVariable) = velMax;          
      elseif (updatedVelPop(iParticle,jVariable) < -velMax)
        updatedVelPop(iParticle,jVariable) = -velMax;
      end
    end
  end

end