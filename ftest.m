function y = ftest(t)
  A = [0 1; 9.81/0.5 0];
  B = [0; 1/0.5];
  y = expm(A.*t);
end