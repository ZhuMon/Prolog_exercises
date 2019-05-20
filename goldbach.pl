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

gold_bach(A, N) :-
    X is (A/2) + N,
    Y is (A/2) - N,
    is_prime(X),
    is_prime(Y).
