% Ver se elemento pertence a lista
pertence([A|_], A).
pertence([_|B], A) :- pertence(B,A).

% Maximo valor da lista
maximo([X], X).
maximo([X|Y], M) :- maximo(Y, M1), X > M1, M is X.
maximo([_|Y], M) :- maximo(Y, M).


% Somar os elementos de uma lista
somar([], 0).
somar([A|B], S) :- somar(B, S1), S is A + S1.

% Comprimento da lista
comprimento([], 0).
comprimento([_|Y], C) :- comprimento(Y, C1), C is 1 + C1.


% Nesimo elemento: 
nesimo(1, [A|_], A).
nesimo(N, [_|B], A) :- N > 1, M is N-1, nesimo(M, B, A).



% Exercicio 2:
membro(X,[X|_]).
membro(X, [_|Y]) :- membro(X,Y).

remove_duplicados([],[]).
remove_duplicados([A|B], R) :- membro(A,B), !,remove_duplicados(B,R).
remove_duplicados([A|B], [A|R]) :- remove_duplicados(B,R).

% Exercicio 3: 
troca([],_,_,[]).
troca([A|B],X,Y,[Y|R]) :- A == X, troca(B,X,Y,R).
troca([A|B],X,Y,[A|R]) :- troca(B,X,Y,R), !.

% Exercicio 5:
mais_longa([],[_]).
mais_longa([_|B], [_|D]) :- mais_longa(B,D).

% Exercicio 6:
distancia((A,B), (C,D), X) :- 
    X1 is (A-C)*(A-C),
    Y1 is (B-D)*(B-D),
    X is sqrt(X1+Y1).

% Exercicio 7: quadrado
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
elemento_n([A|_],1,A).
elemento_n([_|B],N,X) :- 
    N1 is N - 1,
    elemento_n(B,N1,X).

% Exercicio 9:
media(X,Y) :- mediaAUX(X,0,0,Y).

mediaAUX([],Z,W,Y) :- Y is W / Z.
mediaAUX([A|B],Z,W,Y) :-
    W1 is W + A,
    Z1 is Z + 1,
    mediaAUX(B,Z1,W1,Y).

% Exercicio 10:
minimo([A],A).
minimo([A|B],X) :- minimo(B,X), X < A.
minimo([A|B],A) :- minimo(B,X), X >= A.

% Exercicio 11:
intervalo(X,Y,[]) :- X > Y.
intervalo(X,Y,[X|B]) :- 
    X =< Y,
    X1 is X + 1, 
    intervalo(X1,Y,B).

% Exercicio 12: 
ocorrencias(_,[],0).
ocorrencias(X,[X|B],N) :- !, ocorrencias(X,B,N1), N is N1 + 1.
ocorrencias(X,[_|B],N) :- ocorrencias(X,B,N).





