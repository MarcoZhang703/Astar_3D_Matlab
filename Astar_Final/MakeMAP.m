function [MAX_X, MAX_Y, MAX_Z, MIN_X ,MIN_Y ,MIN_Z, MAP ,CLOSED]=MakeMAP()
%%%%%%%%Make Data of Map%%%%%%%%
load ('Tr1.mat');
pc = pcread('2.ply'); 
%%%%%%Define The 2-D Map Array%%%%%
MAX_X = max(pc.Location(:,1));
MAX_Y = max(pc.Location(:,2));
MAX_Z = max(pc.Location(:,3));
MIN_X = min(pc.Location(:,1));
MIN_Y = min(pc.Location(:,2));
MIN_Z = min(pc.Location(:,3));
% Cut_Data = Final_Data(301:400,101:200);
% mesh(double(Cut_Data));
% MAX_Final_Data = max(max(Cut_Data));
% MIN_Final_Data = min(min(Cut_Data));
% for i=1:100
%     for j=1:100
%         New_Data(i,j) = ceil((Cut_Data(i,j)-MIN_Final_Data)/100);
%         Display_Data(i,j) = (Cut_Data(i,j)-MIN_Final_Data)/100;
%     end
% end
%%%%%%Map Matrix Initialization%%%%%%
in_X=ceil((MAX_X-MIN_X)/0.15);
in_Y=ceil((MAX_Y-MIN_Y)/0.15);
in_Z=ceil((MAX_Z-MIN_Z)/0.15);
MAP=2*(ones(in_X,in_Y,in_Z));%初始化地图，所有点是可行的
% Obtain Obstacle, Target and Robot Position获取障碍物、目标和机器人位置
% Initialize the MAP with input values
% Obstacle=-1,Target = 0,Robot=1,Space=2，-1代表障碍物，2代表可行点
%%%%%%%Make Random Terrain Data%%%%%%%
for i=2:2 % 自定义障碍物点，使之为-1
    for j=1:2
%         Z_UpData = New_Data(i,j);
%         for z = 1:Z_UpData
            MAP(i,j,1) = -1;
    end
end
%end
CLOSED=[];
% %Put all obstacles on the Closed list
k=1;% Dummy counter
for i=2:2%把所有的障碍物点放到closed列表里
    for j=1:2
%         Z_UpData = New_Data(i,j);
%         for z = 1:Z_UpData
            CLOSED(k,1)=i; 
            CLOSED(k,2)=j;
            CLOSED(k,3)=1;
            k=k+1;
     end        
end
% end
%%%%%%%%%输入禁飞区信息
% c2=size(CLOSED,1);%该语句返回的是矩阵CLOSED的行数
% for i_z=1:20
%     for i_x=1:100
%         for i_y=1:100
%             flag = 1;
%             Length = (i_x-30)^2 + (i_y-30)^2;            
%             for c1=1:c2
%                 if (i_x == CLOSED(c1,1) && i_y == CLOSED(c1,2) && i_z == CLOSED(c1,3))
%                     flag = 0;
%                 end
%             end
%             if Length <= 25 & flag == 1
%                 CLOSED(c2+1,1)=i_x;
%                 CLOSED(c2+1,2)=i_y;
%                 CLOSED(c2+1,3)=i_z;
%                 c2 = c2+1;
%             end
%         end
%     end
% end
%%%%%%%%%输入异常气象区域信息
% k = 1;
% c3 = size(CLOSED,1);
% for i_z=1:10
%     for i_x=1:100
%         for i_y=1:100
%             flag = 1;
%             Length = (i_x-60)^2 + (i_y-30)^2;            
%             for c1=1:c3
%                 if (i_x == CLOSED(c1,1) && i_y == CLOSED(c1,2) && i_z == CLOSED(c1,3))
%                     flag = 0;
%                 end
%             end
%             if Length <= 56.25 & flag == 1
%                 Threaten_Weather(k,1)=i_x;
%                 Threaten_Weather(k,2)=i_y;
%                 Threaten_Weather(k,3)=i_z;
%                 k = k+1;
%             end
%         end
%     end
% end
%save MapData MAX_X MAX_Y MAX_Z MIN_X MIN_Y MIN_Z MAP CLOSED Final_Data Display_Data
