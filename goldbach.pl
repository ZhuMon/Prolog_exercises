divisible(A,B) :- 
    A > B,
    0 is mod(A,B).

is_prime_recursion(_,1).
is_prime_recursion(A,X) :-
    X > 1,
    \+ divisible(A,X),
    X1 is X - 1,
    is_prime_recursion(A,X1).

is_prime(2).
is_prime(A) :-
    A > 2,
    X is A-1,
    \+ divisible(A,X),
    is_prime_recursion(A, X).

gold_bach_recursion(_, -1).
gold_bach_recursion(A, N) :-
    N >= 0,
    X1 is (A/2) - N,
    Y1 is (A/2) + N,
    N1 is N - 1,
    ((is_prime(X1), is_prime(Y1), assert(output(X1,Y1)),gold_bach_recursion(A,N1));gold_bach_recursion(A,N1)).
    
print_output([],[]).
print_output(L1, L2):-
    L1 = [A1|B1],
    L2 = [A2|B2],
    write(A1), write(" "), write(A2), nl,
    print_output(B1,B2).

gold_bach(A) :-
    divisible(A,2), % check A is even
    N is A/2,
    gold_bach_recursion(A, N),
    findall(X, output(X,Y), L1),
    findall(Y, output(X,Y), L2),
    print_output(L1,L2).

:- read(A), gold_bach(A), halt.


