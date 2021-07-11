function model = getParameters(planta, varCom, varMed)
  A = [0 1; 
      -planta.g/planta.l 0];
  B = [0; 1/planta.l];
  T = 1e-2;
  
  model.F = expm(A*T);
  model.G = integral(@(t)expm(A*t)*B, 0, T, 'ArrayValued',true);
  model.Q = model.G * varCom * model.G'; %covariance of process
  model.R = varMed;                      %covariance of measurement  

end