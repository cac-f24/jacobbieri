clear;

num = 1998;

prime_factors = [];

for i = 2:sqrt(num)
    while rem(num, i) == 0
        prime_factors(end+1) = i;
        num = num / i;
    end
end

if num > 1
    prime_factors(end+1) = num;
end

disp('Prime factors:');
disp(prime_factors);
