function iterate = GradientDescent(startingPoint,muParameter,nu,threshold)

  iterate = startingPoint;
  nablaf = Gradient(iterate(1),iterate(2),muParameter);
  while (norm(nablaf) >= threshold)
    iterate = iterate - nu.*nablaf;
    nablaf = Gradient(iterate(1),iterate(2),muParameter);
  end

end
