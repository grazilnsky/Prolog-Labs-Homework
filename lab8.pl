%Ex1

propVarList([p,q,r,s,t,u,v,z]).
propVar(Var):-propVarList(X), member(Var, X).
binaryConList([and,or,<->,->]).
binCon(Con):-binaryConList(X), member(Con, X).

wellFormed(X):-propVar(X).
wellFormed([not,P]):-wellFormed(P).
wellFormed([P,X,Q]):-binCon(X),wellFormed(P),wellFormed(Q).


%Ex 2
%combination(2,[a,b,c,d],L).
combination(0, _, []) :-!.
combination(N, L, [V|R]) :- N > 0,NN is N - 1,unknown(V, L, Rem), combination(NN, Rem, R).

unknown(X,[X|L],L).
unknown(X,[_|L],R) :-unknown(X,L,R).

%Ex3

replace(_,_,[],[]).
replace(E, S, [E|L1], [S|L2]):-replace(E,S,L1,L2),!.
replace(E, S, [H|L1], [H|L2]):- \+ is_list(H), replace(E,S,L1,L2).
replace(E,S,[H1|L1],[H2|L2]):-replace(E,S,H1,H2), replace(E,S,L1,L2).

%Ex4

