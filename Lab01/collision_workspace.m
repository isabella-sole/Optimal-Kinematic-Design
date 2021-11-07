function [output1,output2] = collision_workspace(link1, link2, theta1_min, theta1_max, theta2_min, theta2_max, x0,y0, r0)

%transformation from degrees to radians
th1min = deg2rad(theta1_min);
th1max = deg2rad(theta1_max); 
th2min = deg2rad(theta2_min);
th2max = deg2rad(theta2_max);

%% Collision check
%Place object in position with coordinates and radius x0, y0, r0

obstacle(x0,y0,r0)
L_obst = sqrt(x0^2 + y0^2);
fprintf('L_obstacle = %f \n', L_obst)

%flags
flag1_below = 0;
flag1_above = 0;
flag2_below = 0;
flag2_above = 0;

if L_obst > link1+link2+r0 
    fprintf('Object out of boundary\n') 
elseif L_obst <= link1+link2+r0
        if L_obst <= link1
          fprintf('Object collision\n')
          %Check the angles of collisions 
          theta_obst = atan2(y0,x0);
          l1_first = sqrt(r0^2 + L_obst);
          theta_r = asin(L_obst/l1_first);
          
          theta1_small = theta_obst - theta_r;
          theta1_big = theta_obst + theta_r;
          
          % Check if theta is in the workspace boundary
          if theta1_small>= th1min && theta1_small <= th1max
              fprintf('Collision with the object (below) at theta1=%f\n',  theta1_small)
              flag1_below = 1;
          end
          
          if theta1_big >= th1min && theta1_big <= th1max
              fprintf('Collision with the object (above) at theta1=%f \n', theta1_big)
              flag1_above = 1;
          end 
          
          %If collision with link1 happens, check if it collides with link2
          if flag1_above == 1 
            l1_second = link1 - l1_first;
            r_l2_dist = sqrt(r0^2 + l1_second);
            theta2_low = -(pi - 2*asin(r0/r_l2_dist)); %CLOCKWISE
            %If theta2_above is withing the th2 boundaries
            if theta2_low >= th2min 
                fprintf('Object collides from above at THETA2=%f\n',  theta2_low)
                flag2_above = 1; %Flag = 1
            end
          
          %If l1 collides from below
          if flag1_below == 1
            l1_second = link1 - l1_first;
            r_l2_dist = sqrt(r0^2 + l1_second);
            theta2_high = pi - 2*asin(r0/r_l2_dist); %COUTNERCLOCKWISE
            %If theta2_above is withing the th2 boundaries
            if theta2_high <=th2max
                fprintf('Object collides (below) at theta2=%f\n',  theta2_high)
                flag2_below = 1; %My flag = 1
            end
 
          end
              
        elseif L_obst > link1
              theta_obst = atan2(y0,x0);
              if theta_obst <= th1max+th2max && theta_obst >= th1min+th2min
                 fprintf('Object is in reach of and can collide with arm2')
              end

        end
          
   
       
end
end
%% Plotting my modified workspace

% Various cases when the robot hits the object
% Print the workspace using the reduced_workspace_obstacle
% 16 cases to plot

if flag1_below == 0 && flag1_above == 0
    % Notice that I won't plot the workspace obstacle hits link2
    if flag2_below == 0 && flag2_above == 0   %theta 2 doesn't hit
      reduced_workspace_obstacle(link1, link2, th1min, th1max, th2min, th2max)
    end
    if flag2_below == 0 && flag2_above == 1   %theta2 hits from the right (counterclockwise)
      reduced_workspace_obstacle(link1, link2, th1min, th1max, theta2_low, th2max)
    end
    if flag2_below == 1 && flag2_above == 0   %theta2 hits from the left (clockwise)
      reduced_workspace_obstacle(link1, link2, th1min, th1max, th2min, theta2_high)  
    end
    if flag2_below == 1 && flag2_above == 1   %theta2 can hits from both sides
      reduced_workspace_obstacle(link1, link2, th1min, th1max, theta2_low, theta2_high)
    end
    
elseif flag1_below == 1 && flag1_above == 0
    
    if flag2_below == 0 && flag2_above == 0   %theta 2 doesnt hit
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, th2min, th2max)
    end
    if flag2_below == 0 && flag2_above == 1   %theta2 hits from the right (counterclockwise)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, theta2_low, th2max)
    end
    if flag2_below == 1 && flag2_above == 0   %theta2 hits from the left (clockwise)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, th2min, theta2_high)  
    end
    if flag2_below == 1 && flag2_above == 1   %theta2 can hits from both sides
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, theta2_low, theta2_high)
    end
     
elseif flag1_below == 0 && flag1_above == 1
    
    if flag2_below == 0 && flag2_above == 0   %theta 2 doesnt hit
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, th2min, th2max)
    end
    if flag2_below == 0 && flag2_above == 1   %theta2 hits from the right (counterclockwise)
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, theta2_low, th2max)
    end
    if flag2_below == 1 && flag2_above == 0   %theta2 hits from the left (clockwise)
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, th2min, theta2_high)  
    end
    if flag2_below == 1 && flag2_above == 1   %theta2 can hits from both sides
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, theta2_low, theta2_high)
    end
    
elseif flag1_below == 1 && flag1_above == 1
    
    if flag2_below == 0 && flag2_above == 0   %theta 2 doesnt hit
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, th2min, th2max)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, th2min, th2max)
    end
    if flag2_below == 0 && flag2_above == 1   %theta2 hits from the right (counterclockwise)
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, theta2_low, th2max)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, theta2_low, th2max)
    end
    if flag2_below == 1 && flag2_above == 0   %theta2 hits from the left (clockwise)
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, th2min, theta2_high)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, th2min, theta2_high)
    end
    if flag2_below == 1 && flag2_above == 1   %theta2 can hits from both sides
      reduced_workspace_obstacle(link1, link2, th1min, theta1_small, theta2_low, theta2_high)
      reduced_workspace_obstacle(link1, link2, theta1_big, th1max, theta2_low, theta2_high)
    end
    
end    


end
