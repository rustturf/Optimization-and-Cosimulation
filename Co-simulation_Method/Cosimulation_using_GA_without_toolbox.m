clc
clear all
close all

options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotbestindiv},'PopulationSize',4);

[V_and_alpha,Px] = ga(@OBJECTIVE_FUNCTION, 2, [], [], [], [], ...
    [38, 0.1], [100, 1],@CONSTRAINT_FUNCTION,[], options);
