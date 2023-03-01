% Copyright 2018 The MathWorks, Inc.
% Sample file to show how to use the alluvialflow function

% There are four video gamers...
left_labels = {'Arun', 'Kaushik', 'Federico', 'Dave'};

% ...who play video games during all parts of the day.
right_labels = {'Morning', 'Afternoon', 'Evening'};

% data(i, j) = hours player (row) i plays in part-of-day (column) j
data = [ 2   2   2;
         3   0   1;
         1   2   3;
         4   3   4];

% Show how the time played is distrubuted among gamers and parts of day.
alluvialflow(data, left_labels, right_labels, 'Video gaming hours of four gamers');