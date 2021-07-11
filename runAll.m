thetar = 0;
tf = 100;
varCom = 0.01;
varMed = 0.001;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControladorPV(requisitos, planta);

simulacao = simular('pendulo_pv', controlador, planta, thetar, tf, varCom, varMed);
desenharGraficos(simulacao);