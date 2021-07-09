function simulacao = simular(thetar, tf, varCom, varMed)

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
assignin('base', 'varMed', varMed);
assignin('base', 'varCom', varCom);
 
load_system('pendulo');
set_param('pendulo', 'StopTime', sprintf('%g', tf));
simulacao = sim('pendulo');

end