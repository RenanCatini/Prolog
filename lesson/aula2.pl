% Aula de listas em prolog

% Ver se um elemento pertence a uma lista
membro(X, [X|_]).
membro(X,[_|Y]) :- membro(X,Y).

% concatenar duas listas L1+L2
ap([], L, L).
ap([X|L1], L2, [X|L3]) :- ap(L1, L2, L3).

% maximo(valor, lista).
max(X, [X]).
max(A, [A|B]) :- max(C, B), A >= C.
max(C, [A|B]) :- max(C, B), A < C.

% comprimento(C, lista).
comp(0, []). %Comprimento da lista vazia
comp(C, [_|B]) :- comprimento(A, B), C is A+1.

% nesimo(Xnesimo, lista, valor).
nesimo(1, [A|_], A).
nesimo(N, [_|Y], X) :- N>1, M is N-1, nesimo(M, Y, X).


% total(T, lista).
total([], 0).
total([X|Y], T) :- total(Y, B), T is X+B.






