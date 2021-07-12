thetar = 0;
tf = 10;
varianciaComando = 10;
varianciaMedida = 0.5;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);
model = obterParametros(planta, varianciaComando, varianciaMedida);

sim_with_filter = simular(true, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);
sim_without_filter = simular(false, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);