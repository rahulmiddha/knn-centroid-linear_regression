function [] = main( )
%Main function will call KNN , Centroid and Linear regression classifier

%Select the training data file 
[fileName1,pathName1] = uigetfile('*.txt','Select the training data file');
%Select the test data file
[fileName2,pathName2] = uigetfile('*.txt','Select the test data file');



train_data = csvread(strcat(pathName1,fileName1),1,0);
class_data = csvread(strcat(pathName1,fileName1),0,0,[0, 0, 0, size(train_data,2)-1]);
test_data = csvread(strcat(pathName2,fileName2));

%Set SVM values
trainSVM = train_data;
testSVM = test_data;


% call centroid, KNN and Linear Regression. Comment those not needed. 
KNN = KNN_Classifier(train_data',test_data',class_data);
centroid_clustering = CentroidClustering(train_data,test_data,class_data)
Linear = LinearRegression(train_data,class_data,test_data);

%using libsvm for all 3 classifiers; comment out the ones not being tested
matrix = svmtrain(class_data', trainSVM', '-s 1 -t 0');
[predicted_label_KNN, accuracy_KNN, dec_values_KNN] = svmpredict(KNN', testSVM', matrix )
[predicted_label_cent, accuracy_cent, dec_values_cent] = svmpredict(centroid_clustering', testSVM', matrix )
[predicted_label_lin, accuracy_lin, dec_values_lin] = svmpredict(Linear', testSVM', matrix )


%test_data = transpose(test_data)
%test_data_XY = [final;test_data];
%csvwrite('outputFile.txt',test_data_XY);

end

