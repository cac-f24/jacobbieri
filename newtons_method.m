% Newton's method of solving functions

clear;
format('long');

L = @(x, y) [(y^2 - x^2 - 3)
             (x^2 + y - 3)];


J1 = @(x, y) - 2*x;
J2 = @(x, y) 2*y;
J3 = @(x, y) 2*x;
J4 = @(x, y) 1;

z = [15; 400];

J = {J1, J2; J3, J4};

max_iter = 10;
% Increase this above 11 to converge z=[15;400]

epsilon = 1e-6;

end_loop = max_iter;

for i = 1:max_iter
    x = z(1);
    y = z(2);
    end_loop = end_loop-1;
    
    L_values = L(x, y);
    J11 = J{1,1}(x, y);
    J12 = J{1,2}(x, y);
    J21 = J{2,1}(x, y);
    J22 = J{2,2}(x, y);
    
    Jnew = [J11, J12; J21, J22];
    
    dz = Jnew \ -L_values;
    
    z = z + dz;
    
    if norm(dz) < epsilon
        disp(['Converged after ' num2str(i), ' iterations']);
        disp(z);
        break;
    end
end

if end_loop == 0
    disp('Did not converge');
end
