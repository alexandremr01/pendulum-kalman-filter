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

simulacao_com_filtro = simular(true, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);
simulacao_sem_filtro = simular(false, model, controlador, planta, thetar, tf, varianciaComando, varianciaMedida);

% Escolha o formato dos gráficos; 
formato = 'eps';

desenharGraficos(simulacao_com_filtro, formato);
desenharGraficos(simulacao_sem_filtro, formato);

gerarAnimacao(simulacao_com_filtro, planta, thetar);
gerarAnimacao(simulacao_sem_filtro, planta, thetar);

meio = floor(length(simulacao_sem_filtro.theta.signals.values) / 2);
media_sem_filtro = mean(simulacao_sem_filtro.theta.signals.values(meio:end, 1));
desv_sem_filtro = std(simulacao_sem_filtro.theta.signals.values(meio:end, 1));

media_com_filtro = mean(simulacao_com_filtro.theta.signals.values(meio:end, 1));
desv_com_filtro = std(simulacao_com_filtro.theta.signals.values(meio:end, 1));