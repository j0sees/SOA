function newtonRaphsonStep = NewtonRaphsonStep(iterate,firstOrderDerivativeValue,secondOrderDerivativeValue)
  
  newtonRaphsonStep = iterate - (firstOrderDerivativeValue/secondOrderDerivativeValue);
  
end