function Center = CentroidClustering( train_data,test_data,class_data )
%In this function we calculate the Centroid of each class of the training data 
%then the distance between the Centroid of each test data with all the centroids of training data are calculated.  
%The closest centroid to the test data has the same clss the test data.

train_data_size = size(train_data,1);
test_data_size = size(test_data,1);
column = size(train_data,2);

class_name=unique(class_data);
no_of_Classes=size(class_name,2);
for x = 1:no_of_Classes
    rep(x)=histc(class_data, class_name(x));
end
rep;
i=1;

for x = 1:size(rep,2)
    sum_of=0;
    for y = 1:rep(x)
        if i <= train_data_size
            sum_of = sum_of+train_data(:,i);
            i  = i+1;
        else
            break;
        end
    end
    centroid_train(:,x) = sum_of ./ rep(x);
end

P= size(centroid_train,2);    
    
final= pdist2(centroid_train',test_data');
[Fin,Center] = min(final,[],1);

