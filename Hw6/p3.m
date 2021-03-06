clear
%% Part A
syms f(x1,x2) x1 x2 g1(x1,x2) g2(x1,x2) g3(x1,x2) lambda1 lambda2 lambda3

f(x1,x2) = x1^2 + x2;
dfx1 = diff(f,x1);
dfx2 = diff(f,x2);

g1(x1,x2) = x1^2 + x2^2 - 9;
dg1x1 = diff(g1,x1);
dg1x2 = diff(g1,x2);

g2(x1,x2) = -(x1 + x2^2 - 1);
dg2x1 = diff(g2,x1);
dg2x2 = diff(g2,x2);

% G3 is not binding so we leave it out
% g3(x1,x2) = x1 + x2 - 1
% dg3x1 = diff(g,x1);
% dg3x2 = diff(g,x2);

x1 = -2.3723;
x2 = -1.8364;
dfx1 = double(subs(dfx1));
dfx2 = double(subs(dfx2));
dg1x1 = double(subs(dg1x1));
dg1x2 = double(subs(dg1x2));
dg2x1 = double(subs(dg2x1));
dg2x2 = double(subs(dg2x2));

solution = solve(dfx1 - lambda1*dg1x1 - lambda2*dg2x1 == 0,...
    dfx2 - lambda1*dg1x2 - lambda2*dg2x2 == 0, g1 == 0, g2 == 0);
lambda1 = double(solution.lambda1)
lambda2 = double(solution.lambda2)

% The point is a local optimum since both of the lambdas are binding 

%% Part B
clear
syms f(x1,x2) x1 x2 g1(x1,x2) g2(x1,x2) g3(x1,x2) lambda1

f(x1,x2) = x1^2 + x2;
dfx1 = diff(f,x1);
dfx2 = diff(f,x2);

g1(x1,x2) = x1^2 + x2^2 - 9;
dg1x1 = diff(g1,x1);
dg1x2 = diff(g1,x2);

% G2 and G3 are not binding so we leave them out

x1 = -2.5;
x2 = -1.6583;
dfx1 = double(subs(dfx1));
dfx2 = double(subs(dfx2));
dg1x1 = double(subs(dg1x1));
dg1x2 = double(subs(dg1x2));

solution = solve(dfx1 - lambda1*dg1x1 == 0,...
    dfx2 - lambda1*dg1x2 == 0, g1 == 0);

lambda1 = double(solution.lambda1)

% There isn't a solution for lambda that satisfies the equations, 
% therefore the point is not a local optimum

