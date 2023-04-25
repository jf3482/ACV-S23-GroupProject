%Reset items
clear all; close all; clc;

%Extract Directories
dir_train_HR = '../../Data/AID/Train1_5class/train_HR/';
dir_train_LRx2 = '../../Data/AID/Train1_5class/train_LRx2/';
dir_train_LRx4 = '../../Data/AID/Train1_5class/train_LRx4/';

%Extract all images within directories and compute mean/std 
disp('Extracting high res images')
files = dir(dir_train_HR);
im = zeros(600,600,3,(length(files)-2)/offset);
count = 1;
for i = 3:offset:length(files)
    im(:,:,:,count) = imread([dir_train_HR files(i).name]);
    count = count + 1;
end

disp('Extracting low res x2 images')
files = dir(dir_train_LRx2);
im2 = zeros(300,300,3,(length(files)-2)/offset);
count = 1;
for i = 3:offset:length(files)
    im2(:,:,:,count) = imread([dir_train_LRx2 files(i).name]);
    count = count + 1;
end

disp('Extracting low res x4 images')
files = dir(dir_train_LRx4);
im3 = zeros(150,150,3,(length(files)-2)/offset);
count = 1;
for i = 3:offset:length(files)
    im3(:,:,:,count) = imread([dir_train_LRx4 files(i).name]);
    count = count + 1;
end

%Compute Mean and STD of dataset
data_mean = permute((mean(im,[1,2,4])+mean(im2,[1,2,4])+mean(im3,[1,2,4]))./3,[3,1,2])./255
data_std = permute((std(im,0,[1,2,4]) + std(im2,0,[1,2,4]) + std(im3,0,[1,2,4]))./3,[3,1,2])./255


