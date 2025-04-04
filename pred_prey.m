clear;

t0 = 0;
fox0 = 3;
rabbits0 = 2;
alpha = 2;
beta = 1.2;
gamma = 1;
delta = 0.9;
f = @(t, R, F) [alpha*R - beta*R*F;
                -gamma*F + delta*R*F];

dt = 0.001;
tsteps = 7000;

R(1) = rabbits0;
F(1) = fox0;
t(1) = t0;

for i = 1:tsteps
    t(i+1) = t(i) + dt;

    k1 = f(t(i), R(i), F(i));
    k2 = f(t(i) + dt/2, R(i) + (dt/2) * k1(1), F(i) + (dt/2) * k1(2));
    k3 = f(t(i) + dt/2, R(i) + (dt/2) * k2(1), F(i) + (dt/2) * k2(2));
    k4 = f(t(i) + dt, R(i) + dt * k3(1), F(i) + dt * k3(2));

    R(i+1) = R(i) + (dt/6) * (k1(1) + 2*k2(1) + 2*k3(1) + k4(1));
    F(i+1) = F(i) + (dt/6) * (k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
end

figure(1);
plot(R, F, 'b-');
xlabel('R');
ylabel('F');

figure(2);
plot(t, R, 'b-');
hold on;
plot(t, F, 'r-');
legend('R', 'F');
xlabel('Time');
ylabel('Population');
hold off;
