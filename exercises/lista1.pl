% Exercicio 1: 
analisa_lista([]) :- write('A lista esta vazia').
analisa_lista([X|B]) :- 
    write('A cabeca da lista eh: '), write(X), nl,
    write('A cauda da lista eh: '), write(B), nl.



% Exercicio 2: remove_duplicados(lista, resposta).
membro(X, [X|_]).
membro(X,[_|Y]) :- membro(X,Y).

remove_duplicados([],[]).
remove_duplicados([A|B], R) :- membro(A,B), !,remove_duplicados(B,R).
remove_duplicados([A|B], [A|R]) :- remove_duplicados(B,R).


% Exercicio 3: troca(listaE, valor, troca, listaS)
troca([], _, _, []).  
troca([A|B], X, Y, [A|R]) :- A \= X, troca(B, X, Y, R).  
troca([X|B], X, Y, [Y|R]) :- troca(B, X, Y, R), !.


% Exercicio 4: potencia(lista, lista de listas).


% Exercicio 5: mais long
mais_longa([_|_], []).
mais_longa(_|B, _|E) :- mais_longa(B, E).


% Exercicio 6: 
distancia([], [], 0).
distancia((X1, Y1), (X2,Y2), D) :- 
    DX is X2 - X1,
    DY is Y2 - Y1,
    D is sqrt(DX*DX + DY*DY).


% Exercicio 7: quadrado(X, "elm").
quadrado(X,Y) :- quadradoAUX(X,Y,Y).

linha(_,0) :- !.
linha(X,Y) :-
    write(X), write(' '), 
    Y1 is Y - 1, linha(X,Y1).

quadradoAUX(_,0,_) :- !.
quadradoAUX(X,Y,Z) :-
    linha(X,Z), nl,
    Y1 is Y - 1, quadradoAUX(X,Y1,Z).


% Exercicio 8:
elemento_n([A|_], 1, A).
elemento_n([_|B], N, X) :- 
    N > 1,
    N1 is N - 1,
    elemento_n(B, N1, X).


% Exercicio 9:
media(X,Y) :- mediaAUX(X,0,0,Y).

mediaAUX([],Z,W,Y) :- Y is W / Z.
mediaAUX([A|B],Z,W,Y) :-
    W1 is W + A,
    Z1 is Z + 1,
    mediaAUX(B,Z1,W1,Y).


% Exercicio 10:
minimo([A], A).
minimo([A|B], R) :- minimo(B,R1), R1 > A, R is A.
minimo([A|B], R) :- minimo(B,R1), R1 =< A, R is R1.


% Exercicio 11:
intervalo(X,Y,[]) :- X > Y.
intervalo(X,Y,[X|B]) :- 
    X =< Y,
    X1 is X + 1, 
    intervalo(X1,Y,B).

% Exercicio 12: mdc


% Exercicio 13:
ocorrencias(_, [], 0).
ocorrencias(X,[X|B],N) :- !, ocorrencias(X,B,N1), N is N1 + 1.
ocorrencias(X,[_|B],N) :- ocorrencias(X,B,N).


% Exercicio 14: 
divisores(N,L) :- findall(Y, (between(1,N,Y), N mod Y =:= 0), L).

% Extras 1:
penultimo([A|[_]], A).
penultimo([_|C], X) :- penultimo(C, X). 

% Extras 2:
maximo(X,[X]).
maximo(A,[A|B]) :- maximo(X,B), A >= X.
maximo(X,[A|B]) :- maximo(X,B), A < X.

% Extras 3: 
comprimento(0,[]).
comprimento(N,[_|B]) :- comprimento(N1,B), N is N1 + 1.


% Extra 4:
nesimo(0,[A|_],A).
nesimo(N,[_|B],X) :- N1 is N - 1, nesimo(N1,B,X).

% Extra 5:
total([],0).
total([A|B], N) :- total(B,N1), N is N1 + A.