function gerarAnimacao(simulacao, planta, thetar)

    if simulacao.filtroAtivado
        vectorScale = 0.025;
        suffix = '_filtro';
    else
        vectorScale = 0.0025;
        suffix = '_sem_filtro';
    end

    l = planta.l;
    t = simulacao.tout;
    x = simulacao.x.signals.values;
    theta = simulacao.theta.signals.values;
    ai = simulacao.a.signals.values;
    a = ones(length(t), 1);
    for n = 1:length(t)
        a(n) = ai(floor(n/10)+1);
    end
    
    ai = a;
    
    % Para ajustar os eixos do grafico de modo a possibilitar
    % ver toda a simulacao
    minX = min(x) - l;
    maxX = max(x) + l;
    minY = 0;
    maxY = l * 5/3 + l/3;
    deltaX = maxX - minX;
    deltaY = maxY - minY;
    tamanhoEixo = max(deltaX, deltaY);
    
    dt = 1 / 30;
    tempoVideo = t(1):dt:t(end);
    % Interpolando para que o video fique numa taxa de quadros adequada
    x = interp1(t, x, tempoVideo);
    theta = interp1(t, theta, tempoVideo);
    a = interp1(t, a, tempoVideo);

    close all;
    figure;
    hold on;
    [carrinho, bola] = computarPontos(x(1), theta(1), l);
    % Desenho inicial do sistema
    handleChassis = plot([carrinho.c1(1), carrinho.c2(1), carrinho.c3(1), carrinho.c4(1), carrinho.c1(1)], ...
        [carrinho.c1(2), carrinho.c2(2), carrinho.c3(2), carrinho.c4(2), carrinho.c1(2)], 'k', 'LineWidth', 3);
    handleLine = plot([bola.engate(1), bola.engate(1) + l*sin(thetar)], [bola.engate(2), bola.engate(2) + l*cos(thetar)], 'k--', 'LineWidth', 2);
    handleStick = plot([bola.engate(1), bola.pos(1)], [bola.engate(2), bola.pos(2)], 'k', 'LineWidth', 3);
    handleBall = plot(bola.pos(1), bola.pos(2), 'r.', 'MarkerSize', 50);
    handleAcel = quiver(carrinho.centro(1), carrinho.centro(2), a(1), 0, vectorScale, 'b', 'LineWidth', 3);
    handleText = text(0, 2*l - 0.1, sprintf('a = %.2f m/s^2', ai(1)), 'FontSize', 20);
    
    %axis square;
    axis([minX, minX + tamanhoEixo, minY, maxY]);
    set(gca, 'nextplot', 'replacechildren');
    xlabel('X (m)', 'FontSize', 14);
    ylabel('Y (m)', 'FontSize', 14);
    set(gca, 'FontSize', 14);
    grid on;
    
    % Para salvar video (exibe animacao em tempo real)
    video = VideoWriter(sprintf('animacao%s.avi', suffix));
    video.FrameRate = 60;
    video.Quality = 100;
    open(video);
    drawnow;
    f = gcf;
    f.Position = [0 100 1920 1080];
    frame = getframe(gcf);
    writeVideo(video, frame);
    % Aqui comeca-se de 2 porque o frame 1 ja foi desenhado antes
    for i=2:length(tempoVideo)
        [carrinho, bola] = computarPontos(x(i), theta(i), l);
        set(handleChassis, 'XData', [carrinho.c1(1), carrinho.c2(1), carrinho.c3(1), carrinho.c4(1), carrinho.c1(1)],...
            'YData', [carrinho.c1(2), carrinho.c2(2), carrinho.c3(2), carrinho.c4(2), carrinho.c1(2)]);
        set(handleBall, 'XData', bola.pos(1), 'YData', bola.pos(2));
        set(handleStick, 'XData', [bola.engate(1), bola.pos(1)], 'YData', [bola.engate(2), bola.pos(2)]);
        set(handleAcel, 'XData', carrinho.centro(1), 'YData', carrinho.centro(2),...
        'UData', a(i), 'VData', 0);
        set(handleLine, 'XData', [bola.engate(1), bola.engate(1) + l*sin(thetar)], 'YData', [bola.engate(2), bola.engate(2) + l*cos(thetar)]);
        set(handleText, 'Position', [carrinho.centro(1) + 0.9*l, 2*l - 0.1],'String',  sprintf('a = %.2f m/s^2', ai(i)));
        set(gca, 'XLim', [carrinho.c1(1) - l, carrinho.c2(1) + l]);
        drawnow;
        pause(dt);
        frame = getframe(gcf);
        writeVideo(video, frame);
    end
    close(video);
    
end

function [carrinho, bola] = computarPontos(x, theta, l)
    carrinho.centro = [l/3 + x, l/3];
    
    bola.engate = carrinho.centro + l/3 * [0, 1];
    bola.pos = bola.engate + l * [sin(theta), cos(theta)];
    
    carrinho.c1 = carrinho.centro + l/3 * [-1, 1];
    carrinho.c2 = carrinho.centro + l/3 * [1, 1];
    carrinho.c3 = carrinho.centro + l/3 * [1, -1];
    carrinho.c4 = carrinho.centro + l/3 * [-1, -1];
end