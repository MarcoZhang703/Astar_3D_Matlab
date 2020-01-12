pc = pcread('2.ply'); %读入点云文件
%pcshow(pc)
figure(1) 
pc_tmp(:,1) = pc.Location(:,1);     %调整点云的方位的和xyz轴
pc_tmp(:,2) = pc.Location(:,2);
pc_tmp(:,3) = pc.Location(:,3);
pc_col = pc.Color
pcshow(pc_tmp,pc.Color)
