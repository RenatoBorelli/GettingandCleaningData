
# Project: Getting and Cleaning Data Course
# Description: see file README.md and CodeBook.md
# Student: José Renato Borelli 
# Country: Brasil
# 
# Observation: 
#         
# After finishing my program I saw a very good example how I should have done this project at the CORRECT and OPTIMISED way. 
# This is from Benjamin-Chan:
#         
# https://github.com/benjamin-chan/GettingAndCleaningData/blob/master/Project/run_analysis.Rmd
# 
# I studied his project and learned a lot! But, in respect to the honor code I decided to keep my project as original 
# as a good example of the development stage I am and the level I want to reach, as Benjamin probably did! 
#         
# Therefore I want to confirm that, now, I know how I should have done the project and learned that skills.
# 
# Thanks a lot Benjamin.


################################ Reading and Binding Train data:
### Trainning:
################################
### Trainning Data:

xtrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

# Verify Dimension:
dim(xtrain)
#[1] 7352  561



### Trainning Activities:

ytrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

# Verify Dimension:
dim(ytrain)
#[1] 7352    1



### Column Binding Data and Activities:

xytrain<-cbind(xtrain, ytrain)

# Verify:
head(xytrain, 2)
# Verify Dimension:
dim(xytrain)
#[1] 7352  562



### Trainning Subjects:

strain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

# Verify Dimension:
dim(strain)
#[1] 7352    1



### Column Binding Subjects to the Data Set:

xystrain<-cbind(xytrain, strain)

# Verify:
head(xystrain, 2)
# Verify Dimension:
dim(xystrain)
#[1] 7352  563

########################################################################################

################################ Reading and Binding Test data:
## Test:
################################
### Test Data:

xtest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

# Verify Dimension:
dim(xtest)
#[1] 2947  561



### Test Activities:

ytest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

# Verify Dimension:
dim(ytest)
#[1] 2947    1




### Column Binding Data and Activities:

xytest<-cbind(xtest, ytest)

# Verify Dimension:
dim(xytest)
#[1] 2947  562
 


### Test Subjects:

stest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# Verify Dimension:
dim(stest)
#[1] 2947    1

### Column Binding Subjects to the Data Set:

xystest<-cbind(xytest, stest)

# Verify:
head(xystest, 2)
# Verify Dimension:
dim(xystest)
#[1] 2947  563


######################################################################################################
############################### Row Binding Trainning and Test Data:

xysdata<-rbind(xystrain, xystest)

# Verify:
head(xysdata, 2)
names(xysdata)
# Verify Dimension:
dim(xysdata)
#[1] 2947  563


############################## Setting Column Names ---> Features

features <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

# Verify Dimension:
dim(features)

featuresChar<-as.character(features[,2])

length(featuresChar)

# Add names for Activity and Subject columns, they are the last ones of the dataframe:
featuresChar[562]= "Activity"
featuresChar[563]= "Subject"

setnames(xysdata, featuresChar)

# verify:
names(xysdata)




####################### Name the activities with the activity lables:

## As activities are correspondent to 1 to 6 index, and these numbers are the data on xysdata$Activity
## then, we can use itself as index for the Activity item to be assigned:

activlables <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

# Changing activity numbers, our index, by activity names:
xysdata$Activity<-activlables[xysdata$Activity,2]




################# Extracts only the measurements on the mean (mean or Mean) and standard deviation (std) for each measurement:

# To select which features are mean or std -> construct a column index with the feature vector where "mean(" or "std(" is in the name.
# Use this index at the column side: xysData[,index]

####******************  
colindex<-((features$V2 %like% "mean\\(")|(features$V2 %like% "std\\("))
# Obs: "Mean" and "meanFreq()" were not considered.  

xysdata_mean_std <-xysdata[,colindex]

# Verify column names:
names(xysdata_mean_std)  
## Note that Activity and Subject columns were keeped once "features" has only 561 elements
## and colindex has no FALSE elements to negate columns 562 and 563. 

# Verify:
head(xysdata_mean_std)


##################### From the data set in step 4, creates a second, independent tidy data set 
##################### with the average of each variable for each activity and each subject.
#### RESHAPING:

xysdata_mean_std_MELT<-melt(xysdata_mean_std, id=c("Activity", "Subject"), measure.vars= names(xysdata_mean_std[,1:66]) )

# Verify:
head(xysdata_mean_std_MELT)

#### Using a For loop with dcast to generate average (mean) by Subject and Activity:

# Initial Value:
xysdata_Actv_MEAN<- dcast((xysdata_mean_std_MELT[xysdata_mean_std_MELT$Subject==1,]), Subject + Activity ~ variable, mean)

# For loop with dcast and rbind to build the dataframe:
for(Subject in sort(unique(xysdata_mean_std_MELT$Subject))){
        
        if(Subject ==1) next
        xysdata_Actv_MEAN_temp<- dcast((xysdata_mean_std_MELT[xysdata_mean_std_MELT$Subject==Subject,]), Subject + Activity ~ variable, mean)
        xysdata_Actv_MEAN<-rbind(xysdata_Actv_MEAN, xysdata_Actv_MEAN_temp)
}


#Verify:
# head(xysdata_Actv_MEAN, 12)
# Subject           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y
# 1        1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647     -0.836827406
# 2        1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901     -0.922618642
# 3        1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990     -0.973190056
# 4        1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026      0.114461337
# 5        1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534     -0.031935943
# 6        1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803     -0.002320265
# 7        2             LAYING         0.2813734      -0.018158740        -0.1072456      -0.97405946     -0.980277399
# 8        2            SITTING         0.2770874      -0.015687994        -0.1092183      -0.98682228     -0.950704499
# 9        2           STANDING         0.2779115      -0.018420827        -0.1059085      -0.98727189     -0.957304989
# 10       2            WALKING         0.2764266      -0.018594920        -0.1055004      -0.42364284     -0.078091253
# 11       2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416        -0.1168129       0.04636668      0.262881789
# 12       2   WALKING_UPSTAIRS         0.2471648      -0.021412113        -0.1525139      -0.30437641      0.108027280
# tBodyAcc-std()-Z tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y
# 1       -0.82606140           -0.2488818            0.7055498           0.44581772          -0.8968300          -0.9077200
# 2       -0.93958629            0.8315099            0.2044116           0.33204370          -0.9684571          -0.9355171
# 3       -0.97977588            0.9429520           -0.2729838           0.01349058          -0.9937630          -0.9812260
# 4       -0.26002790            0.9352232           -0.2821650          -0.06810286          -0.9766096          -0.9713060
# 5       -0.23043421            0.9318744           -0.2666103          -0.06211996          -0.9505598          -0.9370187
# 6       -0.01947924            0.8933511           -0.3621534          -0.07540294          -0.9563670          -0.9528492
# 7       -0.98423330           -0.5097542            0.7525366           0.64683488          -0.9590144          -0.9882119
# 8       -0.95982817            0.9404773           -0.1056300           0.19872677          -0.9799888          -0.9567503
# 9       -0.94974185            0.8969286           -0.3700627           0.12974716          -0.9866858          -0.9741944
# 10      -0.42525752            0.9130173           -0.3466071           0.08472709          -0.9726932          -0.9721169
# 11      -0.10283791            0.8618313           -0.3257801          -0.04388902          -0.9403618          -0.9400685
# 12      -0.11212102            0.7907174           -0.4162149          -0.19588824          -0.9344077          -0.9237675
# tGravityAcc-std()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X
# 1           -0.8523663            0.08108653          0.0038382040           0.010834236          -0.95848211
# 2           -0.9490409            0.07748252         -0.0006191028          -0.003367792          -0.98643071
# 3           -0.9763241            0.07537665          0.0079757309          -0.003685250          -0.99460454
# 4           -0.9477172            0.07404163          0.0282721096          -0.004168406          -0.11361560
# 5           -0.8959397            0.05415532          0.0296504490          -0.010971973          -0.01228386
# 6           -0.9123794            0.10137273          0.0194863076          -0.045562545          -0.44684389
# 7           -0.9842304            0.08259725          0.0122547885          -0.001802649          -0.98587217
# 8           -0.9544159            0.07225644          0.0116954511           0.007605469          -0.98805585
# 9           -0.9459271            0.07475886          0.0103291775          -0.008371588          -0.98108572
# 10          -0.9720728            0.06180807          0.0182492679           0.007895337          -0.27753046
# 11          -0.9314383            0.11004062         -0.0032795908          -0.020935168           0.14724914
# 12          -0.8780041            0.07445078         -0.0097098551           0.019481439          -0.27612189
# tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z tBodyGyro-std()-X
# 1           -0.92414927           -0.9548551        -0.01655309       -0.064486124         0.14868944        -0.8735439
# 2           -0.98137197           -0.9879108        -0.04535006       -0.091924155         0.06293138        -0.9772113
# 3           -0.98564873           -0.9922512        -0.02398773       -0.059397221         0.07480075        -0.9871919
# 4            0.06700250           -0.5026998        -0.04183096       -0.069530046         0.08494482        -0.4735355
# 5           -0.10160139           -0.3457350        -0.03507819       -0.090937129         0.09008501        -0.4580305
# 6           -0.37827443           -0.7065935         0.05054938       -0.166170015         0.05835955        -0.5448711
# 7           -0.98317254           -0.9884420        -0.01847661       -0.111800825         0.14488285        -0.9882752
# 8           -0.97798396           -0.9875182        -0.04547066       -0.059928680         0.04122775        -0.9857420
# 9           -0.97105944           -0.9828414        -0.02386239       -0.082039658         0.08783517        -0.9729986
# 10          -0.01660224           -0.5860904        -0.05302582       -0.048238232         0.08283366        -0.5615503
# 11           0.12682801           -0.3401220        -0.11594735       -0.004823292         0.09717381        -0.3207892
# 12          -0.18564895           -0.5737464        -0.05769126       -0.032088310         0.06883740        -0.4392531
# tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
# 1       -0.951090440        -0.9082847            -0.10727095            -0.04151729            -0.07405012
# 2       -0.966473895        -0.9414259            -0.09367938            -0.04021181            -0.04670263
# 3       -0.987734440        -0.9806456            -0.09960921            -0.04406279            -0.04895055
# 4       -0.054607769        -0.3442666            -0.08999754            -0.03984287            -0.04613093
# 5       -0.126349195        -0.1247025            -0.07395920            -0.04399028            -0.02704611
# 6        0.004105184        -0.5071687            -0.12223277            -0.04214859            -0.04071255
# 7       -0.982291609        -0.9603066            -0.10197413            -0.03585902            -0.07017830
# 8       -0.978919527        -0.9598037            -0.09363284            -0.04156020            -0.04358510
# 9       -0.971441996        -0.9648567            -0.10556216            -0.04224195            -0.05465395
# 10      -0.538453668        -0.4810855            -0.08188334            -0.05382994            -0.05149392
# 11      -0.415739145        -0.2794184            -0.05810385            -0.04214703            -0.07102298
# 12      -0.466298337        -0.1639958            -0.08288580            -0.04240537            -0.04451575
# tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z tBodyAccMag-mean() tBodyAccMag-std()
# 1             -0.9186085            -0.9679072            -0.9577902        -0.84192915       -0.79514486
# 2             -0.9917316            -0.9895181            -0.9879358        -0.94853679       -0.92707842
# 3             -0.9929451            -0.9951379            -0.9921085        -0.98427821       -0.98194293
# 4             -0.2074219            -0.3044685            -0.4042555        -0.13697118       -0.21968865
# 5             -0.4870273            -0.2388248            -0.2687615         0.02718829        0.01988435
# 6             -0.6147865            -0.6016967            -0.6063320        -0.12992763       -0.32497093
# 7             -0.9932358            -0.9895675            -0.9880358        -0.97743549       -0.97287391
# 8             -0.9897090            -0.9908896            -0.9855423        -0.96789362       -0.95308144
# 9             -0.9793240            -0.9834473            -0.9736101        -0.96587518       -0.95787497
# 10            -0.3895498            -0.6341404            -0.4354927        -0.29040759       -0.42254417
# 11            -0.2439406            -0.4693967            -0.2182663         0.08995112        0.21558633
# 12            -0.4648544            -0.6454913            -0.4675960        -0.10732268       -0.20597705
# tGravityAccMag-mean() tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyGyroMag-mean()
# 1            -0.84192915          -0.79514486           -0.954396265           -0.92824563         -0.87475955
# 2            -0.94853679          -0.92707842           -0.987364196           -0.98412002         -0.93089249
# 3            -0.98427821          -0.98194293           -0.992367791           -0.99309621         -0.97649379
# 4            -0.13697118          -0.21968865           -0.141428809           -0.07447175         -0.16097955
# 5             0.02718829           0.01988435           -0.089447481           -0.02578772         -0.07574125
# 6            -0.12992763          -0.32497093           -0.466503446           -0.47899162         -0.12673559
# 7            -0.97743549          -0.97287391           -0.987741696           -0.98551808         -0.95001157
# 8            -0.96789362          -0.95308144           -0.986774713           -0.98447587         -0.94603509
# 9            -0.96587518          -0.95787497           -0.980489077           -0.97667528         -0.96346634
# 10           -0.29040759          -0.42254417           -0.281424154           -0.16415099         -0.44654909
# 11            0.08995112           0.21558633            0.005655163            0.22961719         -0.16218859
# 12           -0.10732268          -0.20597705           -0.321268911           -0.21738939         -0.21971347
# tBodyGyroMag-std() tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z
# 1          -0.8190102              -0.9634610             -0.9358410       -0.93909905      -0.867065205        -0.8826669
# 2          -0.9345318              -0.9919763             -0.9883087       -0.97964124      -0.944084550        -0.9591849
# 3          -0.9786900              -0.9949668             -0.9947332       -0.99524993      -0.977070848        -0.9852971
# 4          -0.1869784              -0.2987037             -0.3253249       -0.20279431       0.089712726        -0.3315601
# 5          -0.2257244              -0.2954638             -0.3065106        0.03822918       0.001549908        -0.2255745
# 6          -0.1486193              -0.5948829             -0.6485530       -0.40432178      -0.190976721        -0.4333497
# 7          -0.9611641              -0.9917671             -0.9897181       -0.97672506      -0.979800878        -0.9843810
# 8          -0.9613136              -0.9910815             -0.9895949       -0.98580384      -0.957343498        -0.9701622
# 9          -0.9539434              -0.9839519             -0.9772044       -0.98394674      -0.959871697        -0.9624712
# 10         -0.5530199              -0.5479120             -0.5577982       -0.34604816      -0.021904810        -0.4538064
# 11         -0.2748441              -0.4108727             -0.3431879        0.11284116       0.278345042        -0.1312908
# 12         -0.3775322              -0.5728164             -0.5972917       -0.26672093       0.009924459        -0.2810020
# fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
# 1       -0.92443743      -0.83362556      -0.81289156           -0.95707388           -0.92246261            -0.9480609
# 2       -0.97641231      -0.91727501      -0.93446956           -0.98659702           -0.98157947            -0.9860531
# 3       -0.99602835      -0.97229310      -0.97793726           -0.99463080           -0.98541870            -0.9907522
# 4       -0.31913472       0.05604001      -0.27968675           -0.17054696           -0.03522552            -0.4689992
# 5        0.02433084      -0.11296374      -0.29792789           -0.02766387           -0.12866716            -0.2883347
# 6       -0.33742819       0.02176951       0.08595655           -0.47987525           -0.41344459            -0.6854744
# 7       -0.97324648      -0.98102511      -0.98479218           -0.98581363           -0.98276825            -0.9861971
# 8       -0.98736209      -0.95007375      -0.95686286           -0.98784879           -0.97713970            -0.9851291
# 9       -0.98905647      -0.95790884      -0.94643358           -0.98097324           -0.97085134            -0.9797752
# 10      -0.45765138      -0.16921969      -0.45522215           -0.30461532           -0.07876408            -0.5549567
# 11       0.01610462       0.17197397      -0.16203289            0.13812068            0.09620916            -0.2714987
# 12      -0.32058241       0.08488028      -0.09454498           -0.25863944           -0.18784213            -0.5227281
# fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
# 1           -0.96416071          -0.93221787           -0.9605870         -0.8502492        -0.95219149        -0.90930272
# 2           -0.98749299          -0.98251391           -0.9883392         -0.9761615        -0.97583859        -0.95131554
# 3           -0.99507376          -0.98701823           -0.9923498         -0.9863868        -0.98898446        -0.98077312
# 4           -0.13358661           0.10673986           -0.5347134         -0.3390322        -0.10305942        -0.25594094
# 5           -0.08632790          -0.13458001           -0.4017215         -0.3524496        -0.05570225        -0.03186943
# 6           -0.46190703          -0.38177707           -0.7260402         -0.4926117        -0.31947461        -0.45359721
# 7           -0.98725026          -0.98498739           -0.9893454         -0.9864311        -0.98332164        -0.96267189
# 8           -0.98945911          -0.98080423           -0.9885708         -0.9826214        -0.98210092        -0.95981482
# 9           -0.98300792          -0.97352024           -0.9845999         -0.9670371        -0.97257615        -0.96062770
# 10          -0.31431306          -0.01533295           -0.6158982         -0.4297135        -0.55477211        -0.39665991
# 11           0.04995906           0.08083335           -0.4082274         -0.1457760        -0.36191382        -0.08749447
# 12          -0.36541544          -0.24355415           -0.6250910         -0.3316436        -0.48808612        -0.24860112
# fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean() fBodyAccMag-std() fBodyBodyAccJerkMag-mean()
# 1         -0.8822965       -0.95123205        -0.9165825        -0.86176765       -0.79830094                -0.93330036
# 2         -0.9779042       -0.96234504        -0.9439178        -0.94778292       -0.92844480                -0.98526213
# 3         -0.9874971       -0.98710773        -0.9823453        -0.98535636       -0.98231380                -0.99254248
# 4         -0.5166919       -0.03350816        -0.4365622        -0.12862345       -0.39803259                -0.05711940
# 5         -0.4954225       -0.18141473        -0.2384436         0.09658453       -0.18653030                 0.02621849
# 6         -0.5658925        0.15153891        -0.5717078        -0.35239594       -0.41626010                -0.44265216
# 7         -0.9888607       -0.98191062        -0.9631742        -0.97511020       -0.97512139                -0.98537411
# 8         -0.9868085       -0.97735619        -0.9635227        -0.96127375       -0.95557560                -0.98387470
# 9         -0.9749881       -0.97103605        -0.9697543        -0.96405217       -0.96051938                -0.97706530
# 10        -0.6040530       -0.53304695        -0.5598566        -0.32428943       -0.57710521                -0.16906435
# 11        -0.3794367       -0.45873275        -0.4229877         0.29342483       -0.02147879                 0.22224741
# 12        -0.4763588       -0.45975849        -0.2180725        -0.14531854       -0.36672824                -0.18951114
# fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean()
# 1                 -0.9218040              -0.8621902             -0.8243194                  -0.9423669
# 2                 -0.9816062              -0.9584356             -0.9321984                  -0.9897975
# 3                 -0.9925360              -0.9846176             -0.9784661                  -0.9948154
# 4                 -0.1034924              -0.1992526             -0.3210180                  -0.3193086
# 5                 -0.1040523              -0.1857203             -0.3983504                  -0.2819634
# 6                 -0.5330599              -0.3259615             -0.1829855                  -0.6346651
# 7                 -0.9845685              -0.9721130             -0.9610984                  -0.9902487
# 8                 -0.9841242              -0.9718406             -0.9613857                  -0.9898620
# 9                 -0.9751605              -0.9617759             -0.9567887                  -0.9778498
# 10                -0.1640920              -0.5307048             -0.6517928                  -0.5832493
# 11                 0.2274807              -0.3208385             -0.3725768                  -0.3801753
# 12                -0.2604238              -0.4506122             -0.4386204                  -0.6007985
# fBodyBodyGyroJerkMag-std()
# 1                  -0.9326607
# 2                  -0.9870496
# 3                  -0.9946711
# 4                  -0.3816019
# 5                  -0.3919199
# 6                  -0.6939305
# 7                  -0.9894927
# 8                  -0.9896329
# 9                  -0.9777543
# 10                 -0.5581046
# 11                 -0.3436990
# 12                 -0.6218202



knit("makeCodebook.Rmd", output="codebook.md", encoding="ISO8859-1", quiet=TRUE)
markdownToHTML("codebook.md", "codebook.html")


