% b is upper bounds, a is lower, f is the function, and epsilon is
% something bruh idk

f = @(x) x^2-3;
a = -1;
b = 2;
epsilon = 0.00001;



if f(a) * f(b) > 0
    error('f(a) and f(b) must have opposite signs.');
end

max = ceil(log2((b-a)/epsilon));
counter = 0;

while counter < max
    c = (a + b) / 2;
    fc = f(c);

    if fc == 0
        a = fc;
        b = fc;
        break;
    elseif f(a) * fc < 0
        b = c;
    else
        a = c;
    end
    counter = counter + 1;
end

method = (a + b) / 2;

fprintf('The solution is %f after %d bisections\n', method, counter);
