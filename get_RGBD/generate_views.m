load('shapes/Bunny/Bunny.mat');
verbose=1;



load('data/Parameters_5_10.mat');
% Para.nHeight=10000;
% Para.nWidth=10000;
% Para.elevationMin=-pi/2;
% Para.numElevation=5;
% Para.numAzimuth=10;
% Para.elevationMax=pi/2;
% Para.elevationMin=-1.4;
% Para.elevationMax=1.4;
Cameras=cam_camera_sampling(Para);
%Cameras=camera_sampling(Para);
[faceRow, faceCols]=size(Shape.faceVIds);
[camRow, camCols]=size(Cameras);


for j=1 :camCols %74,75 error
    disp(j);
    Camera=Cameras{j};
    %Camera.origin=-Camera.origin;
    [meshPoints, renderImage]=co_ray_tracing(Shape, Camera);
    ids = find(meshPoints(4,:) < 1e5);
    meshPoints = meshPoints(:, ids);
    [meshRow, meshCols]=size(meshPoints);
    %output the result
    imfilename = sprintf('%s_%d','results/Bunny/Bunny_',j); 
    imwrite(renderImage,[imfilename,'.jpg']);
    save([imfilename,'.mat'],'renderImage');
    save([imfilename,'Mesh.mat'],'meshPoints');
end