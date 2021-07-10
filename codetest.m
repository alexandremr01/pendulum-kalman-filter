function y = fcn(x, u, varMed, varCom)

n=3;
Q=varCom*eye(n); % covariance of process
R=varMed;        % covariance of measurement  

fx=@(x)f(x);  % nonlinear state equations
h=@(x)x(1);                               % measurement equation

P = eye(n);
state = zeros([n 1]);
state(3) = u;

[nextState, Pnext] = ukf(fx, state, P, h, x, Q, R);            % ekf 
P = Pnext;
state = nextState;
y = nextState(1);
end
function y = f(x)
   [t, sol] = ode45(@nextState,[0 1e-3], x);
   y = sol(end, :);
end
function dydt = nextState(t, y)
% y(1) = theta
% y(2) = theta'
% y(3) = a

dydt = zeros(3,1);
planta = obterPlanta();

dydt(1) = y(2); % theta'
dydt(2) = (planta.g * sin(y(1)) + y(3) * cos(y(1)))/planta.l; % theta'
dydt(3) = 0;
end


