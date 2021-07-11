function simulacao = simular(sistema, model, controlador, planta, thetar, tf, varCom, varMed)

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
assignin('base', 'model', model);    

assignin('base', 'varMed', varMed);
assignin('base', 'varCom', varCom);
 
% sistema = 'pendulo_nao_linear';
load_system(sistema);
set_param(sistema, 'StopTime', sprintf('%g', tf));
simulacao = sim(sistema);

end