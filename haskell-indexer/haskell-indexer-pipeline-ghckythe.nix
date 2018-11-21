{ mkDerivation, base, bytestring, conduit, fetchgit, filepath
, haskell-indexer-backend-core, haskell-indexer-backend-ghc
, haskell-indexer-frontend-kythe, haskell-indexer-translate
, kythe-schema, mmorph, mtl, stdenv, text
}:
mkDerivation {
  pname = "haskell-indexer-pipeline-ghckythe";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-pipeline-ghckythe; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring conduit filepath haskell-indexer-backend-core
    haskell-indexer-backend-ghc haskell-indexer-frontend-kythe
    haskell-indexer-translate kythe-schema mmorph mtl text
  ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Gets GHC invocation arguments and streams Kythe entries";
  license = stdenv.lib.licenses.asl20;
}
