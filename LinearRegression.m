%A linear classifier uses an object's characteristics to recognise which
%class it belongs to. It is the fastest classification available. 

function final = LinearRegression( x_train,y_train,x_test )

find = unique(y_train);
for i = 1:length(find)
indicator(i,:)=ismember(y_train,find(i))';
end

y_train = indicator;

A = pinv(x_train') * y_train'; % (XX')^{-1} X  * Y'
y_test_1 = A' * x_test; 
[y_test_2_value  ,final]= max(y_test_1,[],1);

end
