function iteratesVector = NewtonRaphson(polynomialCoefficients,startingPoint,tolerance)
  
  firstOrderDerivative = PolynomialDifferentiation(polynomialCoefficients,1);
  secondOrderDerivative = PolynomialDifferentiation(polynomialCoefficients,2);
  iterate = startingPoint;
  newIterate = 0;
  iteratesVector = [];
  if (length(polynomialCoefficients) <= 2)
    display('Error: Polynomial of order 2 or greater needed!')
    return;
  end
  while 1
    firstOrderDerivativeValue = Polynomial(iterate,firstOrderDerivative);
    secondOrderDerivativeValue = Polynomial(iterate,secondOrderDerivative);
    if (secondOrderDerivativeValue == 0)
      display('Error: division by zero!');
      return;
    end
    newIterate = NewtonRaphsonStep(iterate,firstOrderDerivativeValue,secondOrderDerivativeValue);
    if (abs(newIterate - iterate) < tolerance)
      break;
    end
    iteratesVector = cat(1,iteratesVector,iterate);
    iterate = newIterate; 
  end
  
end