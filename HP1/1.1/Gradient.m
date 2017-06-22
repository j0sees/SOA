function gradient = Gradient(x1,x2,muParameter)
  
  %gradient = [];
  partialDerivativex1 = 2*(x1 - 1) + (4*x1*muParameter*(x1*x1 - x2*x2 - 1));
  partialDerivativex2 = 4*(x2 - 2) - (4*x2*muParameter*(x1*x1 - x2*x2 - 1));
  gradient = [partialDerivativex1,partialDerivativex2];
  
end
