
lb = [0, 0];
ub = [inf, inf]; 


options = optimoptions('gamultiobj', 'PopulationSize', 100, 'MaxGenerations', 500);


[x, fval] = gamultiobj(@funcc, 2, [], [], [], [], lb, ub, @constraints, options);

disp('Pareto solutions:');
disp(x);
disp('Objective function values:');
disp(fval);

figure;
plot(fval(:, 1), fval(:, 1), '*');
grid on;
