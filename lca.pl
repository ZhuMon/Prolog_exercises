repeat_read(1).
repeat_read(N) :-
    read(A), read(B),
    assert(parent(A,B)),
    N1 is N - 1,
    repeat_read(N1).

is_ancestor(A, C) :-
    parent(P, C),
    (A is P;is_ancestor(A, P)).

lca(0).
lca(N) :-
    read(A), read(B),
    ((is_ancestor(A,B),C is A);
        (is_ancestor(B,A), C is B);
            lca_recursion(A,B,C)),
    assert(output(N, C)),
    N1 is N - 1,
    lca(N1).

lca_recursion(A,B,C) :-
    parent(P, A),
    ((is_ancestor(P, B), C is P);lca_recursion(P, B, C)).
    
print_output(0).
print_output(N) :-
    output(N, C),
    write(C),
    nl,
    N1 is N -1,
    print_output(N1).

:- read(N), repeat_read(N), read(M), lca(M), print_output(M), halt.
