%Reset items
clear all; close all; clc;

addpath Functions

%Options
opt_mode = 1; %1: Valid, 2: Test
date = '04172023';

%Linking ground truth with data
dir_LR = '../../Data/AID/AIDx8/';
dir_HR = '../../Data/AID/AIDx1/';
dir_8xto1x = '../../Data/AID/Outputs/EDSRp8x-Bicubic_X8_L1loss_lr1e4_04182023/Images_Valid/';
dir_multiOut = '../../Data/AID/Outputs/EDSRp4_eval8xto1x/2xto1x_valid/';

%Linking ground truth with data
class_dir = dir('../../Data/AID/AIDx1/');
classes = {};
count = 1;
for i = 3:length(class_dir)
    classes{count} = class_dir(i).name; 
    count = count + 1;
end 
classes

%Loop and create images
files = dir(dir_8xto1x);

%Loop and display
for i = 200    
    img_str = files(i).name;
    
    ind = strfind(img_str,'_');
    ind2 = find(strcmpi(classes,img_str(1:ind-1)) == 1);

    im_8xto1x = imread([dir_8xto1x img_str]);
    im_HR = imread([dir_HR classes{ind2} '/' img_str]);
    im_multiOut = imread([dir_multiOut img_str]);
    im_LR = imresize(imread([dir_LR classes{ind2} '/' img_str]),[600,600]);
    %im_LR = imread([dir_LR classes{ind2} '/' img_str]);

    %Displays
    maxfig(1);
    subplot(2,3,1); imagesc(abs(im_LR)); title('Low Res - 8x'); axis image off; 
    subplot(2,3,2); imagesc(abs(im_8xto1x)); title('Super Res 8x -> 1x'); axis image off;
    subplot(2,3,4); imagesc(abs(im_multiOut)); title('Super Res 8x -> 4x -> 2x -> 1x'); axis image off;
    subplot(2,3,5); imagesc(abs(im_HR)); title('High Res'); axis image off; 
    

    linkImg_sub(1,2,3,[1 2 4 5]);
    break

end
