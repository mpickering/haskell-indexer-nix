{ mkDerivation, base, bytestring, fetchgit
, haskell-indexer-backend-core, haskell-indexer-backend-ghc
, haskell-indexer-pathutil, haskell-indexer-pipeline-ghckythe
, haskell-indexer-translate, kythe-schema, optparse-applicative
, proto-lens, stdenv, text
}:
mkDerivation {
  pname = "haskell-indexer-pipeline-ghckythe-wrapper";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-pipeline-ghckythe-wrapper; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring haskell-indexer-backend-core
    haskell-indexer-backend-ghc haskell-indexer-pathutil
    haskell-indexer-pipeline-ghckythe haskell-indexer-translate
    kythe-schema optparse-applicative proto-lens text
  ];
  executableHaskellDepends = [ base ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Executable able to take GHC arguments and emitting Kythe entries";
  license = stdenv.lib.licenses.asl20;
}
