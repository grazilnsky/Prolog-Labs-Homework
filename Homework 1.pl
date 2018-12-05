%Ex1

go:-repeat,read_and_check(N,Type),write(N),write(' is '),write(Type),nl,N=:=100.

read_and_check(N, Type):- write("Enter next number: "), read(N), check(N, Type).
check(N,"odd"):- 1 is N mod 2.
check(N, "even"):- 0 is N mod 2.


%Ex2

divide(L, L1, L2) :-split(L, L, L1, L2).

split(B, [], [], B).
split([H|T], [_, _|T1], [H|T2], B):-split(T,T1,T2,B).
split([H|T], [_|T1], [H | T2], B) :-split(T, T1, T2, B).

%Ex3

op_not(true, false).
op_not(false, true).

op_or(true, true, true).
op_or(true, false, true).
op_or(false, true, true).
op_or(false, false, false).

op_and(A, B, Result):- op_not(A, A1), op_not(B, B1), op_or(A1,B1,C), op_not(C,Result), !.

op_xor(A, B, Result):- op_not(A, A1), op_not(B, B1), op_and(A, B1, C), op_and(B, A1, D), op_or(C, D, Result), !.

op_nor(A, B, Result):-op_not(A, A1), op_not(B, B1), op_and(A1, B1, Result).

op_nand(A, B, Result):-op_and(A, B, C), op_not(C, Result).

%Ex4

selsort(+L, -LS).
selsort([],[]).
selsort([H|T],[M1|LS]):-min(H,T,M1),remove(M1,[H|T],N),selsort(N,LS).

min(M,[],M).
min(M,[H|T],M1):-min2(M,H,N),min(N,T,M1).

min2(A,B,A):-less(A,B).
min2(A,B,B):-not(less(A,B)).

less(A,B):-(A<B).

myappend([],B,B).
myappend([H|A],B,[H|AB]):-myappend(A,B,AB).

remove(X,L,N):-myappend(A,[X|B],L),myappend(A,B,N).

%Ex5

pythagora(X,Y,Z) :-between(1, inf, Z), between(1, Z, X), between(X, Z, Y), Z*Z =:= X*X + Y*Y.

%Ex6

add([],[]).
add([X,+,Y|T],L):-add([[+,X,Y]|T],L).
add([[op,X,Y],+,Z|T],[[+,[op,X,Y],Z]|L]):-add(T,L).
add([H|T],[H|L]):-add(T,L).

multiply([],[]).
multiply([X,*,Y|T],L):-multiply([[*,X,Y]|T],L).
multiply([[op,X,Y],*,Z|T],[[*,[op,X,Y],Z]|L]):-multiply(T,L).
multiply([H|T],[H|L]):-multiply(T,L).

substract([],[]).
substract([X,-,Y|T],L):-substract([-,X,Y]|T,L).
substract([[op,X,Y],-,Z|T],[[-,[op,X,Y],Z]|L]):-substract(T,L).
substract([H|T],[H|L]):-substract(T,L).

divide([],[]).
divide([X,/,Y|T],L):-divide([[/,X,Y]|T],L).
divide([[op,X,Y],/,Z|T],[[/,[op,X,Y],Z]|L]):-divide(T,L).
divide([H|T],[H|L]):-divide(T,L).

parse([],_).
parse(L,RL):-multiply(L,R1),divide(R1,R2),add(R2,R3),substract(R3,[RL|H]),
	parse([],H),!.

evpf([*,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1*Res2.
evpf([/,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1/Res2.
evpf([+,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1+Res2.
evpf([-,A,B],Res):-evpf(A,Res1),evpf(B,Res2),Res is Res1-Res2.
evpf(Number,Number):-number(Number).

evaluate(L,Res):-parse(L,RL),evpf(RL,Res),!.


%Ex 7

equation(L,LT,RT) :-split(L,LL,RL),term(LL,LT),term(RL,RT),LT =:= RT.

term([X],X).
term(L,T) :- split(L,LL,RL), term(LL,LT), term(RL,RT), binterm(LT,RT,T).

binterm(LT,RT,LT+RT).
binterm(LT,RT,LT-RT).
binterm(LT,RT,LT*RT).
binterm(LT,RT,LT/RT) :- RT =\= 0.

split(L,L1,L2) :- append(L1,L2,L), L1 = [_|_], L2 = [_|_].
do(L) :-equation(L,LT,RT),write([LT,RT]), nl, fail.
do(_).

%Ex 8

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

diff(X,0,X).
diff(s(X),s(Y),Z) :- diff(X,Y,Z).

times(0,Y,0).
times(s(X),Y,Z):- times(X,Y,Z1), add(Y,Z1,Z).

div(0,Y).
div(Y,Y).
div(X,Y):- add(Y,U,X), div(U,Y).



