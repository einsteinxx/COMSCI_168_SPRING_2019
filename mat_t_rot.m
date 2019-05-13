
[X, Y] = meshgrid(1:256);


theta = 45 % projection angle in degrees
t = X*cosd(theta) + Y*sind(theta);