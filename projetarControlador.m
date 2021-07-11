function controlador = projetarControlador(requisitos, planta)

controlador.Kp = planta.l * requisitos.wn^2 - planta.g;
controlador.Kd = 2 * requisitos.xi * requisitos.wn * planta.l;
end