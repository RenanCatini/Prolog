/*
Considere a solução apresentada em aula para o problema dos Missionários e Canibais:

"Temos três missionários e três canibais que precisam atravessar um rio com um barco 
que tem a capacidade de transportar, no máximo, duas pessoas. A restrição é que não 
odemos ter um número maior de canibais do que missionários em qualquer margem, senão  
os missionários serão devorados. Ao menos uma pessoa deve transportar o barco de uma 
margem para outra. Encontre a sequência de movimentos que resolva o problema."

Você deverá implementar uma generalização para o problema, em que são definidos: 
(1) número de Missionarios e Canibais na margem do rio
(2) a capacidade do barco. 

O programa deverá permitir que o usuário informe o número de missionários e canibais 
na margem esquerda do rio e a quantidade de pessoas que podem ir e vir no barco. 
Em função desses parâmetros o programa deverá buscar (usando busca em largura, 
profundidade ou heurística) e apresentar a solução do problema (se houver).
*/

% Estado inicial = [M, C, 0, 0, esquerda]
% Estado final = [0, 0, M, C, direita]

/*
    Busca em largura 
    Código adaptado do busca em largura e em profundidade dado na
    sessão "Material" do Moodle de Prolog.
*/
%-------------------------------------------------------------------------------------------

% meta
meta([0, 0, _, _, d]).

atingemeta([_-E|_]) :- meta(E).

ap([],X,X).
ap([A|B],C,[A|D]) :- ap(B,C,D).

busca([Caminho|_], Solucao, _) :- atingemeta(Caminho), !, Solucao = Caminho.
busca([Caminho|Lista], Solucao, K) :- 
   findall(UMAEXT, estende(Caminho, UMAEXT, K), EXT),
   ap(Lista, EXT, Lista1),
   busca(Lista1, Solucao, K).

estende([OperacaoX-EstadoA|Caminho], [OperacaoY-EstadoB,OperacaoX-EstadoA|Caminho], K) :-
   oper(OperacaoY, EstadoA, EstadoB, K),
   not(member(OperacaoY-EstadoB, Caminho)).

% ------------------------------------------------------------------------------------------

% Checa se a posição atual é segura
seguro([Me, Ce, Md, Cd, _]) :-
    Me >= 0, Ce >= 0, Md >= 0, Cd >= 0,
    (Me == 0 ; Me >= Ce),
    (Md == 0 ; Md >= Cd).

% Gera todas as possibilidades de barco.
movimento(K, Me, Ce, M, C) :-
    between(0, K, M),
    between(0, K, C),
    Total is M + C,
    Total >= 1, Total =< K,
    M =< Me, C =< Ce.

% Operações de mudança de margem
oper(Acao, [Me, Ce, Md, Cd, e], [Me2, Ce2, Md2, Cd2, d], K) :-
    movimento(K, Me, Ce, M, C),
    Me2 is Me - M, Ce2 is Ce - C,
    Md2 is Md + M, Cd2 is Cd + C,
    seguro([Me2, Ce2, Md2, Cd2, _]),
    format(atom(Acao), 'Levar ~d M e ~d C para a margem direita.', [M, C]).

oper(Acao, [Me, Ce, Md, Cd, d], [Me2, Ce2, Md2, Cd2, e], K) :-
    movimento(K, Md, Cd, M, C),
    Me2 is Me + M, Ce2 is Ce + C,
    Md2 is Md - M, Cd2 is Cd - C,
    seguro([Me2, Ce2, Md2, Cd2, _]),
    format(atom(Acao), 'Levar ~d M e ~d C para a margem esquerda.', [M, C]).

% Imprimir caminho
imprimir_caminho([]).
imprimir_caminho([Acao-Estado|R]) :-
    imprimir_caminho(R),
    write(Acao), write(' -> '), write(Estado), nl.

% Função principal
resolve(M, C, K) :- 
    busca([[inicio-[M, C, 0, 0, e]]], Solucao, K),
    imprimir_caminho(Solucao).