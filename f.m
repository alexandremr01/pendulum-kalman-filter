function y = f(x)
   [t, sol] = ode45(@nextState,[0, 0.01], x);
   y = sol(end, :);
end