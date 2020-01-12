% codes below are used to extract detail information from .ply files
clc
clear

ply_file = pcread('1_process.ply');

% figure(1);
% pcshow(ply_file);

% Generate Final_Data!!!!!!!!!!!!


%FIND MAX_X, MAX_Y, MAX_Z.
[max_xyz,index]=max(ply_file.Location,[],1);
MAX_X = max_xyz(1);
MAX_Y = max_xyz(2);
MAX_Z = max_xyz(3);



Cut_Data = Final_Data(301:400,101:200);
mesh(double(Cut_Data));
MAX_Final_Data = max(max(Cut_Data));
MIN_Final_Data = min(min(Cut_Data));

for i=1:100
    for j=1:100
        New_Data(i,j) = ceil((Cut_Data(i,j)-MIN_Final_Data)/100);
        Display_Data(i,j) = (Cut_Data(i,j)-MIN_Final_Data)/100;
    end
end
% Generate MAP DATA
%%%%%%Map Matrix Initialization%%%%%%
MAP=2*(ones(MAX_X,MAX_Y,MAX_Z));
% Obtain Obstacle, Target and Robot Position
% Initialize the MAP with input values
% Obstacle = -1,Target = 0,Robot = 1,Space = 2
%%%%%%%Make Random Terrain Data%%%%%%%
for i=1:MAX_X
    for j=1:MAX_Y
        Z_UpData = New_Data(i,j);
        for z = 1:Z_UpData
            MAP(i,j,z) = -1;
        end
    end
end

% Generate CLOSED DATA
CLOSED=[];
% Put all obstacles on the Closed list
k=1; % Dummy counter
for i=1:MAX_X % Put all obstacles on the Closed list
    for j=1:MAX_Y
        Z_UpData = New_Data(i,j);
        for z = 1:Z_UpData
            CLOSED(k,1)=i; 
            CLOSED(k,2)=j;
            CLOSED(k,3)=z;
            k=k+1;
        end        
    end
end
%%%%%%%%% ???????
c2=size(CLOSED,1); % ?????????CLOSED???
for i_z=1:20
    for i_x=1:100
        for i_y=1:100
            flag = 1;
            Length = (i_x-30)^2 + (i_y-30)^2;            
            for c1=1:c2
                if (i_x == CLOSED(c1,1) && i_y == CLOSED(c1,2) && i_z == CLOSED(c1,3))
                    flag = 0;
                end
            end
            if Length <= 25 & flag == 1
                CLOSED(c2+1,1)=i_x;
                CLOSED(c2+1,2)=i_y;
                CLOSED(c2+1,3)=i_z;
                c2 = c2+1;
            end
        end
    end
end

% Generate Display_Data
Cut_Data = Final_Data(301:400,101:200);
mesh(double(Cut_Data));
MAX_Final_Data = max(max(Cut_Data));
MIN_Final_Data = min(min(Cut_Data));
for i=1:100
    for j=1:100
        New_Data(i,j) = ceil((Cut_Data(i,j)-MIN_Final_Data)/100);
        Display_Data(i,j) = (Cut_Data(i,j)-MIN_Final_Data)/100;
    end
end


% Save Data
save MapData MAX_X MAX_Y MAX_Z MAP CLOSED Final_Data Display_Data