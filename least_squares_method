clear;
clf;

filename = 'lsdata.m';
A = load(filename);

n = A(1,1);
m = A(1,2);

x = A(2:end,1);
y = A(2:end,2);

V = zeros(m, n+1);
for i = 0:n
    V(:, i+1) = x.^i;
end

a = V\y;

plot(x, y, 'r*', 'MarkerSize', 8);
hold on;

xx = linspace(min(x), max(x), 100);
yy = zeros(size(xx));

for i = 0:n
    yy = yy + a(i+1) * xx.^i;
end

plot(xx, yy, 'k', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title(['Polynomial Fit of Degree ', num2str(n)]);
grid on;


hold off;
