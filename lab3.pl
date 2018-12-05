sum(+L,-S).
sum1(+L,-S).
noelem(+L,-S).
merge(+L1,+L2,-ResultList).
erase(+L1,Elem,-Res).
dupl(+L1,-Res).
intersection().

sum([],0).
sum([X|L],S):-sum(L,S1),S is S1+X.

sum1(L,S):-sum1(L,0,S).
sum1([],S,S).
sum1([X|R],S,Res):-S1 is S+X,sum1(R,S1,Res).

noelem([],0).
noelem([X|L],S):-noelem(L,T),S is T+1.

merge([X|L1],[],[X|L1]).
merge([],[Y|L2],[Y|L2]).
merge([X|L1],[Y|L2],[X|Res]):-X<Y,merge(L1,[Y|L2],Res).
merge([X|L1],[Y|L2],[Y|Res]):-X>=Y,merge([X|L1],L2,Res).
merge([X|L1],[Y|L2],[X|Res]):-X=Y,merge(L1,L2,Res).

erase([],Elem,[]).
erase([X|L],Elem,[X|Res]):-X\=Elem,erase(L,Elem,Res).
erase([X|L],Elem,Res):-X=Elem,erase(L,Elem,Res).

dupl([],[]).
dupl([X|L],[X|Res]):-dupl(L,Res),not(member(X,L)).
dupl([X|L],Res):-dupl(L,Res),member(X,L).

flag([X,Y,Z]):-member(X,[red,green,white,yellow,blue]),(Y=yellow;Y=green),member(Z,[red,green,white,yellow,blue]),X\=Y,Y=\Z,X\=Z.
%ex7
intersection([],L2,[]).
intersection([X|L1],L2,[X|Res]):-intersection(L1,L2,Res),member(X,L2).
intersection([X|L1],L2,Res):-intersection(L1,L2,Res),not member(X,L2).




