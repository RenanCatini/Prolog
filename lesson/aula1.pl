% Objetos Prolog

% -Atomos e números ("Valores")
%   Podem ser escritos de 3 formas: 
%       1) Strings de letras minúsculas (ana, nil, x25)
%       2) Strings de caracteres epeciais (<--->)
%       3) Strings entre aspas ('Tom', 'América')
%       4) Numeros inteiros e reais

% -Variaveis 
%   Escritas em letras maiusculas ou underscore (X, _25)
%   Ex.: tem_filho(X) :- pai(X,Y).

% Todo objeto em prolog é representado por uma arvore
% Exemplo: Ponto, Reta e Triangulo
% P1=ponto(1,1)
% P2=ponto(2,3)
% S=seg(P1,P2)=seg(ponto(1,1),ponto(2,3))
% T=triang(ponto(4,2),ponto(6,4),ponto(7,1))

% Listas: Cabeça e cauda
placar([0,1,2,3,4,5,6]).