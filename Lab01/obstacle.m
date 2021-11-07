%?????
function obstacle(x0,y0,r0)
ang=0:0.01:2*pi; 
xp=r0*cos(ang);
yp=r0*sin(ang);
plot(x0+xp,y0+yp);
hold on;
end
