function[output]=Objective_function_For_Genetic_Algorithm(input)
V=input(1);
alpha=input(2);
output=2*(V/(5+6*alpha))^2;
end