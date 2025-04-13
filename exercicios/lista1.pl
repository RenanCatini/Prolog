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
quadrado(X, EL) :- forall(between(1, X, _), (linha(X, EL), nl)).
linha(X, EL) :- forall(between(1, X, _), (write(EL), write(' '))).


% Exercicio 8:
elemento_n([A|_], 1, A).
elemento_n([_|B], N, X) :- 
    N > 1,
    N1 is N - 1,
    elemento_n(B, N1, X).


% Exercicio 9:
media([], 0).
media(L,M) :- soma(L,S), tamanho(L,T), M is S / T.
  
tamanho([], 0).
tamanho([_|B], T) :- tamanho(B, T1), T is T1 + 1.

soma([], 0).
soma([A|B], S) :- soma(B, S1), S is S1 + A.


% Exercicio 10:
minimo([A], A).
minimo([A|B], R) :- minimo(B,R1), R1 > A, R is A.
minimo([A|B], R) :- minimo(B,R1), R1 =< A, R is R1.


% Exercicio 11:
intervalo(I, F, L) :- findall(X, between(I,F,X), L).


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
comprime([A|[A|B]], [A|B]) comprime.
comprime([_|B], B) :- comprime(B, B).
comprime([], []).


