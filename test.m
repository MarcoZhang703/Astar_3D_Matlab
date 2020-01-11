% load MapData.mat;
% 
% figure(1);
% imshow(Final_Data);
% 
% figure(2);
% imshow(CLOSED);
% 
% figure(3);
% imshow(Display_Data);
% 
% figure(4)
% imshow(MAP);

%imread('depthToBgra1.jpg');
clc
clear
ptCloud = pcread('1.pcd');

figure(1)
pcshow(ptCloud);
grid on;


pcwrite(ptCloud, '1.ply');

figure(2)
pcshow('1.ply');
grid on;