clc
clear all
close all

options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotbestindiv});

[V_and_alpha,Px] = ga(@Objective_function_For_Genetic_Algorithm, 2, [], [], [], [], ...
    [38, 0.1], [100, 1],@constraintfunctionforga,[], options);

