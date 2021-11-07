%% Exercise 1 
% Write a Matlab function that plots the workspace boundaries of a planar SCARA robot with
% joint limits and link lengths given by the user. Take into account a disc obstacle that 
% obstructs only link1 (no plot and a message error should appear if it is not the case). 

% Clear the workspace, close all figures, clear command window
close all
clear all
clc

% NOTICE: if you want to run a specific function please comment the others(in PART 1, 2 or 3).

%% Set parameters
% Set desired parameters of link lenghts and range of movemwnt allowed by angles  
link1 = 1;
link2 = 1;
theta1_min = -130;
theta1_max = 100;
theta2_min = -120;
theta2_max = 150;

% Set obstalce's position and radius  
x0 = 0.2;
y0 = 0;
r0 = 0.5;

%% Part 1: Plot robot's free workspace and joint space
% The frist function plots the robot's workspace with no obstacles and no
% angles constraints. The second function plots the joint space according
% to the set parameters.

%free_workspace(link1, link2);  % fai prova con lunghezze links diverse

%joint_space(theta1_min, theta1_max, theta2_min, theta2_max);

%% Part 2: Plot reduced workspace
% The function plots the robot's workspace with angles constraints.

%reduced_workspace(link1, link2, theta1_min, theta1_max, theta2_min, theta2_max);

%% Part3: Plot workspace in osbastacle presence
% In this third part I'll take into account a disc obstacle that obstructs only link1 

collision_workspace(link1, link2, theta1_min, theta1_max, theta2_min, theta2_max, x0,y0, r0)
