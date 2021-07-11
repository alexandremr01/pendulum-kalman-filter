function desenharGraficosSemKalman(simulacao)

formato = 'png'; 
% formato = 'eps';

figure;
plot(simulacao.thetam.time, simulacao.thetam.signals.values, 'k', 'LineWidth', 2);
hold on;
plot(simulacao.thetar.time, simulacao.thetar.signals.values, 'r', 'LineWidth', 2);
hold on;
plot(simulacao.theta.time, simulacao.theta.signals.values, 'b', 'LineWidth', 2);
hold on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Theta (rad)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Medido', 'Referencia', 'Executado');
grid on;
salvarGrafico('theta', formato);
 
figure;
plot(simulacao.acom.time, simulacao.acom.signals.values, 'r', 'LineWidth', 2);
hold on;
plot(simulacao.a.time, simulacao.a.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Aceleração (m/s^2)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Comandada', 'Executada');
grid on;
salvarGrafico('comando', formato);

figure;
v = [0; diff(simulacao.thetam.signals.values)];
% plot(simulacao.v.time, v, 'LineWidth', 2);
% hold on;
% hold on;
plot(simulacao.vm.time, simulacao.vm.signals.values, 'r', 'LineWidth', 2);
hold on;
plot(simulacao.v.time, simulacao.v.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Velocidade (m/s)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Medida', 'Executada');
grid on;
salvarGrafico('comando', formato);

end

function salvarGrafico(nome, formato)
if strcmp(formato, 'png')
    print('-dpng', '-r400', nome);
else
    print('-depsc2', nome);
end
end
