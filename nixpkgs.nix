import (builtins.fetchTarball {
  # Descriptive name to make the store path easier to identify
  name = "mpickering-haskell-indexer-nix-2018-11-21";
  # Commit hash for nixos-unstable as of 2018-09-12
  url = https://github.com/mpickering/nixpkgs/archive/1216a71a1e29397438ef016cc94e335c0f30ff87.tar.gz;
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "17dh56fkws9viqip636fp7cn0vsdzyb85wc04glji9a212rqiqp1";
})
