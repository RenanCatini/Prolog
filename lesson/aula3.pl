%Permutação

seleciona(X,[X|Y],Y).
seleciona(A,[B|C], [B|D]) :- seleciona(A,C,D).


permuta(A, [B|D]) :- seleciona(B, A, C), permuta(C, D).
permuta([],[]).


ordem([]).
ordem([_]).
ordem([A, B|C]) :- A =< B, !, ordem([B|C]).


in(X, [X|_]) :- !.
in(X, [_|Y]) :- in(X,Y).


add(X,L,L) :- in(X,L), !.
add(X,L,[X|L]).


ap([],L,L).
ap([A|B], C, [A|D]) :- ap(B,C,D).


reversa([],[]).
reversa([A|B], L) :- reversa([B, Brev]), ap(Brev,[A],L).




