% Repetir / loop
repetir :- 
    repeat,
    write('oi'), nl,
    write('Continuar? [s/n] '),
    read(Resposta),
    (Resposta == 'n' -> ! ; fail).


% Cadastrar itens em uma base de fatos.
:-dynamic(num/1).

cadastra([]).
cadastra([A|B]) :- assert(num(A)), cadastra(B).