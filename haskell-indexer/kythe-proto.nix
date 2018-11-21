{ mkDerivation, base, Cabal, fetchgit, proto-lens-runtime
, proto-lens-setup, stdenv
}:
mkDerivation {
  pname = "kythe-proto";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/kythe-proto; echo source root reset to $sourceRoot";
  setupHaskellDepends = [ base Cabal proto-lens-setup ];
  libraryHaskellDepends = [ base proto-lens-runtime ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Proto bindings for Kythe protobufs";
  license = stdenv.lib.licenses.asl20;
}
