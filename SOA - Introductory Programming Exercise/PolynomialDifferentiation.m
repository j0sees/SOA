function derivativeCoefficients = PolynomialDifferentiation(polynomialCoefficients,derivativeOrder);

  functionOrder = length(polynomialCoefficients);
  if (derivativeOrder >= functionOrder)
    derivativeCoefficients = [];
  else
    derivativeCoefficients = polynomialCoefficients;
    for i = 1:derivativeOrder
      for j = 1:functionOrder
        derivativeCoefficients(j) = derivativeCoefficients(j)*(j - i);  
      end
    end
    derivativeCoefficients = derivativeCoefficients(derivativeOrder + 1:functionOrder);
  end
  
end