% Valor de referência do ângulo do pêndulo em radianos
thetar = 0;
% Tempo de simulação
tf = 10;
% Variâncias
varianciaComando = 10;
varianciaMedida = 0.5;

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);
model = obterParametros(planta, varianciaComando, varianciaMedida);

sim_com_filtro = simular(true, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);
sim_sem_filtro = simular(false, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);

% Escolha o formato dos gráficos; 
formato = 'eps';

desenharGraficos(sim_com_filtro, formato);
desenharGraficos(sim_sem_filtro, formato);

gerarAnimacao(sim_com_filtro, planta, thetar);
gerarAnimacao(sim_sem_filtro, planta, thetar);