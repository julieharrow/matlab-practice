function x = fib(N)

x = zeros(1,N);

if N >=2
    x(1) = 1;
    x(2) = 1;
    for i = 3:N;
        x(i) = x(i-1)+x(i-2);
    end
elseif N==1
    x(1) = 1;
else
    error('Not a valid input argument')
end

    


