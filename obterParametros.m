function model = obterParametros(planta, varCom, varMed)
% Carrega os parametros necessarios para a obtenção
% da equação de próximo estado a partir do modelo no
% espaço de estados
% model.F : matriz de transição de estado
% model.G : matriz de entrada de controle 
% model.Q : covariância do ruído de movimento
% model.R : covariância do ruído de medida

A = [0 1;
    -planta.g/planta.l 0];
B = [0; 1/planta.l];
T = 1e-2;

model.F = expm(A*T);
model.G = integral(@(t)expm(A*t)*B, 0, T, 'ArrayValued',true);
model.Q = model.G * varCom * model.G';
model.R = varMed;
model.T = T;
end