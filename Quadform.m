%Julie Harrow
%1.020 Problem Set 4
%Problem #2: Task 1


function [roots] = quadform(coefficients)  %defines function and inputs

if length(coefficients) == 3  %determines whether inputs are adequate
    a = coefficients(1);  %assigns coefficients to appropriate variables
    b = coefficients(2);
    c = coefficients(3); 
    
    root1 = (-b + sqrt(b^2 - 4 *a *c)) / (2* a);  %finds roots
    root2 = (-b - sqrt(b^2 - 4 *a *c)) / (2* a);
    
else
    error('Please input a list of three coefficients.')  
    %returns error if not the right number of inputs
end

if root1 == root2  %equal roots should only return one value
    roots = [root1];
else
    roots = [root1,root2];
    
end

    
    


