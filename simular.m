function simulacao = simular()

planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControlador(requisitos, planta);


thetar = pi/2;
tf = 10;

assignin('base', 'thetar', thetar);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);    
% assignin('base', 'varh', varh);
    
load_system('pendulo');
set_param('pendulo', 'StopTime', sprintf('%g', tf));
simulacao = sim('pendulo');

end