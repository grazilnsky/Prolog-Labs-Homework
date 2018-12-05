%ex1

yesterday(monday, tuesday).
yesterday(tuesday, wednesday).
yesterday(wednesday, thursday).
yesterday(thursday, friday).
yesterday(friday, saturday).
yesterday(saturday, sunday).
yesterday(sunday, monday).

lies(lion, L1):- L = [monday, tuesday, wednesday], member(L1, L).
lies(unicorn, L2):- L = [tuesday, friday, saturday], member(L2, L).

truth(lion, L1):- L = [thursday, friday, saturday, sunday], member(L1, L).
truth(unicorn, L2):- L = [monday, wednesday, thursday, sunday], member(L2, L).

today(T):-yesterday(Y,T), ((lies(lion, Y), truth(lion, T));((lies(lion, T), truth(lion,Y))), ((lies(unicorn, Y), truth(unicorn, T)); ((lies(unicorn, T), truth(unicorn, Y))))).
%ex3

%before(X,Y,L):-append(_, [X|R], L), append(_,[Y|_], R).
%func to be used in ex 3 and 4

competitions(S,B):-S=[[_,1],[_,2],[_,3],[_,4]],B=[[_,1],[_,2],[_,3],[_,4]],
    member([X,1],S),member([X,3],B),
    member([andrew,A1],S),member([corey,C1],S),A1<C1,
    member([andrew,A2],B),member([corey,C2],B),A2>C2,
    member([dan,1],B),
    member([dan,D1],S),member([sandy,S1],S),D1>S1,
    not(member([andrew,1],S)),not(member([andrew,1],B)),
    not(member([corey,4],S)),not(member([corey,4],B)),
    member([sandy,_],B).

%Ex4

couples(C):-C=[[_,_,_,_,1],[_,_,_,_,2],[_,_,_,_,3],[_,_,_,_,4]],
    member([_,cat,matt,_,3],C),
    (member([_,_,_,bear,1],C);member([_,_,_,bear,2],C)),
    member([_,_,vince,_,X],C),member([_,_,_,prince,Y],C),X>1,X<Y,
    member([_,witch,chuck,donaldduck,_],C),
    member([mary,_,_,_,P1],C),member([_,_,lou,_,P2],C),member([sue,_,_,_,P3],C),P1>P2,P3>P1,
    member([_,gipsy,_,_,K],C),member([ann,_,_,_,Z],C),K<Z,
    member([_,snowwhite,_,_,W],C),member([tess,_,_,_,Q],C),Q<W,
    member([_,_,_,batman,_],C),
    not(member([_,gipsy,_,batman,_],C)),not(member([ann,_,_,batman,_],C)),
    not(member([sue,witch,_,_,_],C)).

%Boys: chuck, lou, matt, vince
%boys' costumes: batman, bear, donald-duck, prince
%girls: ann, mary, sue, tess
%girls costumes: cat, gypsy, snow-white, witch
