load('shapes/Bunny/Bunny.mat');
verbose=1;



load('data/Parameters_5_10.mat');

Cameras=cam_camera_sampling(Para);

[faceRow, faceCols]=size(Shape.faceVIds);
[camRow, camCols]=size(Cameras);


for j=1 :camCols
    disp(j);
    Camera=Cameras{j};
   
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