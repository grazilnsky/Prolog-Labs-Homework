elimimplic(X,X):-atom(X).
elimimplic([X, ->,Y], [[not, L], or, R]):-elimimplic(X,L), elimimplic(Y,R),!.
elimimplic([X, Op, Y], [L, Op, R]):-elimimplic(X,L), elimimplic(Y,R).


elimnot(X,X):-atom(X).
elimnot([not,[not,X]],L):-elimnot(X,L),!.
elimnot([not,[X,and,Y]],[[not,L],or,[not,R]]):-elimnot(X,L),elimnot(Y,R).
elimnot([not,[X,or,Y]],[[not,L],and,[not,R]]):-elimnot(X,L),elimnot(Y,R).
