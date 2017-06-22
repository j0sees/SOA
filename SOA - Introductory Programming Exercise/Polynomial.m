function functionValue = Polynomial(value,polynomialCoefficients);

  functionValue = 0;
  functionOrder = length(polynomialCoefficients);
  for i = 1:functionOrder
    functionValue = functionValue + polynomialCoefficients(i)*(value.^(i-1));   
  end
  
end
