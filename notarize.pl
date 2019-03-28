get_hash(Document, HexAtom):-
    sha_hash(Document, Hash, []),
    hash_atom(Hash, HexAtom).

store_hash(Hash):-
    open('proofs.txt',write,Stream), 
    atom_concat(Hash, ".", Store),    
    write(Stream, Store),  nl(Stream), 
    close(Stream).

proof_for(Document):-
    get_hash(Document, Hash),
    open('proofs.txt',read,Str),
    read(Str, StoredHash), 
    compare(=, Hash, StoredHash),
    close(Str),
    write(StoredHash),  nl.

notarize(Document):-
    get_hash(Document, Hash),
    store_hash(Hash).
