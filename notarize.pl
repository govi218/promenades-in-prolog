%% stores the SHA256 hash of Document in HexAtom
get_hash(Document, HexAtom):-
    sha_hash(Document, Hash, []),
    hash_atom(Hash, HexAtom).

%% writes the hash into the proof file as an atom 
% (needs to handle hashes that start with uppercase or numbers)
store_hash(Hash):-
    open('proofs.txt',write,Stream), 
    atom_concat(Hash, ".", Store),    
    write(Stream, Store),  nl(Stream), 
    close(Stream).

%% checks if there's a stored proof for the document
proof_for(Document):-
    get_hash(Document, Hash),
    open('proofs.txt',read,Str),
    read(Str, StoredHash), 
    compare(=, Hash, StoredHash),
    close(Str),
    write(StoredHash),  nl.

%% stores a proof for a document
notarize(Document):-
    get_hash(Document, Hash),
    store_hash(Hash).
