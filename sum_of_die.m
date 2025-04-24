clear;

n = 10000;
sums = zeros(1, n);

for i = 1:n
    r = randi(6, 1, 2);
    sums(i) = r(1) + r(2);
end

histogram(sums)
xlabel('Sum')
ylabel('Frequency')
title('Histogram of Sums from Rolling Two Dice')
