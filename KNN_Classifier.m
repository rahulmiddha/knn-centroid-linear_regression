% Function classifies an object by a majority vote of its neighbors, 
% with the object being assigned to the class most common among 
% its k nearest neighbors where k is a positive integer.

function final_matrix = KNN_Classifier(train_data,test_data,class_data)

prompt = 'Enter value of k :  ';
k = input(prompt)
train_size = size(train_data,1);
test_size = size(test_data,1);

eucli = zeros(test_size,train_size);

for row = 1:test_size
    for col = 1:train_size
        eucli(row,col)= sqrt(sum((train_data(col,:) -  test_data(row,:)).^2));
        
    end
end
      
[B,I] = sort(eucli,2);

kI=I(:,1:k);

final_matrix = zeros(1,test_size);
for x = 1:test_size
    mod  = containers.Map('KeyType','int32','ValueType','int32');
    for y = 1:k
        response = class_data(kI(x,y));
        tf = isKey(mod,response);
        if tf == 1
            mod(response)= mod(response)+1;
        else
            mod(response) = 1;
          
        end
        
    end
    key = cell2mat(keys(mod));
    val = cell2mat(values(mod));
    [arr,in]= sort(val,2,'descend');
    final_matrix(1,x)= key(in(1));
end

