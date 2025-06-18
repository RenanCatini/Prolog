% Lista 2 de exercícios de Programação Lógica

% Exercicio 1: 
% 123
% 1 4 9 16 25
% 10: 11: 12: 13: ...

% Exercicio 2: 
a :- a(0).
a(X) :- X > 10, !.
a(X) :- write(X), write(' '), X1 is X+1, a(X1).
% 1 2 3 4 5 6 7 8 9 10

% Exercicio 3:
wN(0) :- write(0),!.
wN(N) :- write(N), N1 is N-1, wN(N1), write(N).

space(0) :- !.
space(N) :- write(' '), N1 is N - 1, space(N1).

pAux(N,_) :- N < 0, !.
pAux(N,I) :- 
    N1 is N-1,
    pAux(N1,I),
    M is I - N,
    space(M), 
    wN(N), nl.

piramide(N) :- pAux(N,N).

% Exercicio 4: 
elevado(_,0,1) :- !.
elevado(X,Y,Z) :- Y1 is Y-1, elevado(X,Y1,Z1), Z is X*Z1. 

% Exercicio 5:
d(0).
d(1).

% Exercicio 6:
palindromo(L) :- reverse(L, LR), L == LR.

% Exercicio 7:
metIguais(L) :- 
    length(L,T), Met is T/2, 
    length(A,Met), append(A,B,L), A == B.
    
% Exercicio 8:
insOrd(El,[A|B], [El,A|B]) :- El < A, !.
insOrd(El,[A|B], [A|R]) :- insOrd(El,B,R).

% Exercicio 9:
particiona(X,A,B) :- length(X,L), L mod 2 =:= 0, T is L/2, length(A,T), append(A,B,X).
particiona([X|Xs],[X|A],B) :- length(Xs,L), T is L/2, length(A,T), append(A,B,Xs).

% Exercicio 10: merge(A,B,R)
merge([],B,B) :- !.
merge(A,[],A) :- !.
merge([A|As],[B|Bs],[A|R]) :- A < B, !,merge(As,[B|Bs],R).
merge([A|As],[B|Bs],[B|R]) :- A >= B, merge([A|As],Bs,R).

% Exercicio 11:
max(X,Y,M):- X>Y, M = X, !.
max(X,Y,M):- X=<Y, M = Y, !.
% O erro estava no corte, que não permitia o codigo continuar para a segunta clausula

% Exercicio 12: ??????????????/

% Exercicio 13:
pred1(L,R) :- findall([El], member(El, L), R).
 
pred2(L,R) :- findall(pred(El,El), member(El,L), R).

pred3(L,R) :- findall([element,El], member(El,L), R).


% Exercicio 14:
transforma('encher o jarro 1', [X,Y], [3,Y]) :- X < 3.
transforma('encher o jarro 2', [X,_], [X,4]) :- X < 4.
transforma('esvaziar o jarro 1', [X,Y], [0,Y]) :- X > 0.
transforma('esvaziar o jarro 2', [X,Y], [X,0]) :- Y > 0.
transforma('transferir do jarro 1 para o jarro 2', [X,Y], [Xn,Yn]) :-
    X > 0, Y < 4,
    Min is min(X, 4-Y),
    Xn is X - Min,
    Yn is Y + Min.
transforma('transferir do jarro 2 para o jarro 1', [X,Y], [Xn,Yn]) :-
    X < 3, Y > 0,
    Min is min(Y, 3-X),
    Xn is X + Min,
    Yn is Y - Min.

% Predicado principal para iniciar a resolução
resolve :-
    caminho([0,0], [_,2], [[0,0]], Caminho),
    imprimir_caminho(Caminho).

% Caminho entre estados, evitando ciclos
caminho(Estado, Estado, _, []) :- !.
caminho(EstadoAtual, EstadoObjetivo, Visitados, [Acao|Caminho]) :-
    transforma(Acao, EstadoAtual, NovoEstado),
    \+ member(NovoEstado, Visitados),
    caminho(NovoEstado, EstadoObjetivo, [NovoEstado|Visitados], Caminho).

% Impressão das ações realizadas
imprimir_caminho([]) :- write('Fim!'), nl.
imprimir_caminho([Acao|Resto]) :-
    write(Acao), nl,
    imprimir_caminho(Resto).



