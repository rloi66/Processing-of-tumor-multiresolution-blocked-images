%% 
% Spat_ref_a
% 
% This Matlab code creates a BlockedImage object with the default spatial referencing 
% information. By default, in a blocked image each level has the same world extents 
% as the finest layer. The spatial referencing of each level  is set to have the 
% same world extents as the finest layer. In a multiresolution image, the finest 
% layer is  the layer that has the highest resolution.
%% 
% Load the whole slide image as a blocked image

bim = blockedImage(fileName);
%% 
% Explore default spatial referencing. Identify image levels.

numLevels = bim.NumLevels; % Total number of levels
finestLevel = 1; % Level 1 = highest resolution                     
coarsestLevel = numLevels; % Last level = lower resolution 
%% 
% Get spatial referencing for the finest level

[finestStart, finestEnd] = deal(bim.WorldStart(finestLevel, :), ...
                                bim.WorldEnd(finestLevel, :));
%% 
% Retrieve spatial referencing for the coarsest level

[coarsestStart, coarsestEnd] = deal(bim.WorldStart(coarsestLevel, :), ...
                                    bim.WorldEnd(coarsestLevel, :));
%% 
% Display results

fprintf("Finest Level (%d) World Extents:\n", finestLevel);
disp(table(finestStart, finestEnd));
fprintf("Coarsest Level (%d) World Extents:\n", coarsestLevel);
disp(table(coarsestStart, coarsestEnd));

%% 
% Show relationship between levels

fprintf("\nNumber of levels: %d\n", numLevels);
%% 
%