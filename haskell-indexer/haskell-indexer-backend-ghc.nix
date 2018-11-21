{ mkDerivation, base, bytestring, containers, directory, fetchgit
, filepath, ghc, ghc-paths, hashable, haskell-indexer-backend-core
, haskell-indexer-translate, HUnit, mtl, reflection, semigroups
, stdenv, temporary, test-framework, test-framework-hunit, text
, text-offset, transformers, unix, unordered-containers
}:
mkDerivation {
  pname = "haskell-indexer-backend-ghc";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-backend-ghc; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base containers directory filepath ghc ghc-paths hashable
    haskell-indexer-backend-core haskell-indexer-translate mtl
    reflection text transformers unix unordered-containers
  ];
  testHaskellDepends = [
    base bytestring directory filepath ghc haskell-indexer-backend-core
    haskell-indexer-translate HUnit semigroups temporary test-framework
    test-framework-hunit text text-offset transformers
  ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Indexing code using GHC API";
  license = stdenv.lib.licenses.asl20;
}
