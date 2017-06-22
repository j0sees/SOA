function variablesVector = DecodeChromosome(chromosome,nVariables,variableRange)

  nGenes = size(chromosome,2);
  nBits = fix(nGenes/nVariables);
  
  for i = 1:nVariables
    variablesVector(i) = 0.0;
    for j = 1:nBits
      variablesVector(i) = variablesVector(i) + chromosome(j+(nBits*(i-1)))*2^(-j);
    end
    variablesVector(i) = -variableRange + 2*variableRange*variablesVector(i)/(1 - 2^(-nBits));
  end
    
end