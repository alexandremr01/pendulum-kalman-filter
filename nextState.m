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