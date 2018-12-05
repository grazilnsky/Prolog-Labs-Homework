evenlength([]).
oddlength([X]).
evenlength([X|L]):-oddlength(L).
oddlength([X|L]):-evenlength(L).

max(+X, +Y, -Max).
max(X, Y, X):-X>=Y, Max is X.
max(X, Y ,Y):-X<Y, Max is Y.

maxList([X], X).
maxList([X|L], M):-maxList(L,N), max(X, N, M).



split(+X,-PL,-NL).
split([],[],[]).
split([X|L],[X|L1],L2):-X>=0, split(L,L1,L2).
split([X|L],L1,[X|L2]):-X<0, split(L,L1,L2).

length(+X, -Len).
length([], 0).
length([X|L], Len):- length(L, Len), Len = Len +1.

divide(+X, -Odd, -Even).
divide([X], [X], []).
divide([X,Y],[X],[Y]).
divide([X,Y|L],[X|Odd], [Y|Even]):-divide(L, Odd, Even).
