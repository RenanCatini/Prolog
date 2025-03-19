% Fatos

fato_casal(neuza, toninho).
pai(toninho, fabio).
pai(toninho, claudia).
pai(toninho, raquel).
mae(neuza, fabio).
mae(neuza, claudia).
mae(neuza, raquel).

fato_casal(maria_helena, luiz).
pai(luiz, fernando).
mae(maria_helena, fernando).

fato_casal(claudia, fernando).
pai(fernando, renan).
pai(fernando, larissa).
mae(claudia, renan).
mae(claudia, larissa).

fato_casal(silvia, fernando_olivares).
pai(fernando_olivares, igor).
mae(silvia, igor).
pai(fernando_olivares, fabiana).
mae(silvia, fabiana).


fato_casal(fabiana, seila).
pai(seila, rafaella).
pai(seila, isabella).
mae(fabiana, rafaella).
mae(fabiana, isabella).

fato_casal(raquel, igor).
pai(igor, gabriel).
mae(raquel, gabriel).

pai(japao, graziele).
mae(lourdes, graziele).

fato_casal(graziele, fabio).
mae(graziele, davi).
mae(graziele, maria).
pai(fabio, davi).
pai(fabio, maria).


% Regras

casal(Homem, Mulher) :- fato_casal(Homem, Mulher); fato_casal(Mulher, Homem).

avoH(Avo, Neto) :- pai(Pai, Neto), pai(Avo, Pai).
avoH(Avo, Neto) :- mae(Mae, Neto), pai(Avo, Mae).

avoM(Avo, Neto) :- pai(Pai, Neto), mae(Avo, Pai).
avoM(Avo, Neto) :- mae(Mae, Neto), mae(Avo, Mae).

irmao(Irmao1, Irmao2) :- pai(Pai, Irmao1), pai(Pai, Irmao2), Irmao1 \= Irmao2.

tios(Tio, Sobrinho) :- pai(Pai, Sobrinho), irmao(Pai, Tio); pai(Pai, Sobrinho), irmao(Pai, IrmaoDoPai), casal(IrmaoDoPai, Tio).
tios(Tio, Sobrinho) :- mae(Mae, Sobrinho), irmao(Mae, Tio); mae(Mae, Sobrinho), irmao(Mae, IrmaoDaMae), casal(IrmaoDaMae, Tio).

primos(Primo, Eu) :- tios(Tios, Eu), pai(Tios, Primo).


antecessor(X, Y) :- pai(X, Y). %   X for pai de Y -> X é antecessor de Y
antecessor(X, Y) :- mae(X, Y). %   X for mae de Y -> X é antecessor de Y
antecessor(X, Y) :- pai(X, Z), antecessor(Z, Y). %  X for pai de Z -> Z é antecessor de Y
antecessor(X, Y) :- mae(X, Z), antecessor(Z, Y). %  X for mae de Z -> Z é antecessor de Y

% Explicação: 
% X ------> Y  (X é antecessor de Y)
% X -> Z -> Y  (X é antecessor de Z se Z for antecessor de Y)
















