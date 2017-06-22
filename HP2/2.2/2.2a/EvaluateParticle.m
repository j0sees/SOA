function fitness = EvaluateParticle(particle)

  x = particle(1);
  y = particle(2);
  
  f = -13 + x - (y^3) + 5*y*y - 2*y;
  g = -29 + x + (y^3) + y*y - 14*y;  
  fitness = 1 + f*f + g*g;
  
end