% corridas

pS =    [50,100,500,1000,10000];
cP =    [0.8,0.5,0.55,0.65,0.90];
mP =    [0.025,0.10,0.02,0.3,0.01];
tSP =   [0.75,0.5,0.9,0.80,0.85];
tS =    [2,4,3,5,10];
nCorridas = 20;
k = 5; % Set de la corrida

for m = 1:nCorridas

  populationSize = pS(k);     %100;
  crossoverProbability = cP(k);   %0.8;
  mutationProbability = mP(k);    %0.025;
  tournamentSelectionParameter = tSP(k);  % 0.6;
  tournamentSize = tS(k);   %2;

  
  FunctionOptimization;
  ID = fopen('/home/jph/Documents/MATLAB/HP1/GA/data5','a');
  %fprintf(ID,'x1 , x2, maxFit\n');
  fprintf(ID,'%.5f,\t %.5f,\t %.5f\n',info);
  
end
clear all;