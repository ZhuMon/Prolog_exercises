divisible(A,B) :- 
    A > B,
    R is truncate(A/B),
    A is B*R.

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

gold_bach_recursion(A, N, X, Y) :-
    N < A-1,
    N1 is N + 1,
    X1 is (A/2) - N1,
    Y1 is (A/2) + N1,
    ((is_prime(X1), is_prime(Y1), X is X1, Y is Y1);(gold_bach_recursion(A,N1,X,Y))).
    
gold_bach(A) :-
    N is 0,
    gold_bach_recursion(A, N, X, Y),
    write(X),write(" "),write(Y).
