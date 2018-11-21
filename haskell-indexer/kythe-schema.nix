{ mkDerivation, base, bytestring, data-default, fetchgit
, kythe-proto, lens-family, proto-lens, proto-lens-combinators
, stdenv, text
}:
mkDerivation {
  pname = "kythe-schema";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/mpickering/haskell-indexer.git";
    sha256 = "12cvmxrbx0cwwh1y91hdvlbzp8m6fd3xl3dszdqbc889ysi9wlbk";
    rev = "7622691f8fb9ebb020edf08679c41fcb7698f39d";
  };
  postUnpack = "sourceRoot+=/kythe-schema; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring data-default kythe-proto lens-family proto-lens
    proto-lens-combinators text
  ];
  homepage = "https://github.com/google/haskell-indexer";
  description = "Library for emitting Kythe schema entries";
  license = stdenv.lib.licenses.asl20;
}
