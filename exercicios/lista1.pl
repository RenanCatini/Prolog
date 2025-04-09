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



