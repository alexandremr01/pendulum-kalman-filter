# Controle do Pêndulo Invertido com Ruído de Medida e de Comando

## Scripts

### Principais

* executarTudo: realiza duas simulações, com filtro e sem filtro, com referência zero. Plota 3 pares de gráficos: ângulo, velocidade e aceleração (comando).

* desenharGraficos: plota os seis gráficos resultantes da simulação com filtro e da simulação sem filtro.

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