function simulacao = simular(thetar, tf, varCom, varMed)

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
assignin('base', 'varMed', varMed);
assignin('base', 'varCom', varCom);
 
sistema = 'pendulo_kalman';
load_system(sistema);
set_param(sistema, 'StopTime', sprintf('%g', tf));
simulacao = sim(sistema);

end