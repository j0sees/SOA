splot 1 + (-13 + x - y**3 + 5*(y**2) - 2*y)**2 + (-29 + x - y**3 + (y**2) - 14*y)**2, (5,4,1) 
#plot (5,4)
set title "Objective Function and minimum"
#set xlabel "iteration"
#set ylabel "fitness"
set xlabel "x"
set ylabel "y"
set zlabel "z"
set xrange [-10:10]
set yrange [-10:10]
set contour
set isosamples 50
set hidden3d
replot
