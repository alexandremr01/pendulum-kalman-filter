thetar = 0.1;
tf = 10;
varCom = 0.001;
varMed = 0.001;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);
model = getParameters(planta, varCom, varMed);

simulacao = simular('pendulo_nao_linear', model, controlador, planta, thetar, tf, varCom, varMed);
desenharGraficos(simulacao);