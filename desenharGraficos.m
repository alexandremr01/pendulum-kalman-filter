function desenharGraficos(simulacao, filtroAtivado)
% Plota uma sequencia de graficos com/sem filtro

formato = 'png'; 
% formato = 'eps';

if filtroAtivado
    suffix = '_filtro';
else
    suffix = '';
end

figure;
plot(simulacao.thetam.time, simulacao.thetam.signals.values, 'LineWidth', 2);
hold on;
plot(simulacao.thetar.time, simulacao.thetar.signals.values, 'LineWidth', 2);
hold on;
plot(simulacao.theta.time, simulacao.theta.signals.values, 'LineWidth', 2);
hold on;
if filtroAtivado
    plot(simulacao.thetaf.time, simulacao.thetaf.signals.values, 'LineWidth', 2);
end
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Theta (rad)', 'FontSize', 14);
set(gca, 'FontSize', 14);
if filtroAtivado
    legend('Medido','Referencia', 'Executado', 'Filtrado');
else 
    legend('Medido','Referencia', 'Executado');
end
grid on;
salvarGrafico(sprintf('theta%s', suffix), formato);
 
figure;
plot(simulacao.acom.time, simulacao.acom.signals.values, 'LineWidth', 2);
hold on;
plot(simulacao.a.time, simulacao.a.signals.values,'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Aceleração (m/s^2)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Comandada', 'Executada');
grid on;
salvarGrafico(sprintf('command%s', suffix), formato);

figure;
v_numeric = [0; diff(simulacao.thetam.signals.values)];
plot(simulacao.v.time, v_numeric, 'k', 'LineWidth', 2);
hold on;
plot(simulacao.v.time, simulacao.v.signals.values, 'LineWidth', 2);
hold on;
if filtroAtivado
    plot(simulacao.vf.time, simulacao.vf.signals.values, 'LineWidth', 2);  
end
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Velocidade (m/s)', 'FontSize', 14);
set(gca, 'FontSize', 14);
if filtroAtivado
    legend('Numérica', 'Executada', 'Filtrada');
else 
    legend('Numérica', 'Executada');
end
grid on;
salvarGrafico(sprintf('speed%s', suffix), formato);

end

function salvarGrafico(nome, formato)
if strcmp(formato, 'png')
    print('-dpng', '-r400', nome);
else
    print('-depsc2', nome);
end
end
