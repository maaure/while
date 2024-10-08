grammar Enquanto;

programa : seqComando;     // sequência de comandos

seqComando: (comando ';')* ;

comando: ID ':=' expressao                                           # atribuicao
       | 'skip'                                                      # skip
       | 'se' expressao 'entao' comando ( 'senaose' expressao 'entao' comando )* ( 'senao' comando )? ; # se
       | 'enquanto' booleano 'faca' comando                          # enquanto
       | 'exiba' TEXTO                                               # exiba
       | 'escreva' expressao                                         # escreva
       | '{' seqComando '}'                                          # bloco
       | 'para' ID 'de' expressao 'ate' expressao 'faca' comando     # para
       | 'repita' expressao 'vezes' comando                          # repita
       ;

expressao: INT                                           # inteiro
         | 'leia'                                        # leia
         | ID                                            # id
         | expressao '*' expressao                       # opBin
         | expressao '^' expressao                       # opBin
         | expressao '/' expressao                       # opBin
         | expressao ('+' | '-') expressao               # opBin
         | '(' expressao ')'                             # expPar
         ;

booleano: BOOLEANO                                       # bool
        | expressao '=' expressao                        # opRel
        | expressao '<=' expressao                       # opRel
        | expressao '<' expressao                        # opRel
        | expressao '>' expressao                        # opRel
        | expressao '>=' expressao                       # opRel
        | expressao '<>' expressao                       # opRel
        | booleano 'ou' booleano                         # ouLogico
        | booleano 'xou' booleano                        # xouLogico
        | 'nao' booleano                                 # naoLogico
        | booleano 'e' booleano                          # eLogico
        | '(' booleano ')'                               # boolPar
        ;

BOOLEANO: 'verdadeiro' | 'falso';
INT: ('0'..'9')+ ;
ID: ('a'..'z')+;
TEXTO: '"' .*? '"';

Comentario: '#' .*? '\n' -> skip;
Espaco: [ \t\n\r] -> skip;
