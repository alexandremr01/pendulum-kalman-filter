function controlador = projetarControlador(requisitos, planta)
% Retorna os ganhos do controlador PD
% controlador.Kp : ganho proporcional
% controlador.Kd : ganho derivativo

controlador.Kp = planta.l * requisitos.wn^2 - planta.g;
controlador.Kd = 2 * requisitos.xi * requisitos.wn * planta.l;
end