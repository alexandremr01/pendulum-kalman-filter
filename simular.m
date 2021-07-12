function simulacao = simular(filter, model, controlador, planta, thetar, tf, varCom, varMed)

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
assignin('base', 'model', model);    

assignin('base', 'varMed', varMed);
assignin('base', 'varCom', varCom);
 

if filter
    sistema = 'pendulo_filtro';
else
    sistema = 'pendulo_sem_filtro';
end

load_system(sistema);
set_param(sistema, 'StopTime', sprintf('%g', tf));
simulacao = sim(sistema);
desenharGraficos(simulacao, filter);

end