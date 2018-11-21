{ mkDerivation, base, directory, fetchgit, filepath, ghc
, haskell-indexer-backend-core, haskell-indexer-backend-ghc
, haskell-indexer-frontend-kythe
, haskell-indexer-pipeline-ghckythe-wrapper
, haskell-indexer-translate, stdenv
}:
mkDerivation {
  pname = "haskell-indexer-plugin";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-plugin; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base directory filepath ghc haskell-indexer-backend-core
    haskell-indexer-backend-ghc haskell-indexer-frontend-kythe
    haskell-indexer-pipeline-ghckythe-wrapper haskell-indexer-translate
  ];
  license = stdenv.lib.licenses.bsd3;
}
