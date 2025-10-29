%% 
% create_block_img_obj
% 
% This Matlab code creates |blockedImage| Objects to Manage WSI Images. It creates 
% two arrays of |blockedImage| objects, one for normal images and one for the 
% tumor images. 
%% 
% Get list of normal and tumor training images 

normalDirListing = dir(fullfile(trainNormalDir,"normal*"));
tumorDirListing  = dir(fullfile(trainTumorDir,"tumor*"));
%% 
% Extract full file paths

normalFilenames = fullfile({normalDirListing.folder}, {normalDirListing.name});
tumorFilenames  = fullfile({tumorDirListing.folder}, {tumorDirListing.name});
%% 
% Create blockedImage arrays 

normalImages = arrayfun(@(f) blockedImage(f{1}), normalFilenames, 'UniformOutput', false);
tumorImages  = arrayfun(@(f) blockedImage(f{1}), tumorFilenames,  'UniformOutput', false);
%% 
% Convert from cell array to blockedImage array

normalImages = [normalImages{:}];
tumorImages  = [tumorImages{:}];
%% 
%