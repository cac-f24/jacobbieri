clear;

a = 0;  
b = 1;  
A = 7;  
B = 5;  
n = 100;  

h = (b - a) / (n + 1); 
x = linspace(a, b, n+2); 

p = @(x) 2*x+1;
q = @(x) 1 + x.^2;
r = @(x) sin(pi*x);

main = zeros(n,1);
super = zeros(n-1,1);
sub = zeros(n-1,1);
k = zeros(n,1);

for j = 1:n
    xj = x(j+1);
    main(j) = 2/h^2 + q(xj);
    if j < n
        super(j) = -1/h^2 + p(xj)/(2*h);
        sub(j) = -1/h^2 - p(xj)/(2*h);
    end
    k(j) = r(xj);
end

k(1) = k(1) + A * (1/h^2 + p(x(2))/(2*h));
k(n) = k(n) + B * (1/h^2 - p(x(n+1))/(2*h));

y_inner = Bieri5_3(n, main, super, sub, k);
y = [A; y_inner; B];

plot(x, y, '-*');
xlabel('x');
ylabel('y');
title('Numerical Solution of BVP');
