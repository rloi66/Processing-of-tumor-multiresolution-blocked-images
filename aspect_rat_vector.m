%% 
% aspect_rat_vector
% 
% This Matlab code applies vectorization to explore the spatial referencing 
% of blocked images derived from Whole Slide Images (WSI). It allows to display 
% the image size and aspect ratio at each level. 

bim = blockedImage(fileName);
%% 
% Extract height and width directly

heights = bim.Size(:,1);
widths  = bim.Size(:,2);
%% 
% Compute aspect ratio 

aspectRatios = heights ./ widths;
%% 
% Assemble into table dynamically based on the number of levels

aspectTable = table((1:bim.NumLevels)', heights, widths, aspectRatios, ...
    'VariableNames', {'Level','Height','Width','AspectRatio'});
%% 
% Display results

disp("Aspect ratio verification across levels:");
disp(aspectTable);
%% 
% Visualize how the height, width, and aspect ratio evolve across pyramid levels

figure('Color','w','Name','Aspect Ratio Verification');
subplot(1,2,1);
plot(1:bim.NumLevels, heights, 'o-b', 'LineWidth', 1.5); hold on;
plot(1:bim.NumLevels, widths, 's--r', 'LineWidth', 1.5);
xlabel('Pyramid Level'); ylabel('Pixels');
title('Image Dimensions Across Levels');
legend({'Height','Width'}, 'Location', 'best');
grid on;
%%
subplot(1,2,2);
plot(1:bim.NumLevels, aspectRatios, 'd-m', 'LineWidth', 1.5);
xlabel('Pyramid Level'); ylabel('Aspect Ratio (H/W)');
title('Aspect Ratio Consistency');
grid on;
%% 
%