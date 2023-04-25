# ACV-S23-GroupProject
Final project on ACV
This repository looks at application of the Enhanced Deep Residual Networks (EDSR) for Super Resolution on the Aerial Imagery Dataset (AID).

## Location of material - 
Codes: ./Codebase/AID
Data: Download instructions in https://captain-whu.github.io/AID/. To place files in ./Data/AID/AIDoriginal

## Studies performed
We studied a few degradations of the image, from 1x, 2x, 4x, 8x, on a subset of the AID dataset.
Classes chosen: 
(Train) ['MediumResidential','Park','Parking','School','Square'],
(Test) ['DenseResidential','SparseResidential']
Bicubic interpolation was used to degrade the imagery.	
   
## Steps to reproduce experiment- 
1) Preprocessing (AID)
	a) ./Codebase/AID/AID-DataPreprocessing.ipynb
		Convert jpg to png, and construct lower resolution images of 2x and 4x.
	b) ./Codebase/AID/AID-TrainTestSplit.ipynb
		Splitting the data into Train, Valid, Test. Note a subset of the data is selected.
	c) ./Codebase/AID/AID-checkfiles.ipynb
		Checking the related folders to ensure all files are processed correctly. (Some possible issues with google drive due to lag).
	d) ./Codebase/AID/SRGAN-TrainTestSplit.ipynb and AID-TrainTestSplitx8.ipynb
		Preparing the data for SRGAN based on AID Train-Test split. 
	e) ./Codebase/AID/check_mean.m
		(Matlab code) Used to check the mean and standard deviation of the training data.

2) Training (EDSR) - Updated with latest links
a) 8x to 1x: ./Codebase/AID/AID-EDSR-04162023-4c.ipynb
b) 8x to 4x: ./Codebase/AID/AID-EDSR-04162023-4d.ipynb
c) 4x to 2x: ./Codebase/AID/AID-EDSR-04162023-4e.ipynb
d) 2x to 1x: ./Codebase/AID/AID-EDSR-04162023-4f.ipynb
e) 4x to 1x: ./Codebase/AID/AID-EDSR-04162023-4a.ipynb

3) Results generation in multi stage
a) 4x -> 2x -> 1x: ./Codebase/AID/(Eval4b)AID-EDSR-04162023-4.ipynb
b) 8x -> 4x -> 2x -> 1x: ./Codebase/AID/(Eval4)AID-EDSR-04162023-4.ipynb 

4) Evaluation
  a) ./Codebase/AID/(Quantitative4b)AID_EDSR_04162023_4.ipynb
    Runs through each of the image set (Super-res, Low-res interpolated, High-res) and compare them to extract PSNR, LPIPS and SSIM.  
  b) ./Codebase/AID/QuantitativeResults_Consolidated.ipynb
    Computes the mean and standard deviation of all extracted features.  
  c) ./Codebase/AID/compare_results.m
    Compares visually the results in Matlab via a GUI.

Thanks for your interest in this topic!


