%% 
% Spat_ref_vector
% 
% This code allows to set up and verify the spatial referencing information 
% of a |blockedImage| object. Blocked images work with multiresolution images, 
% in which image data is stored as a set of images at different resolution levels. 
%% 
% Create blocked image from Whole Slide Image (WSI) file 

bim = blockedImage(fileName);
%% 
% Define level indices

levels = [1, bim.NumLevels]; %[finest, coarsest]
%% 
% % Extract world coordinate information

worldInfo = arrayfun(@(L) struct( ...
    'Level', L, ...
    'Start', bim.WorldStart(L, :), ...
    'End', bim.WorldEnd(L, :)), ...
    levels);
%% 
% Display spatial referencing at finest and coarsest levels

fprintf("Spatial Referencing (Default World Coordinates):\n");
for k = 1:numel(worldInfo)
    fprintf("\nLevel %d:\n", worldInfo(k).Level);
    disp(table(worldInfo(k).Start, worldInfo(k).End, ...
        'VariableNames', {'WorldStart', 'WorldEnd'}));
end
%% 
% Visualize how pixel dimensions vary across levels while world coordinates 
% remain fixed

pixelSize = bim.SizeInBlocks .* bim.BlockSize;
disp(table((1:bim.NumLevels)', pixelSize, bim.WorldStart, bim.WorldEnd, ...
    'VariableNames', {'Level', 'PixelDims', 'WorldStart', 'WorldEnd'}));
%% 
%