%% 
% Spat_ref_visual
% 
% This code allows the exploration of the  spatial referencing in Multiresolution 
% Blocked Images. It generates a graphical visualization that shows how pixel 
% resolution changes across pyramid levels while world extents remain constant.
%% 
% Generate blocked image object. The blockedImage object automatically constructs 
% a multiresolution pyramid. All pyramid levels share the same *world-coordinate* 
% extents by default.

bim = blockedImage(fileName);
%% 
% Identify pyramid levels

numLevels = bim.NumLevels;
finestLevel = 1;
coarsestLevel = numLevels;
%% 
% Extract world-coordinate information

[finestStart, finestEnd] = deal(bim.WorldStart(finestLevel, :), ...
                                bim.WorldEnd(finestLevel, :));
[coarsestStart, coarsestEnd] = deal(bim.WorldStart(coarsestLevel, :), ...
                                    bim.WorldEnd(coarsestLevel, :));
%%
fprintf("Finest Level (%d) World Extents:\n", finestLevel);
disp(table(finestStart, finestEnd));

%%
fprintf("Coarsest Level (%d) World Extents:\n", coarsestLevel);
disp(table(coarsestStart, coarsestEnd));

%%
fprintf("\nNumber of pyramid levels: %d\n", numLevels);
fprintf("By default, all levels share identical world-coordinate extents.\n\n");
%% 
% Compute pixel dimensions at each level. Pixel dimensions change, becoming 
% smaller at finer levels and larger at coarser levels, but the world extent remains 
% constant.

pixelDims = zeros(numLevels, 2);
for L = 1:numLevels
    pixelDims(L, :) = bim.Size(L, 1:2);  % [rows, columns]
end
%% 
% Compute total number of pixels per level

totalPixels = prod(pixelDims, 2);
%% 
% Compute approximate pixel size in world units. World extent (in physical coordinates) 
% stays constant.

worldExtent = finestEnd - finestStart;
worldArea = prod(worldExtent(1:2));  % XY plane
pixelArea = worldArea ./ totalPixels;
pixelSize = sqrt(pixelArea);         % approximate per-pixel scale
%% 
% Visualize how resolution changes across levels

figure('Name', 'Pyramid Resolution Visualization', 'Color', 'w');
yyaxis left
plot(1:numLevels, totalPixels / 1e6, 'o-b', 'LineWidth', 1.5, 'MarkerSize', 8);
ylabel('Total Pixels (millions)');
xlabel('Pyramid Level');
title('Change in Resolution Across Blocked Image Levels');
grid on;
%%
yyaxis right
plot(1:numLevels, pixelSize, 's--r', 'LineWidth', 1.5, 'MarkerSize', 8);
ylabel('Pixel Size (approx. world units)');
legend({'Total Pixels', 'Pixel Size'}, 'Location', 'best');
%% 
% Summary table for inspection

summaryTable = table((1:numLevels)', pixelDims(:,1), pixelDims(:,2), ...
    repmat(worldExtent(1), numLevels, 1), repmat(worldExtent(2), numLevels, 1), ...
    totalPixels, pixelSize, ...
    'VariableNames', {'Level','Rows','Cols','WorldWidth','WorldHeight','TotalPixels','PixelSize'});
disp(summaryTable);

%% 
%