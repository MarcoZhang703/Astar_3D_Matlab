%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A* Terrain Profile ALGORITHM Demo
% Traditional A* search demo 3D
% 01-31-2014
% Design by ybma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear

%load ('Tr1.mat');
WayPoints = [];
WayPointsAll = [];
OPEN_COUNT = 0;
OPEN_COUNT_ALL = 0;

% Set Starting Point&Targeting Point
start_point = [-2,-0.5,4.5]
target_point = [0.5,0,1]

% start_point = [0,0,0]
% target_point = [0.3,0.3,0.3]

%%%%%%%ALGORITHM START%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Compute time%%%%%%%%%%%
tic
timerVal = tic
MapData=load('MapData.mat');
Display_Data=MapData.Display_Data
[MAX_X, MAX_Y, MAX_Z, MIN_X ,MIN_Y ,MIN_Z, MAP ,CLOSED]=MakeMAP()
[WayPoints,OPEN_COUNT] = A_star(MAX_X,MAX_Y,MAX_Z,start_point(1),start_point(2),start_point(3),target_point(1),target_point(2),target_point(3),MAP,CLOSED,Display_Data);

toc(timerVal)
elapsedTime = toc(timerVal)

% Display Point Cloud
figure(1)
pc = pcread('2.ply');
pcshow(pc)
hold on


axis([MIN_X MAX_X MIN_Y MAX_Y 0 MAX_Z]);%绘制坐标值
plot3(WayPoints(:,1),WayPoints(:,2),WayPoints(:,3),'r','linewidth',2);
hold on % 保留当前坐标区中的绘图，从而使新添加到坐标区中的绘图不会删除现有绘图。新绘图基于坐标区的 ColorOrder 和 LineStyleOrder 属性使用后续的颜色和线型。
%surf(Display_Data(1:100,1:100)','linestyle','none');%surf函数用于绘制曲面

% Draw Starting Point&Targeting Point
plot3(start_point(1),start_point(2),start_point(3),'*');
plot3(target_point(1),target_point(2),target_point(3),'^');


% Draw Axis Details
xlabel('纬度');
ylabel('经度');
zlabel('高度（m）');
grid on

view(-90,-90)







