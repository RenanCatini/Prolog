% Solucao do problema das 4-rainhas

apaga(A,[A|B],B).
apaga(X,[Y|Z],[Y|W]) :- apaga(X,Z,W).

solucao1(S) :- resolve(S,[1,2,3,4],[1,2,3,4], [3,2,1,0,-1,-2,-3],
    [2,3,4,5,6,7,8]).

resolve([],[],_,_,_).
resolve([C|LC],[L|LL],CO,DS,DI) :-
    apaga(C,CO,CO1),
    NS is L - C,
    NI is L + C,
    apaga(NS,DS,DS1),
    apaga(NI,DI,DI1),
    resolve(LC,LL,CO1,DS1,DI1).

% Problema das n-rainhas
intervalo(I,I,[I]).
intervalo(I,F,[I|L]) :- 
    I < F, I1 is I + 1, intervalo(I1,F,L).

solucao2(N,S) :- 
    intervalo(1,N,LC),
    N2 is N * 2,
    intervalo(2,N2,DI),
    I is -1 * (N-1),
    F is N-1,
    intervalo(I,F,DS),
    resolve(S,LC,LC,DS,DI).

% Agora vizualizar graficamente as linhas e colunas

linhaRainha(0,_) :- !.
linhaRainha(N,R) :- N == R, write('R '), N1 is N - 1, linhaRainha(N1,R).
linhaRainha(N,R) :- write('. '), N1 is N - 1, linhaRainha(N1,R).

tabRainhas(_,0,_) :- !.
tabRainhas(T,N,[A|B]) :- 
    linhaRainha(T,A), nl, 
    N1 is N - 1, !,tabRainhas(T,N1,B).

solucao3(N,S) :- 
    intervalo(1,N,LC),
    N2 is N * 2,
    intervalo(2,N2,DI),
    I is -1 * (N-1),
    F is N-1,
    intervalo(I,F,DS),
    resolve(S,LC,LC,DS,DI),
    tabRainhas(N,N,S).


