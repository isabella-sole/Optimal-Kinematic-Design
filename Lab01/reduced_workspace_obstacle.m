function [outputArg1,outputArg2] = reduced_workspace_obstacle(link1, link2, theta1_min, theta1_max, theta2_min, theta2_max)
%% Constrained Robot Workspace
%Considering Joint Limits and Singularities

%transformation from degrees to radians
th1min=theta1_min;
th1max=theta1_max; 
th2min=theta2_min;
th2max=theta2_max;

%defining unit step rotations of my angles
th1 = th1min:pi/100:th1max;
th2 = th2min:pi/100:th2max;

% DGM in the report
%keep fixed theta2 @ min, then move th1 
x1min = link1*cos(th1) + link2*cos(th1 + th2min);
y1min = link1*sin(th1) + link2*sin(th1 +th2min);

%keep fixed theta2 @ max, then move th1 
x1max = link1*cos(th1) + link2*cos(th1 + th2max);
y1max = link1*sin(th1) + link2*sin(th1 +th2max);

%keep fixed theta1 @ min, then move th2 
x2min = link1*cos(th1min) + link2*cos(th1min + th2);
y2min = link1*sin(th1min) + link2*sin(th1min +th2);

%keep fixed theta1 @ max then move th2 
x2max = link1*cos(th1max) + link2*cos(th1max + th2);
y2max = link1*sin(th1max) + link2*sin(th1max +th2);
plot(x1min, y1min, 'k');
hold on;
plot(x1max, y1max, 'k');
hold on;
plot(x2min, y2min, 'k');
hold on;
plot(x2max, y2max, 'k');
hold on;

%% Singularities 
%The only meaningful singularity is at theta2 = 0 or theta2=pi
theta2_sing1=0; %When link2 is FULLY EXTENDED
theta2_sing2=pi; %When link2 is FULLY RETRACRTED

%I make some checks to ever see if the singularity enters withing the
%boundary & the limits
if theta2_sing1 > th2min && theta2_sing1 < th2max
    
    xsing1 = link1*cos(th1) + link2*cos(th1 + theta2_sing1);
    ysing1 = link1*sin(th1) + link2*sin(th1 + theta2_sing1);
    plot(xsing1, ysing1, 'r');
    hold on;
end


if theta2_sing2 > th2min && theta2_sing2 < th2max
    
    xsing2 = link1*cos(th1) + link2*cos(th1 + theta2_sing2);
    ysing2 = link1*sin(th1) + link2*sin(th1 + theta2_sing2);
    plot(xsing2, ysing2, 'b');
    hold on;
end



end