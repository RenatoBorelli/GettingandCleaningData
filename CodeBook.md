---
title: "CodeBook"
author: "José Renato Borelli"
date: "Sunday, September 21, 2014"
---

Codebook

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median 
filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation


Variable list and descriptions

Variable        name            Description
subject	        ID              subjects performed activities, represented by number from 1 to 30.
activity	Activity        Activity names

Feature Variables (only the mean and std):
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [4] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
[10] "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
[28] "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[34] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"    
[40] "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
[52] "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[58] "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 




Tidy Dataset structure:

> str(xysdata_Actv_MEAN)
Classes ‘data.table’ and 'data.frame':        180 obs. of  68 variables:
 $ Subject                    : int  1 1 1 1 1 1 2 2 2 2 ...
 $ Activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ tBodyAcc-mean()-X          : num  0.222 0.261 0.279 0.277 0.289 ...
 $ tBodyAcc-mean()-Y          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ tBodyAcc-mean()-Z          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ tBodyAcc-std()-X           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ tBodyAcc-std()-Y           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ tBodyAcc-std()-Z           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ tGravityAcc-mean()-X       : num  -0.249 0.832 0.943 0.935 0.932 ...
 $ tGravityAcc-mean()-Y       : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 $ tGravityAcc-mean()-Z       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ tGravityAcc-std()-X        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ tGravityAcc-std()-Y        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ tGravityAcc-std()-Z        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ tBodyAccJerk-mean()-X      : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ tBodyAccJerk-mean()-Y      : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ tBodyAccJerk-mean()-Z      : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ tBodyAccJerk-std()-X       : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ tBodyAccJerk-std()-Y       : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ tBodyAccJerk-std()-Z       : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ tBodyGyro-mean()-X         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ tBodyGyro-mean()-Y         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ tBodyGyro-mean()-Z         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ tBodyGyro-std()-X          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ tBodyGyro-std()-Y          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ tBodyGyro-std()-Z          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ tBodyGyroJerk-mean()-X     : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ tBodyGyroJerk-mean()-Y     : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ tBodyGyroJerk-mean()-Z     : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ tBodyGyroJerk-std()-X      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ tBodyGyroJerk-std()-Y      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ tBodyGyroJerk-std()-Z      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ tBodyAccMag-mean()         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tBodyAccMag-std()          : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tGravityAccMag-mean()      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tGravityAccMag-std()       : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tBodyAccJerkMag-mean()     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ tBodyAccJerkMag-std()      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ tBodyGyroMag-mean()        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ tBodyGyroMag-std()         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ tBodyGyroJerkMag-mean()    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ tBodyGyroJerkMag-std()     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ fBodyAcc-mean()-X          : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ fBodyAcc-mean()-Y          : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ fBodyAcc-mean()-Z          : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ fBodyAcc-std()-X           : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ fBodyAcc-std()-Y           : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ fBodyAcc-std()-Z           : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ fBodyAccJerk-mean()-X      : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ fBodyAccJerk-mean()-Y      : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ fBodyAccJerk-mean()-Z      : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ fBodyAccJerk-std()-X       : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ fBodyAccJerk-std()-Y       : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ fBodyAccJerk-std()-Z       : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ fBodyGyro-mean()-X         : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ fBodyGyro-mean()-Y         : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ fBodyGyro-mean()-Z         : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ fBodyGyro-std()-X          : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ fBodyGyro-std()-Y          : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ fBodyGyro-std()-Z          : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ fBodyAccMag-mean()         : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ fBodyAccMag-std()          : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ fBodyBodyAccJerkMag-mean() : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ fBodyBodyAccJerkMag-std()  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ fBodyBodyGyroMag-mean()    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ fBodyBodyGyroMag-std()     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ fBodyBodyGyroJerkMag-mean(): num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ fBodyBodyGyroJerkMag-std() : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
 - attr(*, ".internal.selfref")=<externalptr> 
 
Summary the tidy dataset:

> summary(xysdata_Actv_MEAN)
    Subject                   Activity  tBodyAcc-mean()-X tBodyAcc-mean()-Y   tBodyAcc-mean()-Z 
 Min.   : 1.0   LAYING            :30   Min.   :0.2216    Min.   :-0.040514   Min.   :-0.15251  
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712    1st Qu.:-0.020022   1st Qu.:-0.11207  
 Median :15.5   STANDING          :30   Median :0.2770    Median :-0.017262   Median :-0.10819  
 Mean   :15.5   WALKING           :30   Mean   :0.2743    Mean   :-0.017876   Mean   :-0.10916  
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800    3rd Qu.:-0.014936   3rd Qu.:-0.10443  
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015    Max.   :-0.001308   Max.   :-0.07538  
 tBodyAcc-std()-X  tBodyAcc-std()-Y   tBodyAcc-std()-Z  tGravityAcc-mean()-X tGravityAcc-mean()-Y
 Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.6800      Min.   :-0.47989    
 1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.: 0.8376      1st Qu.:-0.23319    
 Median :-0.7526   Median :-0.50897   Median :-0.6518   Median : 0.9208      Median :-0.12782    
 Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756   Mean   : 0.6975      Mean   :-0.01621    
 3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.: 0.9425      3rd Qu.: 0.08773    
 Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090   Max.   : 0.9745      Max.   : 0.95659    
 tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
 Min.   :-0.49509     Min.   :-0.9968     Min.   :-0.9942     Min.   :-0.9910    
 1st Qu.:-0.11726     1st Qu.:-0.9825     1st Qu.:-0.9711     1st Qu.:-0.9605    
 Median : 0.02384     Median :-0.9695     Median :-0.9590     Median :-0.9450    
 Mean   : 0.07413     Mean   :-0.9638     Mean   :-0.9524     Mean   :-0.9364    
 3rd Qu.: 0.14946     3rd Qu.:-0.9509     3rd Qu.:-0.9370     3rd Qu.:-0.9180    
 Max.   : 0.95787     Max.   :-0.8296     Max.   :-0.6436     Max.   :-0.6102    
 tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X
 Min.   :0.04269       Min.   :-0.0386872    Min.   :-0.067458     Min.   :-0.9946     
 1st Qu.:0.07396       1st Qu.: 0.0004664    1st Qu.:-0.010601     1st Qu.:-0.9832     
 Median :0.07640       Median : 0.0094698    Median :-0.003861     Median :-0.8104     
 Mean   :0.07947       Mean   : 0.0075652    Mean   :-0.004953     Mean   :-0.5949     
 3rd Qu.:0.08330       3rd Qu.: 0.0134008    3rd Qu.: 0.001958     3rd Qu.:-0.2233     
 Max.   :0.13019       Max.   : 0.0568186    Max.   : 0.038053     Max.   : 0.5443     
 tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y
 Min.   :-0.9895      Min.   :-0.99329     Min.   :-0.20578   Min.   :-0.20421  
 1st Qu.:-0.9724      1st Qu.:-0.98266     1st Qu.:-0.04712   1st Qu.:-0.08955  
 Median :-0.7756      Median :-0.88366     Median :-0.02871   Median :-0.07318  
 Mean   :-0.5654      Mean   :-0.73596     Mean   :-0.03244   Mean   :-0.07426  
 3rd Qu.:-0.1483      3rd Qu.:-0.51212     3rd Qu.:-0.01676   3rd Qu.:-0.06113  
 Max.   : 0.3553      Max.   : 0.03102     Max.   : 0.19270   Max.   : 0.02747  
 tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyroJerk-mean()-X
 Min.   :-0.07245   Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855   Min.   :-0.15721      
 1st Qu.: 0.07475   1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609   1st Qu.:-0.10322      
 Median : 0.08512   Median :-0.7890   Median :-0.8017   Median :-0.8010   Median :-0.09868      
 Mean   : 0.08744   Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164   Mean   :-0.09606      
 3rd Qu.: 0.10177   3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106   3rd Qu.:-0.09110      
 Max.   : 0.17910   Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649   Max.   :-0.02209      
 tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y
 Min.   :-0.07681       Min.   :-0.092500      Min.   :-0.9965       Min.   :-0.9971      
 1st Qu.:-0.04552       1st Qu.:-0.061725      1st Qu.:-0.9800       1st Qu.:-0.9832      
 Median :-0.04112       Median :-0.053430      Median :-0.8396       Median :-0.8942      
 Mean   :-0.04269       Mean   :-0.054802      Mean   :-0.7036       Mean   :-0.7636      
 3rd Qu.:-0.03842       3rd Qu.:-0.048985      3rd Qu.:-0.4629       3rd Qu.:-0.5861      
 Max.   :-0.01320       Max.   :-0.006941      Max.   : 0.1791       Max.   : 0.2959      
 tBodyGyroJerk-std()-Z tBodyAccMag-mean() tBodyAccMag-std() tGravityAccMag-mean()
 Min.   :-0.9954       Min.   :-0.9865    Min.   :-0.9865   Min.   :-0.9865      
 1st Qu.:-0.9848       1st Qu.:-0.9573    1st Qu.:-0.9430   1st Qu.:-0.9573      
 Median :-0.8610       Median :-0.4829    Median :-0.6074   Median :-0.4829      
 Mean   :-0.7096       Mean   :-0.4973    Mean   :-0.5439   Mean   :-0.4973      
 3rd Qu.:-0.4741       3rd Qu.:-0.0919    3rd Qu.:-0.2090   3rd Qu.:-0.0919      
 Max.   : 0.1932       Max.   : 0.6446    Max.   : 0.4284   Max.   : 0.6446      
 tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyGyroMag-mean()
 Min.   :-0.9865      Min.   :-0.9928        Min.   :-0.9946       Min.   :-0.9807    
 1st Qu.:-0.9430      1st Qu.:-0.9807        1st Qu.:-0.9765       1st Qu.:-0.9461    
 Median :-0.6074      Median :-0.8168        Median :-0.8014       Median :-0.6551    
 Mean   :-0.5439      Mean   :-0.6079        Mean   :-0.5842       Mean   :-0.5652    
 3rd Qu.:-0.2090      3rd Qu.:-0.2456        3rd Qu.:-0.2173       3rd Qu.:-0.2159    
 Max.   : 0.4284      Max.   : 0.4345        Max.   : 0.4506       Max.   : 0.4180    
 tBodyGyroMag-std() tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() fBodyAcc-mean()-X
 Min.   :-0.9814    Min.   :-0.99732        Min.   :-0.9977        Min.   :-0.9952  
 1st Qu.:-0.9476    1st Qu.:-0.98515        1st Qu.:-0.9805        1st Qu.:-0.9787  
 Median :-0.7420    Median :-0.86479        Median :-0.8809        Median :-0.7691  
 Mean   :-0.6304    Mean   :-0.73637        Mean   :-0.7550        Mean   :-0.5758  
 3rd Qu.:-0.3602    3rd Qu.:-0.51186        3rd Qu.:-0.5767        3rd Qu.:-0.2174  
 Max.   : 0.3000    Max.   : 0.08758        Max.   : 0.2502        Max.   : 0.5370  
 fBodyAcc-mean()-Y  fBodyAcc-mean()-Z fBodyAcc-std()-X  fBodyAcc-std()-Y   fBodyAcc-std()-Z 
 Min.   :-0.98903   Min.   :-0.9895   Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872  
 1st Qu.:-0.95361   1st Qu.:-0.9619   1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459  
 Median :-0.59498   Median :-0.7236   Median :-0.7470   Median :-0.51338   Median :-0.6441  
 Mean   :-0.48873   Mean   :-0.6297   Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824  
 3rd Qu.:-0.06341   3rd Qu.:-0.3183   3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655  
 Max.   : 0.52419   Max.   : 0.2807   Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871  
 fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z fBodyAccJerk-std()-X
 Min.   :-0.9946       Min.   :-0.9894       Min.   :-0.9920       Min.   :-0.9951     
 1st Qu.:-0.9828       1st Qu.:-0.9725       1st Qu.:-0.9796       1st Qu.:-0.9847     
 Median :-0.8126       Median :-0.7817       Median :-0.8707       Median :-0.8254     
 Mean   :-0.6139       Mean   :-0.5882       Mean   :-0.7144       Mean   :-0.6121     
 3rd Qu.:-0.2820       3rd Qu.:-0.1963       3rd Qu.:-0.4697       3rd Qu.:-0.2475     
 Max.   : 0.4743       Max.   : 0.2767       Max.   : 0.1578       Max.   : 0.4768     
 fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y
 Min.   :-0.9905      Min.   :-0.993108    Min.   :-0.9931    Min.   :-0.9940   
 1st Qu.:-0.9737      1st Qu.:-0.983747    1st Qu.:-0.9697    1st Qu.:-0.9700   
 Median :-0.7852      Median :-0.895121    Median :-0.7300    Median :-0.8141   
 Mean   :-0.5707      Mean   :-0.756489    Mean   :-0.6367    Mean   :-0.6767   
 3rd Qu.:-0.1685      3rd Qu.:-0.543787    3rd Qu.:-0.3387    3rd Qu.:-0.4458   
 Max.   : 0.3498      Max.   :-0.006236    Max.   : 0.4750    Max.   : 0.3288   
 fBodyGyro-mean()-Z fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean()
 Min.   :-0.9860    Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.9868   
 1st Qu.:-0.9624    1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.9560   
 Median :-0.7909    Median :-0.8086   Median :-0.7964   Median :-0.8224   Median :-0.6703   
 Mean   :-0.6044    Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.5365   
 3rd Qu.:-0.2635    3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.:-0.1622   
 Max.   : 0.4924    Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.5866   
 fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-mean()
 Min.   :-0.9876   Min.   :-0.9940            Min.   :-0.9944           Min.   :-0.9865        
 1st Qu.:-0.9452   1st Qu.:-0.9770            1st Qu.:-0.9752           1st Qu.:-0.9616        
 Median :-0.6513   Median :-0.7940            Median :-0.8126           Median :-0.7657        
 Mean   :-0.6210   Mean   :-0.5756            Mean   :-0.5992           Mean   :-0.6671        
 3rd Qu.:-0.3654   3rd Qu.:-0.1872            3rd Qu.:-0.2668           3rd Qu.:-0.4087        
 Max.   : 0.1787   Max.   : 0.5384            Max.   : 0.3163           Max.   : 0.2040        
 fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
 Min.   :-0.9815        Min.   :-0.9976             Min.   :-0.9976           
 1st Qu.:-0.9488        1st Qu.:-0.9813             1st Qu.:-0.9802           
 Median :-0.7727        Median :-0.8779             Median :-0.8941           
 Mean   :-0.6723        Mean   :-0.7564             Mean   :-0.7715           
 3rd Qu.:-0.4277        3rd Qu.:-0.5831             3rd Qu.:-0.6081           
 Max.   : 0.2367        Max.   : 0.1466             Max.   : 0.2878 


Tidy Dataset sample (12 rows):

> head(xysdata_Actv_MEAN, 12)

    Subject           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
 1:       1             LAYING         0.2215982      -0.040513953        -0.1132036
 2:       1            SITTING         0.2612376      -0.001308288        -0.1045442
 3:       1           STANDING         0.2789176      -0.016137590        -0.1106018
 4:       1            WALKING         0.2773308      -0.017383819        -0.1111481
 5:       1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662
 6:       1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020
 7:       2             LAYING         0.2813734      -0.018158740        -0.1072456
 8:       2            SITTING         0.2770874      -0.015687994        -0.1092183
 9:       2           STANDING         0.2779115      -0.018420827        -0.1059085
10:       2            WALKING         0.2764266      -0.018594920        -0.1055004
11:       2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416        -0.1168129
12:       2   WALKING_UPSTAIRS         0.2471648      -0.021412113        -0.1525139
    tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z tGravityAcc-mean()-X tGravityAcc-mean()-Y
 1:      -0.92805647     -0.836827406      -0.82606140           -0.2488818            0.7055498
 2:      -0.97722901     -0.922618642      -0.93958629            0.8315099            0.2044116
 3:      -0.99575990     -0.973190056      -0.97977588            0.9429520           -0.2729838
 4:      -0.28374026      0.114461337      -0.26002790            0.9352232           -0.2821650
 5:       0.03003534     -0.031935943      -0.23043421            0.9318744           -0.2666103
 6:      -0.35470803     -0.002320265      -0.01947924            0.8933511           -0.3621534
 7:      -0.97405946     -0.980277399      -0.98423330           -0.5097542            0.7525366
 8:      -0.98682228     -0.950704499      -0.95982817            0.9404773           -0.1056300
 9:      -0.98727189     -0.957304989      -0.94974185            0.8969286           -0.3700627
10:      -0.42364284     -0.078091253      -0.42525752            0.9130173           -0.3466071
11:       0.04636668      0.262881789      -0.10283791            0.8618313           -0.3257801
12:      -0.30437641      0.108027280      -0.11212102            0.7907174           -0.4162149
    tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
 1:           0.44581772          -0.8968300          -0.9077200          -0.8523663
 2:           0.33204370          -0.9684571          -0.9355171          -0.9490409
 3:           0.01349058          -0.9937630          -0.9812260          -0.9763241
 4:          -0.06810286          -0.9766096          -0.9713060          -0.9477172
 5:          -0.06211996          -0.9505598          -0.9370187          -0.8959397
 6:          -0.07540294          -0.9563670          -0.9528492          -0.9123794
 7:           0.64683488          -0.9590144          -0.9882119          -0.9842304
 8:           0.19872677          -0.9799888          -0.9567503          -0.9544159
 9:           0.12974716          -0.9866858          -0.9741944          -0.9459271
10:           0.08472709          -0.9726932          -0.9721169          -0.9720728
11:          -0.04388902          -0.9403618          -0.9400685          -0.9314383
12:          -0.19588824          -0.9344077          -0.9237675          -0.8780041
    tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X
 1:            0.08108653          0.0038382040           0.010834236          -0.95848211
 2:            0.07748252         -0.0006191028          -0.003367792          -0.98643071
 3:            0.07537665          0.0079757309          -0.003685250          -0.99460454
 4:            0.07404163          0.0282721096          -0.004168406          -0.11361560
 5:            0.05415532          0.0296504490          -0.010971973          -0.01228386
 6:            0.10137273          0.0194863076          -0.045562545          -0.44684389
 7:            0.08259725          0.0122547885          -0.001802649          -0.98587217
 8:            0.07225644          0.0116954511           0.007605469          -0.98805585
 9:            0.07475886          0.0103291775          -0.008371588          -0.98108572
10:            0.06180807          0.0182492679           0.007895337          -0.27753046
11:            0.11004062         -0.0032795908          -0.020935168           0.14724914
12:            0.07445078         -0.0097098551           0.019481439          -0.27612189
    tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y
 1:          -0.92414927           -0.9548551        -0.01655309       -0.064486124
 2:          -0.98137197           -0.9879108        -0.04535006       -0.091924155
 3:          -0.98564873           -0.9922512        -0.02398773       -0.059397221
 4:           0.06700250           -0.5026998        -0.04183096       -0.069530046
 5:          -0.10160139           -0.3457350        -0.03507819       -0.090937129
 6:          -0.37827443           -0.7065935         0.05054938       -0.166170015
 7:          -0.98317254           -0.9884420        -0.01847661       -0.111800825
 8:          -0.97798396           -0.9875182        -0.04547066       -0.059928680
 9:          -0.97105944           -0.9828414        -0.02386239       -0.082039658
10:          -0.01660224           -0.5860904        -0.05302582       -0.048238232
11:           0.12682801           -0.3401220        -0.11594735       -0.004823292
12:          -0.18564895           -0.5737464        -0.05769126       -0.032088310
    tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
 1:         0.14868944        -0.8735439      -0.951090440        -0.9082847
 2:         0.06293138        -0.9772113      -0.966473895        -0.9414259
 3:         0.07480075        -0.9871919      -0.987734440        -0.9806456
 4:         0.08494482        -0.4735355      -0.054607769        -0.3442666
 5:         0.09008501        -0.4580305      -0.126349195        -0.1247025
 6:         0.05835955        -0.5448711       0.004105184        -0.5071687
 7:         0.14488285        -0.9882752      -0.982291609        -0.9603066
 8:         0.04122775        -0.9857420      -0.978919527        -0.9598037
 9:         0.08783517        -0.9729986      -0.971441996        -0.9648567
10:         0.08283366        -0.5615503      -0.538453668        -0.4810855
11:         0.09717381        -0.3207892      -0.415739145        -0.2794184
12:         0.06883740        -0.4392531      -0.466298337        -0.1639958
    tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyGyroJerk-std()-X
 1:            -0.10727095            -0.04151729            -0.07405012            -0.9186085
 2:            -0.09367938            -0.04021181            -0.04670263            -0.9917316
 3:            -0.09960921            -0.04406279            -0.04895055            -0.9929451
 4:            -0.08999754            -0.03984287            -0.04613093            -0.2074219
 5:            -0.07395920            -0.04399028            -0.02704611            -0.4870273
 6:            -0.12223277            -0.04214859            -0.04071255            -0.6147865
 7:            -0.10197413            -0.03585902            -0.07017830            -0.9932358
 8:            -0.09363284            -0.04156020            -0.04358510            -0.9897090
 9:            -0.10556216            -0.04224195            -0.05465395            -0.9793240
10:            -0.08188334            -0.05382994            -0.05149392            -0.3895498
11:            -0.05810385            -0.04214703            -0.07102298            -0.2439406
12:            -0.08288580            -0.04240537            -0.04451575            -0.4648544
    tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z tBodyAccMag-mean() tBodyAccMag-std()
 1:            -0.9679072            -0.9577902        -0.84192915       -0.79514486
 2:            -0.9895181            -0.9879358        -0.94853679       -0.92707842
 3:            -0.9951379            -0.9921085        -0.98427821       -0.98194293
 4:            -0.3044685            -0.4042555        -0.13697118       -0.21968865
 5:            -0.2388248            -0.2687615         0.02718829        0.01988435
 6:            -0.6016967            -0.6063320        -0.12992763       -0.32497093
 7:            -0.9895675            -0.9880358        -0.97743549       -0.97287391
 8:            -0.9908896            -0.9855423        -0.96789362       -0.95308144
 9:            -0.9834473            -0.9736101        -0.96587518       -0.95787497
10:            -0.6341404            -0.4354927        -0.29040759       -0.42254417
11:            -0.4693967            -0.2182663         0.08995112        0.21558633
12:            -0.6454913            -0.4675960        -0.10732268       -0.20597705
    tGravityAccMag-mean() tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std()
 1:           -0.84192915          -0.79514486           -0.954396265           -0.92824563
 2:           -0.94853679          -0.92707842           -0.987364196           -0.98412002
 3:           -0.98427821          -0.98194293           -0.992367791           -0.99309621
 4:           -0.13697118          -0.21968865           -0.141428809           -0.07447175
 5:            0.02718829           0.01988435           -0.089447481           -0.02578772
 6:           -0.12992763          -0.32497093           -0.466503446           -0.47899162
 7:           -0.97743549          -0.97287391           -0.987741696           -0.98551808
 8:           -0.96789362          -0.95308144           -0.986774713           -0.98447587
 9:           -0.96587518          -0.95787497           -0.980489077           -0.97667528
10:           -0.29040759          -0.42254417           -0.281424154           -0.16415099
11:            0.08995112           0.21558633            0.005655163            0.22961719
12:           -0.10732268          -0.20597705           -0.321268911           -0.21738939
    tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std()
 1:         -0.87475955         -0.8190102              -0.9634610             -0.9358410
 2:         -0.93089249         -0.9345318              -0.9919763             -0.9883087
 3:         -0.97649379         -0.9786900              -0.9949668             -0.9947332
 4:         -0.16097955         -0.1869784              -0.2987037             -0.3253249
 5:         -0.07574125         -0.2257244              -0.2954638             -0.3065106
 6:         -0.12673559         -0.1486193              -0.5948829             -0.6485530
 7:         -0.95001157         -0.9611641              -0.9917671             -0.9897181
 8:         -0.94603509         -0.9613136              -0.9910815             -0.9895949
 9:         -0.96346634         -0.9539434              -0.9839519             -0.9772044
10:         -0.44654909         -0.5530199              -0.5479120             -0.5577982
11:         -0.16218859         -0.2748441              -0.4108727             -0.3431879
12:         -0.21971347         -0.3775322              -0.5728164             -0.5972917
    fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y
 1:       -0.93909905      -0.867065205        -0.8826669      -0.92443743      -0.83362556
 2:       -0.97964124      -0.944084550        -0.9591849      -0.97641231      -0.91727501
 3:       -0.99524993      -0.977070848        -0.9852971      -0.99602835      -0.97229310
 4:       -0.20279431       0.089712726        -0.3315601      -0.31913472       0.05604001
 5:        0.03822918       0.001549908        -0.2255745       0.02433084      -0.11296374
 6:       -0.40432178      -0.190976721        -0.4333497      -0.33742819       0.02176951
 7:       -0.97672506      -0.979800878        -0.9843810      -0.97324648      -0.98102511
 8:       -0.98580384      -0.957343498        -0.9701622      -0.98736209      -0.95007375
 9:       -0.98394674      -0.959871697        -0.9624712      -0.98905647      -0.95790884
10:       -0.34604816      -0.021904810        -0.4538064      -0.45765138      -0.16921969
11:        0.11284116       0.278345042        -0.1312908       0.01610462       0.17197397
12:       -0.26672093       0.009924459        -0.2810020      -0.32058241       0.08488028
    fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
 1:      -0.81289156           -0.95707388           -0.92246261            -0.9480609
 2:      -0.93446956           -0.98659702           -0.98157947            -0.9860531
 3:      -0.97793726           -0.99463080           -0.98541870            -0.9907522
 4:      -0.27968675           -0.17054696           -0.03522552            -0.4689992
 5:      -0.29792789           -0.02766387           -0.12866716            -0.2883347
 6:       0.08595655           -0.47987525           -0.41344459            -0.6854744
 7:      -0.98479218           -0.98581363           -0.98276825            -0.9861971
 8:      -0.95686286           -0.98784879           -0.97713970            -0.9851291
 9:      -0.94643358           -0.98097324           -0.97085134            -0.9797752
10:      -0.45522215           -0.30461532           -0.07876408            -0.5549567
11:      -0.16203289            0.13812068            0.09620916            -0.2714987
12:      -0.09454498           -0.25863944           -0.18784213            -0.5227281
    fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-mean()-X
 1:          -0.96416071          -0.93221787           -0.9605870         -0.8502492
 2:          -0.98749299          -0.98251391           -0.9883392         -0.9761615
 3:          -0.99507376          -0.98701823           -0.9923498         -0.9863868
 4:          -0.13358661           0.10673986           -0.5347134         -0.3390322
 5:          -0.08632790          -0.13458001           -0.4017215         -0.3524496
 6:          -0.46190703          -0.38177707           -0.7260402         -0.4926117
 7:          -0.98725026          -0.98498739           -0.9893454         -0.9864311
 8:          -0.98945911          -0.98080423           -0.9885708         -0.9826214
 9:          -0.98300792          -0.97352024           -0.9845999         -0.9670371
10:          -0.31431306          -0.01533295           -0.6158982         -0.4297135
11:           0.04995906           0.08083335           -0.4082274         -0.1457760
12:          -0.36541544          -0.24355415           -0.6250910         -0.3316436
    fBodyGyro-mean()-Y fBodyGyro-mean()-Z fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z
 1:        -0.95219149        -0.90930272        -0.8822965       -0.95123205        -0.9165825
 2:        -0.97583859        -0.95131554        -0.9779042       -0.96234504        -0.9439178
 3:        -0.98898446        -0.98077312        -0.9874971       -0.98710773        -0.9823453
 4:        -0.10305942        -0.25594094        -0.5166919       -0.03350816        -0.4365622
 5:        -0.05570225        -0.03186943        -0.4954225       -0.18141473        -0.2384436
 6:        -0.31947461        -0.45359721        -0.5658925        0.15153891        -0.5717078
 7:        -0.98332164        -0.96267189        -0.9888607       -0.98191062        -0.9631742
 8:        -0.98210092        -0.95981482        -0.9868085       -0.97735619        -0.9635227
 9:        -0.97257615        -0.96062770        -0.9749881       -0.97103605        -0.9697543
10:        -0.55477211        -0.39665991        -0.6040530       -0.53304695        -0.5598566
11:        -0.36191382        -0.08749447        -0.3794367       -0.45873275        -0.4229877
12:        -0.48808612        -0.24860112        -0.4763588       -0.45975849        -0.2180725
    fBodyAccMag-mean() fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
 1:        -0.86176765       -0.79830094                -0.93330036                -0.9218040
 2:        -0.94778292       -0.92844480                -0.98526213                -0.9816062
 3:        -0.98535636       -0.98231380                -0.99254248                -0.9925360
 4:        -0.12862345       -0.39803259                -0.05711940                -0.1034924
 5:         0.09658453       -0.18653030                 0.02621849                -0.1040523
 6:        -0.35239594       -0.41626010                -0.44265216                -0.5330599
 7:        -0.97511020       -0.97512139                -0.98537411                -0.9845685
 8:        -0.96127375       -0.95557560                -0.98387470                -0.9841242
 9:        -0.96405217       -0.96051938                -0.97706530                -0.9751605
10:        -0.32428943       -0.57710521                -0.16906435                -0.1640920
11:         0.29342483       -0.02147879                 0.22224741                 0.2274807
12:        -0.14531854       -0.36672824                -0.18951114                -0.2604238
    fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean()
 1:              -0.8621902             -0.8243194                  -0.9423669
 2:              -0.9584356             -0.9321984                  -0.9897975
 3:              -0.9846176             -0.9784661                  -0.9948154
 4:              -0.1992526             -0.3210180                  -0.3193086
 5:              -0.1857203             -0.3983504                  -0.2819634
 6:              -0.3259615             -0.1829855                  -0.6346651
 7:              -0.9721130             -0.9610984                  -0.9902487
 8:              -0.9718406             -0.9613857                  -0.9898620
 9:              -0.9617759             -0.9567887                  -0.9778498
10:              -0.5307048             -0.6517928                  -0.5832493
11:              -0.3208385             -0.3725768                  -0.3801753
12:              -0.4506122             -0.4386204                  -0.6007985
    fBodyBodyGyroJerkMag-std()
 1:                 -0.9326607
 2:                 -0.9870496
 3:                 -0.9946711
 4:                 -0.3816019
 5:                 -0.3919199
 6:                 -0.6939305
 7:                 -0.9894927
 8:                 -0.9896329
 9:                 -0.9777543
10:                 -0.5581046
11:                 -0.3436990
12:                 -0.6218202



