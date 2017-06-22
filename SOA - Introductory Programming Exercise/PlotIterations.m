function newtonRaphsonplot = PlotIterations(polynomialCoefficients,iterationValues)
 
  stationaryPointPosition = length(iterationValues);
  intervalLength = abs(iterationValues(1) - iterationValues(stationaryPointPosition));
  if (iterationValues(1) < iterationValues(stationaryPointPosition))
    x = [(iterationValues(1)-(intervalLength*0.1)):0.05:(iterationValues(stationaryPointPosition)+(intervalLength*0.1))];
  else
    x = [(iterationValues(stationaryPointPosition)-(intervalLength*0.1)):0.05:(iterationValues(1)+(intervalLength*0.1))];
  end % set the limits the of x axis and extends each extreme by 10 % of the length of the interval
  y = Polynomial(x,polynomialCoefficients);
  g = iterationValues;
  h = Polynomial(g,polynomialCoefficients);
  plot(x,y,'k',g,h,'bo')
  
end