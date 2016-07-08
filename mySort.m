%Julie Harrow
%1.020 Problem Set 4
%Problem #2: Task 2

function [orderedList] = mySort(n)  
%defines function and input n(# of random integers to be sorted)

if n<=0
      
    error('Please input a value between 0 and 100.') 
    
end

randomMatrix = rand(n);

randList = round(randomMatrix(n,:)*100);


for i = (1: length(randList)-1)
    
    for j = (1:length(randList) - i)
    
        if randList(j) <= randList(j+1)
            low = randList(j);
            high = randList(j+1);
            randList(j+1) = low;
            randList(j) = high;
        end
                  
    end
    
end

orderedList = randList;
    
    
