has_hash(Document, HexAtom):-
    sha_hash(Document, Hash, []),
    hash_atom(Hash, HexAtom).

proof_for(Document, Proof):-
    has_hash(Document, Hash),
    compare(=, Hash, Proof).

notarized(Document, X):-
    proof_for(Document, X).
