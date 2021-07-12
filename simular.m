function simulacao = simular(filter, model, controlador, planta, thetar, tf, varCom, varMed)

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
assignin('base', 'model', model);    

assignin('base', 'varMed', varMed);
assignin('base', 'varCom', varCom);
 

if filter
    sistema = 'pendulum_with_filter';
else
    sistema = 'pendulum_without_filter';
end

load_system(sistema);
set_param(sistema, 'StopTime', sprintf('%g', tf));
simulacao = sim(sistema);
desenharGraficos(simulacao, filter);

end