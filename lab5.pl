myreverse([],[]).
myreverse([X],[X]).
myreverse([X|Xs],R):-myreverse(Xs,T), append(T,[X],R).

rotateleft([],R).
rotateleft([E|T],R):-append(T,[E],R).

rotation(L,_,0,L).
rotation(L,Dir,N,Res):-N>0,N1 is N-1,rot(L,Dir,L1),rotation(L1,Dir,N1,Res).
rot(L,st,L1):-rotst(L,L1).
rot(L,dr,L1):-rotdr(L,L1).
rotst([],[]).
rotst([X|R],L):-append(R,[X],L).
rotdr([],[]).
rotdr(L,[X|L1]):-ultim(L,L1,X).
ultim([X],[],X).
ultim([Y|R],[Y|L1],X):-ultim(R,L1,X).

subsetsum(L, S, Res) :-subset(L, Res),sum(Res, S).
sum([], 0).
sum([X | T], S) :-sum(T, TS),S is TS + X.
subset([], []).
subset([E|T], [E|NT]) :-subset(T, NT).
subset([_|T], NT) :-subset(T, NT).

%ex5
repeat([X, N], L) :-length(L, N),maplist(=(X), L).
decode(Encoded, Decoded) :-maplist(repeat, Encoded, Expanded),flatten(Expanded, Decoded).

%Ex6
count([],X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).
encode(List,X,C) :-sort(List,List1),member(X,List1),count(List,X,C).

%ex4
getAll(0,[]).
getAll(N,[N,Lis]):-N1 is N-1, getAll(N1,Lis).

