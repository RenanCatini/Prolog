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



