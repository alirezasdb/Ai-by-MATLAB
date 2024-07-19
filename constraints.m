function [c, ceq] = constraints(x)
    c = [
        -x(2) + 6;              
        x(1) + 3*x(2) - 3;  
        -2*x(1) + x(2) + 6;    
        -2*x(1) - x(2) + 10;    
        x(1);                 
        x(2);
    ];
    ceq = [];
end