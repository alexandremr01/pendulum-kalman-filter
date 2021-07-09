function desenharGraficos(simulacao)

formato = 'png'; 
% formato = 'eps';

figure;
plot(simulacao.thetar.time, simulacao.thetar.signals.values, 'r', 'LineWidth', 2);
hold on;
plot(simulacao.theta.time, simulacao.theta.signals.values, 'b', 'LineWidth', 2);
hold on;
plot(simulacao.thetam.time, simulacao.thetam.signals.values, 'LineWidth', 2);
hold on;
plot(simulacao.thetaf.time, simulacao.thetaf.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Theta (rad)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Referencia', 'Executado', 'Medido', 'Filtrado');
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

end

function salvarGrafico(nome, formato)
if strcmp(formato, 'png')
    print('-dpng', '-r400', nome);
else
    print('-depsc2', nome);
end
end
