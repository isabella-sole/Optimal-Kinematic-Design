% Main file : EnveloppeRR.m
% Author : Quentin Pierron - Philippe Wenger
% February 2013 - october 2018
% Openq a window and draw the envelope of the workspace of a SCARA robot.
% The workspace depends on the joints limits th1min, th1max, th2min, th2max 
% on the obstacle position (x0,y0) and radius r0.

% initialization
close all
clear all
clc

l1 = 1;
l2 = 1;
th1min = -130;
th1max = 100;
th2min = -120;
th2max = 150;
x0 = 2;
y0 = 2;
r0 = 0.5;
% display
affichage( l1, l2, th1min, th1max, th2min, th2max, x0, y0, r0);