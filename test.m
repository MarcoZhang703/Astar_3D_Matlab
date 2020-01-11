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
% clc
% clear
% ptCloud = pcread('./damn/5.pcd');
% 
% figure(1)
% pcshow(ptCloud);
% grid on;
% 
% figure(2);
% pcshow('1.ply');
% title('PLY Point Cloud')
% grid on;
% 
% pcwrite(ptCloud, './damn/5.ply');
pcread('1_process.ply');

figure(1);
pcshow('1_process.ply');
grid on;
