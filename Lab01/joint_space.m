function []=joint_space(theta1_min, theta1_max, theta2_min, theta2_max)

figure 
rectangle('Position',[theta1_min theta2_min abs(theta1_max-theta1_min) abs(theta2_max-theta2_min)])
axis equal
xlabel('theta1');
ylabel('theta2');
title('Joint space');

end