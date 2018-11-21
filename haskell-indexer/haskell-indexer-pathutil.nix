{ mkDerivation, base, fetchgit, filepath, stdenv, text }:
mkDerivation {
  pname = "haskell-indexer-pathutil";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/haskell-indexer-pathutil; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [ base filepath text ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Utilities for dealing with filepaths";
  license = stdenv.lib.licenses.asl20;
}
