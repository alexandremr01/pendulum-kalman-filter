# Controle do Pêndulo Invertido com Ruído de Medida e de Comando

# Para ver o resulto do trabalho basta rodar o script executarTudo.m

## Scripts

### Principais

* executarTudo: realiza duas simulações, com filtro e sem filtro, com referência zero. Plota 3 pares de gráficos: ângulo, velocidade e aceleração (comando).

* desenharGraficos: plota os gráficos resultantes de uma simulação.

* gerarAnimacao: gera a animação de uma dada simulação.

* simular: configura e executa o arquivo simulink.

### Auxiliares

* obterParametros: carrega os parametros necessários para a obtenção da equação de próximo estado a partir do modelo no espaço de estados.

* obterPlanta: carrega os parametros da dinâmica do sistema.

* obterRequisitos: carrega os requisitos do sistema dinâmico. 

* projetarControlador: retorna os valores dos ganhos do controlador PD.

## Equipe

* Alexandre Maranhão da Rocha
* Alvaro Tedeschi Neto
* Davi Muniz Vasconcelos