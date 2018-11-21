let
  _pin = import ./nixpkgs.nix;

    nur = import (builtins.fetchTarball { url = "https://github.com/nix-community/NUR/archive/6ce3bbcfe7e1c599ec7a162eb61cd3d17ecfcc93.tar.gz";
                                          sha256 = "1nxcqlcvhpaa74xikhlnskxnjqpq5cpxj34l1aqqy0scfrjzwmkl";}) {
      pkgs = nixpkgs;
  };

  # Using NUR
  overlay = nur.repos.mpickering.overlays.haskell-plugins;
  nixpkgs = _pin { overlays = [ overlay ]; };

  hp = nixpkgs.haskell.packages.ghc861.override{ overrides = ho; };

  ho = nixpkgs.lib.composeExtensions hi-overlay haskell-overlay;

  hi-overlay = import ./haskell-indexer/hi.nix;

  haskell-overlay = self: super: {
                      lens-labels = self.lens-labels_0_3_0_1;
                      proto-lens-protoc = self.proto-lens-protoc_0_4_0_1;
                      proto-lens = self.proto-lens_0_4_0_1;
                      proto-lens-combinators = nixpkgs.haskell.lib.addBuildTool super.proto-lens-combinators_0_4_0_1 nixpkgs.protobuf;
                      proto-lens-protobuf-types = self.proto-lens-protobuf-types_0_4_0_1;
                      kythe-proto = nixpkgs.haskell.lib.addBuildTool super.kythe-proto nixpkgs.protobuf;


                  };


  haskell-indexer = { pluginPackage = hp.haskell-indexer-plugin ;
                      pluginName = "Haskell.Indexer.Plugin";
                      pluginOpts = ({outpath, pkg}: ["-o" "${outpath}/cache"
                                                    "-c" pkg.name
                                                    ]);
                      pluginDepends = [ nixpkgs.kythe ];
                      initPhase = {outpath,...}: ''
                        mkdir -p ${outpath}/cache
                        ''; };


  wrapper = nixpkgs.callPackage ./wrapper.nix {};


  addI = p: let pack = nixpkgs.haskell.lib.addPlugin haskell-indexer p;
         in [pack.out pack.pluginHaskellIndexerPlugin];

  allPackages = pkgs:
    let all_pkgs = pkgs ++ (nixpkgs.lib.concatMap nixpkgs.haskell.lib.getHaskellBuildInputs pkgs);
    in nixpkgs.lib.concatMap addI all_pkgs;



  ghcWithIndexes = f:

    let raw = hp.ghcWithPackages (ps:  allPackages (f ps));
    in nixpkgs.symlinkJoin { name = raw.name; paths = [raw (wrapper (make_tables raw))]; };


  make_tables = hp:
    nixpkgs.runCommand "make_tables" {} ''
      mkdir -p $out
      ls ${hp}/cache
      for i in ${hp}/cache/*; do
        echo $i
#        cat $i | ${nixpkgs.kythe}/bin/verifier -use_file_nodes -alsologtostderr -ignore-dups
        ${nixpkgs.kythe}/bin/write_entries --graphstore $out/gs < $i
      done
      ${nixpkgs.kythe}/tools/write_tables --graphstore $out/gs --out $out/tables
      '';




  output3 = ghcWithIndexes (ps: [ps.either]);


in
 nixpkgs.mkShell { buildInputs = [(output3)]; }

