function controlador = projetarControladorPV(requisitos, planta)

controlador.Kv = 2 * planta.l * requisitos.wn * requisitos.xi;
controlador.Kp =(planta.l* requisitos.wn^2 + planta.g)/controlador.Kv;
end