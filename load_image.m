function [result, PathName, numOfDB] = load_image()

PathName = uigetdir('*.*');            
listDBjpg = dir([PathName,'\*.jpg']);
listDBbmp = dir([PathName,'\*.bmp']);
listDBpng = dir([PathName,'\*.png']);
listDBtif = dir([PathName,'\*.tif']);
listDB = [listDBjpg;listDBbmp;listDBpng;listDBtif];
numOfDB = length(listDB);
% 
% 
% faceDetector = vision.CascadeObjectDetector;
% shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
% 
% for i = 1: numOfDB
%     img{i} = imread(listDB(i).name);
%     imshow(img{i});shg;
%     bbox = step(faceDetector, img{i});
%     % Draw boxes around detected faces and display results
%     I_faces = step(shapeInserter, img{i}, int32(bbox));
%     imshow(I_faces), title('Detected faces');
%     figure(i),imshow(img{i});
% end
result = listDB;