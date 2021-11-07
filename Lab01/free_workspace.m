function [] = free_workspace(link1, link2)

max_length = link1 + link2; % maximal length reached by the two links
min_length = abs(link1-link2); % minimal length reached by the two links

x_position = 0; % origin's position of the robot frame
y_position = 0;
theta1 = 0 : 0.01 : 2*pi; % for all the angles bewtween 0 and 2pi
theta2 = 0 : 0.01 : 2*pi;

max_x_reached = x_position + max_length * cos(theta1) ;
max_y_reached = y_position + max_length * sin(theta1) ;

min_x_reached = x_position + min_length * cos(theta1) ;
min_y_reached= y_position + min_length * sin(theta1) ;

figure, plot(max_x_reached, max_y_reached);
axis square;
xlim([-2.5, 2.5]);
ylim([-2.5, 2.5]);
grid on;
axis equal;
xlabel('x');
ylabel('y');
hold on
plot(min_x_reached, min_y_reached);
title('Robot workspace with no constraints');

end

