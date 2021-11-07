function [outputArg1,outputArg2] = reduced_workspace(link1, link2, theta1_min, theta1_max, theta2_min, theta2_max)
% Consider both singularities and joint limits of the robot
%% Joint limits
th1min = deg2rad(theta1_min);
th1max = deg2rad(theta1_max); 
th2min = deg2rad(theta2_min);
th2max = deg2rad(theta2_max);

th1 = th1min:0.1:th1max;
th2 = th2min:0.1:th2max;

% Extreme conditions of the Direct Geometric Model
% Keep fixed theta1 at min, move th2 
x2min = link1*cos(th1min) + link2*cos(th1min + th2);
y2min = link1*sin(th1min) + link2*sin(th1min +th2);

% Keep fixed theta1 at max, move th2 
x2max = link1*cos(th1max) + link2*cos(th1max + th2);
y2max = link1*sin(th1max) + link2*sin(th1max +th2);

% Keep fixed theta2 at min, move th1 
x1min = link1*cos(th1) + link2*cos(th1 + th2min);
y1min = link1*sin(th1) + link2*sin(th1 +th2min);

% Keep fixed theta2 at max, move th1 
x1max = link1*cos(th1) + link2*cos(th1 + th2max);
y1max = link1*sin(th1) + link2*sin(th1 +th2max);


figure
plot(x2min, y2min, 'b');
hold on
plot(x2max, y2max, 'b');
hold on
plot(x1min, y1min, 'b');
hold on
plot(x1max, y1max, 'b');
hold on
xlabel('x');
ylabel('y');
title('Joint limits (BLUE) and singularities (RED)');

%% Singularities 
% Noteworthy singularities in theta2 = 0 and theta2 = pi
theta2_sing1=0; % link2 is totally extended
theta2_sing2=pi; % link2 is totally retracted

if theta2_sing1 > th2min && theta2_sing1 < th2max
    
    xsing1 = link1*cos(th1) + link2*cos(th1 + theta2_sing1);
    ysing1 = link1*sin(th1) + link2*sin(th1 + theta2_sing1);
    plot(xsing1, ysing1, 'r');
    hold on
end


if theta2_sing2 > th2min && theta2_sing2 < th2max
    
    xsing2 = link1*cos(th1) + link2*cos(th1 + theta2_sing2);
    ysing2 = link1*sin(th1) + link2*sin(th1 + theta2_sing2);
    plot(xsing2, ysing2, 'b');
    hold on
end





end