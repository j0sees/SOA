%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 35;  % To do: Set to appropriate value.
alpha = 4.0;        % To do: Set to appropriate value.
beta = 3.0;         % To do: Set to appropriate value.
rho = 0.5;          % To do: set to appropriate value.

% To do: Write the GetNearestNeighbourPathLength function
nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation); % DONE!!
tau0 = numberOfAnts/nearestNeighbourPathLength;

targetPathLength = 123.0;
%targetPathLength = 82.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
% To do: Write the InitializePheromoneLevels
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0); % DONE!!
% To do: write the GetVisibility function
visibility = GetVisibility(cityLocation);% DONE!!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minimumPathLength = inf;

iIteration = 0;

while (minimumPathLength > targetPathLength)
 iIteration = iIteration + 1;
 if (mod(iIteration,50) == 0)
   disp(sprintf('Iteration: %d',iIteration));
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Generate paths:
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 pathCollection = [];
 pathLengthCollection = [];
 for k = 1:numberOfAnts
   % To do: Write the GeneratePath function.
   path = GeneratePath(pheromoneLevel, visibility, alpha, beta);   % DONE!!
   % To do: Write the GetPathLength function
   pathLength = GetPathLength(path,cityLocation); % DONE!!
   if (pathLength < minimumPathLength)
     minimumPathLength = pathLength;
     disp(sprintf('Iteration %d, ant %d: length = %.2f',iIteration,k,minimumPathLength));
     PlotPath(connection,cityLocation,path);
     %saveas(tspFigure, sprintf('image-IT-%d-ANT-%d.png',iIteration,k));
     bestPath = path;
   end
   pathCollection = [pathCollection; path];           
   pathLengthCollection = [pathLengthCollection; pathLength];
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Update pheromone levels:
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 
 % To do: write the ComputeDeltaPheromoneLevels function
 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);  % DONE!!
 % To do: write the UpdatePheromoneLevels function
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);% DONE!!  

end
