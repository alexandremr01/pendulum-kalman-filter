thetar = 0;
tf = 15;
varCom = 1;
varMed = 0.001;

simulacao = simular('pendulo_nao_linear', thetar, tf, varCom, varMed);
desenharGraficos(simulacao);