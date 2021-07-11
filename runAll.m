thetar = 1.39;
tf = 10;
varCom = 0.001;
varMed = 0.001;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);

simulacao = simular('pendulo_nao_linear', controlador, planta, thetar, tf, varCom, varMed);
desenharGraficos(simulacao);