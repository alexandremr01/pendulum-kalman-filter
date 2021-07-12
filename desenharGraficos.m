function desenharGraficos(simulacao, filtroAtivado)
% Plota uma sequencia de graficos com/sem filtro

% formato = 'png'; 
formato = 'eps';

if filtroAtivado
    suffix = '_filtro';
else
    suffix = '';
end

figure;
plot(simulacao.thetam.time, simulacao.thetam.signals.values, 'Color', '#90EE90', 'LineWidth', 2);
hold on;
hold on;
plot(simulacao.theta.time, simulacao.theta.signals.values,  'r', 'LineWidth', 2);
hold on;
if filtroAtivado
    plot(simulacao.thetaf.time, simulacao.thetaf.signals.values, 'Color', '#FF8C00', 'LineWidth', 2);
    hold on;
end
plot(simulacao.thetar.time, simulacao.thetar.signals.values,  'b', 'LineWidth', 2);

xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\theta (rad)', 'FontSize', 14);
set(gca, 'FontSize', 14);
if filtroAtivado
    legend('Medido', 'Executado', 'Filtrado', 'Referencia');
else 
    legend('Medido', 'Executado', 'Referencia');
end
grid on;
salvarGrafico(sprintf('theta%s', suffix), formato);
 
figure;
plot(simulacao.acom.time, simulacao.acom.signals.values, 'Color', '#90EE90', 'LineWidth', 2);
hold on;
plot(simulacao.a.time, simulacao.a.signals.values, 'r', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Aceleração (m/s^2)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Comandada', 'Executada');
grid on;
salvarGrafico(sprintf('command%s', suffix), formato);

figure;
if filtroAtivado
    plot(simulacao.v.time, simulacao.v.signals.values, 'r', 'LineWidth', 2);
    hold on;
    plot(simulacao.vf.time, simulacao.vf.signals.values, 'Color', '#FF8C00', 'LineWidth', 2); 
    legend('Executada', 'Filtrada');
else
    plot(simulacao.v.time, simulacao.v.signals.values, 'r', 'LineWidth', 2);
    hold on;
    legend('Executada');
end
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Velocidade Angular (rad/s)', 'FontSize', 14);
set(gca, 'FontSize', 14);
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
