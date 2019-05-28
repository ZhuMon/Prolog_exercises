read_edge(0).
read_edge(N) :-
    read(A), read(B),
    assert(connect(A,B)),
    assert(connect(B,A)),
    N1 is N - 1,
    read_edge(N1).

is_connect_recursion(N, A, B) :-
    N > 0,
    connect(A, C),
    N1 is N - 1,
    (C is B; is_connect_recursion(N1, C, B)).

is_connect(A,B) :-
    node(E),
    is_connect_recursion(E, A, B).

read_query(0).
read_query(N) :-
    read(A), read(B),
    ((is_connect(A,B) -> assert(output(N,"Yes"))); assert(output(N, "No"))),
    N1 is N - 1,
    read_query(N1).

print_output(0).
print_output(N) :-
    output(N, A),
    write(A),nl,
    N1 is N - 1,
    print_output(N1).

:- read(N), read(E), assert(node(E)), read_edge(N), read(Q), read_query(Q), print_output(Q), halt.
