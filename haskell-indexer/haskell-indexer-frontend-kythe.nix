{ mkDerivation, base, bytestring, conduit, fetchgit
, haskell-indexer-translate, kythe-schema, mmorph, mtl, stdenv
, text, text-offset, transformers
}:
mkDerivation {
  pname = "haskell-indexer-frontend-kythe";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-frontend-kythe; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring conduit haskell-indexer-translate kythe-schema
    mmorph mtl text text-offset transformers
  ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Emits Kythe schema based on translation layer data";
  license = stdenv.lib.licenses.asl20;
}
