img=dicomread("MR.zzzMRI_QA.5.dcm");
%img=imread("phantom.png");
corners=detectHarrisFeatures(img);

locs=corners.Location;
locs(locs(:,2)<48,:)=[];
corners=cornerPoints(locs);

left_corners=corners.Location;
left_corners=sortrows(left_corners,2);
left_corners(left_corners(:,1)>63,:)=[]; 
left_corners=cornerPoints(left_corners);

right_corners=corners.Location;
right_corners=sortrows(right_corners,2);
right_corners(right_corners(:,1)<189,:)=[];
right_corners=cornerPoints(right_corners);

top_corners=corners.Location;
top_corners=sortrows(top_corners,1);
top_corners(top_corners(:,2)>63,:)=[];
top_corners=cornerPoints(top_corners);

bot_corners=corners.Location;
bot_corners=sortrows(bot_corners,1);
bot_corners(bot_corners(:,2)<188,:)=[];
bot_corners=cornerPoints(bot_corners);

dist1=GetPointLineDistance(left_corners.Location(max(size(left_corners.Location)),:),left_corners.Location(1,:),left_corners.Location(round(max(size(left_corners.Location))/2),:));
dist2=GetPointLineDistance(right_corners.Location(max(size(right_corners.Location)),:),right_corners.Location(1,:),right_corners.Location(round(max(size(right_corners.Location))/2),:));
dist3=GetPointLineDistance(top_corners.Location(max(size(top_corners.Location)),:),top_corners.Location(1,:),top_corners.Location(round(max(size(top_corners.Location))/2),:));
dist4=GetPointLineDistance(bot_corners.Location(max(size(bot_corners.Location)),:),bot_corners.Location(1,:),bot_corners.Location(round(max(size(bot_corners.Location))/2),:));


imshow(img,[])
hold on; plot(left_corners)
hold on; plot(right_corners)
hold on; plot(top_corners)
hold on; plot(bot_corners)

score=dist4+dist3+dist2+dist1
