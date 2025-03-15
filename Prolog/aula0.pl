% Fato 
pai(joao, jose).
pai(joao, maria).
mae(bia, jose).
mae(bia, maria).

% Regra
filho(X,Y) :- pai(Y,X).