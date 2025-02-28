clear;
clf;

fid = fopen("circintdata.m", "r");
input = fscanf(fid, "%f", inf);
fclose(fid);

num_x = length(input) / 2;
x = input(1:num_x)';
y = input(num_x+1:end)';

slope1 = (y(2) - y(1)) / (x(2) - x(1));
slope2 = (y(3) - y(2)) / (x(3) - x(2));
slope_collinear = (slope1 == slope2);

if slope_collinear
    disp('The points are on the same line.');
    hold on;
    plot(x, y, 'g*');
    plot([x(1), x(3)], [y(1), y(3)], 'm-');
    hold off;
    xlabel('x'); ylabel('y');
    return
end

A = [2*x' 2*y' -ones(num_x, 1)];
b = x'.^2 + y'.^2;

z = A \ b;
h = z(1);
k = z(2);
p = z(3);
r = sqrt(h^2 + k^2 - p);

theta = linspace(0, 2*pi, 300);
xc = h + r * cos(theta);
yc = k + r * sin(theta);

figure;
hold on;
plot(x, y, 'g*');
plot(h, k, 'rd');
plot(xc, yc, 'm-');
hold off;

xlabel('x');
ylabel('y');
title('Interpolating Circle');
axis equal;
