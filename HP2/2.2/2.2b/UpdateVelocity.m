function updatedVelPop = UpdateVelocity(velPopulation,c1,c2,posPopulation,deltaT,inertiaWeigth,bestParticles,globalBestParticle,velMax)

  nVar = size(posPopulation,2);
  nPart = size(posPopulation,1);
  updatedVelPop = zeros(nPart,nVar);
  
  for iPart = 1:nPart
    for jVar = 1:nVar
      q = rand;
      r = rand;
      cognitiveComponent = c1*q*((bestParticles(iPart,jVar) - posPopulation(iPart,jVar))/deltaT);
      socialComponent = c2*r*((globalBestParticle(jVar) - posPopulation(iPart,jVar))/deltaT);
      updatedVelPop(iPart,jVar) = inertiaWeigth*velPopulation(iPart,jVar) + cognitiveComponent + socialComponent;
      if (updatedVelPop(iPart,jVar) > velMax)
        updatedVelPop(iPart,jVar) = velMax;          
      elseif (updatedVelPop(iPart,jVar) < -velMax)
        updatedVelPop(iPart,jVar) = -velMax;
      end
    end
  end

end