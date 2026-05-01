clc
clear all
close all
tic
%% Initialize
c1=0.1; %Societal factor
c2=0.1;
n_population=20; %Number of population
N_max=200;% Max Iteration
n_vars=2;%Number of variables
th_max=0.9;
th_min=0.4;

 %% Assigning Local and Global values
x_position=62*rand(n_population,1)+38
y_position=0.9*rand(n_population,1)+0.1
position=[x_position,y_position];
for i=1:n_population
fitness_value(i)=Objective_fcn(position(i,:));
end
[min_fit,Ind]=min(fitness_value);
Local_best_value=min_fit;
global_best_value=Local_best_value;
local_best_position=position(Ind,:)
global_best_position=local_best_position;
initial_velocity=zeros(n_population,n_vars);
for t=1:N_max
    th(t)=th_max-((th_max-th_min)/N_max)*t;
    delp=local_best_position.*ones(n_population,n_vars)-position;
    delg=global_best_position.*ones(n_population,n_vars)-position;
    new_velocity=initial_velocity*th(t)+c1*rand*delp+c2*rand*delg;
    new_position=position+new_velocity;
 %% Boundry check
    for i=1:n_population
        temp=new_position(i,:);
        if temp(1)<38
            temp(1)=38;
        end
        if temp(1)>100
            temp(1)=100;
        end
        if temp(2)<0.1
            temp(2)=0.1;
        end       
        if temp(2)>1
            temp(2)=1;
        end
        new_position(i,:)=temp;
    end
    
% %% Fitness Calculation
    for i=1:n_population
        fitness_value(i)=Objective_fcn(new_position(i,:));
    end
    [min_fit,Ind]=min(fitness_value);
Local_best_value=min_fit;
local_best_position=new_position(Ind,:)
% %% Check for global best value
if Local_best_value<=global_best_value
    V=local_best_position(1);
    alpha=local_best_position(2);
    if 0.5*V+5*alpha>=10
        global_best_value=Local_best_value;
        global_best_position=local_best_position;
    end
end
position=new_position;
initial_velocity=new_velocity;
ft(t)=global_best_value;



    
        
end
toc
fprintf('Optimal Positions are %f,%f and the minimum value of P(x) is %f \n',...
    global_best_position(1),global_best_position(2),global_best_value)
figure
plot(ft,'-.o')
grid on
title('Convergence curve For PSO Algorithm')
xlabel('Iterations')
ylabel('Fitness value(Px)')





