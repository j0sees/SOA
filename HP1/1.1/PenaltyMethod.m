clear all;

nu = 0.0001;
threshold = 10^(-6);
mu = [1;10;100;400];
startingPoint = [1,2];

x1Star = [];
x2Star = [];

for i = 1:length(mu)
  xValues = GradientDescent(startingPoint, mu(i), nu, threshold);
  x1Star = [x1Star; (sprintf('%.3f', xValues(1)))];
  x2Star = [x2Star; (sprintf('%.3f', xValues(2)))];
end

T = table(mu, x1Star, x2Star)