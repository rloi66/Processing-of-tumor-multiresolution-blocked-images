%% 
% aspect_rat_a
% 
% This Matlab code allows to verify the aspect ratio of blocked images derived 
% from Whole Slide Images (WSI). It allows to display the image size and aspect 
% ratio at each level. If the aspect ratio  is not consistent, this indicates 
% that levels do not all span the same  world area. 
%% 
% Create blocked image object from WSI image

bim = blockedImage(fileName);
%% 
% Determine number of resolution levels in the blocked image

numLevels = bim.NumLevels;
%% 
% Initialize arrays to store results

heights = zeros(numLevels,1);
widths  = zeros(numLevels,1);
aspectRatios = zeros(numLevels,1);
%% 
% Loop through each level and extract image size

for level = 1:numLevels
    dims = bim.Size(level, 1:2);     % [height, width]
    heights(level) = dims(1);
    widths(level)  = dims(2);
    aspectRatios(level) = heights(level) / widths(level);
end
%% 
% Combine into a table

aspectTable = table((1:numLevels)', heights, widths, aspectRatios, ...
    'VariableNames', {'Level','Height','Width','AspectRatio'});
%% 
% Display results

disp("Aspect ratio verification for each image level:");
disp(aspectTable);
%% 
% Verify constant ratio across levels

if all(abs(aspectRatios - aspectRatios(1)) < 1e-6)
    disp("✅ Aspect ratio is consistent across all pyramid levels.");
else
    warning("⚠️ Aspect ratio differs across levels.");
end
%% 
%