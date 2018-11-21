
self: super: {
kythe-proto = self.callPackage ./kythe-proto.nix {};
haskell-indexer-backend-core = self.callPackage ./haskell-indexer-backend-core.nix {};
haskell-indexer-backend-ghc = self.callPackage ./haskell-indexer-backend-ghc.nix {};
haskell-indexer-frontend-kythe = self.callPackage ./haskell-indexer-frontend-kythe.nix {};
haskell-indexer-pathutil = self.callPackage ./haskell-indexer-pathutil.nix {};
haskell-indexer-pipeline-ghckythe = self.callPackage ./haskell-indexer-pipeline-ghckythe.nix {};
haskell-indexer-pipeline-ghckythe-wrapper = self.callPackage ./haskell-indexer-pipeline-ghckythe-wrapper.nix {};
haskell-indexer-plugin = self.callPackage ./haskell-indexer-plugin.nix {};
haskell-indexer-translate = self.callPackage ./haskell-indexer-translate.nix {};
kythe-schema = self.callPackage ./kythe-schema.nix {};
text-offset = self.callPackage ./text-offset.nix {};
}
