thetar = 0.1;
tf = 10;
varCom = 0.1;
varMed = 0.1;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);
model = getParameters(planta, varCom, varMed);

sim_with_filter = simular(true, model, controlador, planta, thetar, tf, varCom, varMed);
sim_without_filter = simular(false, model, controlador, planta, thetar, tf, varCom, varMed);