thetar = 1;
tf = 100;
varCom = 0.00;
varMed = 0.000;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);

simulacao = simular('pendulo_nao_linear', controlador, planta, thetar, tf, varCom, varMed);
desenharGraficosSemKalman(simulacao);