function scalarProduct = GetScalarProduct(row,column)

  entries = size(row,2);
  scalarProduct = 0;
  
  for k = 1:entries
    scalarProduct = scalarProduct + row(1,k)*column(k,1);
  end
  
end